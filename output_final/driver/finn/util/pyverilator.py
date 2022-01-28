# Copyright (c) 2021, Xilinx
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# * Redistributions of source code must retain the above copyright notice, this
#   list of conditions and the following disclaimer.
#
# * Redistributions in binary form must reproduce the above copyright notice,
#   this list of conditions and the following disclaimer in the documentation
#   and/or other materials provided with the distribution.
#
# * Neither the name of FINN nor the names of its
#   contributors may be used to endorse or promote products derived from
#   this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
# DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
# FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
# DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
# SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
# CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
# OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

import os

from finn.util.basic import get_rtlsim_trace_depth, make_build_dir

try:
    from pyverilator import PyVerilator
except ModuleNotFoundError:
    PyVerilator = None


def pyverilate_get_liveness_threshold_cycles():
    """Return the number of no-output cycles rtlsim will wait before assuming
    the simulation is not finishing and throwing an exception."""

    return int(os.getenv("LIVENESS_THRESHOLD", 10000))


def rtlsim_multi_io(sim, io_dict, num_out_values, trace_file="", sname="_V_V_"):
    """Runs the pyverilator simulation by passing the input values to the simulation,
    toggle the clock and observing the execution time. Function contains also an
    observation loop that can abort the simulation if no output value is produced
    after a set number of cycles. Can handle multiple i/o streams. See function
    implementation for details on how the top-level signals should be named.

    Arguments:

    * sim: the PyVerilator object for simulation
    * io_dict: a dict of dicts in the following format:
      {"inputs" : {"in0" : <input_data>, "in1" : <input_data>},
      "outputs" : {"out0" : [], "out1" : []} }
      <input_data> is a list of Python arbitrary-precision ints indicating
      what data to push into the simulation, and the output lists are
      similarly filled when the simulation is complete
    * num_out_values: number of total values to be read from the simulation to
      finish the simulation and return.
    * trace_file: vcd dump filename, empty string (no vcd dump) by default
    * sname: signal naming for streams, "_V_V_" by default, vitis_hls uses "_V_"

    Returns: number of clock cycles elapsed for completion

    """

    if trace_file != "":
        sim.start_vcd_trace(trace_file)

    for outp in io_dict["outputs"]:
        _write_signal(sim, outp + sname + "TREADY", 1)

    # observe if output is completely calculated
    # total_cycle_count will contain the number of cycles the calculation ran
    output_done = False
    total_cycle_count = 0
    output_count = 0
    old_output_count = 0

    # avoid infinite looping of simulation by aborting when there is no change in
    # output values after 100 cycles
    no_change_count = 0
    liveness_threshold = pyverilate_get_liveness_threshold_cycles()

    while not (output_done):
        for inp in io_dict["inputs"]:
            inputs = io_dict["inputs"][inp]
            _write_signal(sim, inp + sname + "TVALID", 1 if len(inputs) > 0 else 0)
            _write_signal(
                sim, inp + sname + "TDATA", inputs[0] if len(inputs) > 0 else 0
            )
            if (
                _read_signal(sim, inp + sname + "TREADY") == 1
                and _read_signal(sim, inp + sname + "TVALID") == 1
            ):
                inputs = inputs[1:]
            io_dict["inputs"][inp] = inputs

        for outp in io_dict["outputs"]:
            outputs = io_dict["outputs"][outp]
            if (
                _read_signal(sim, outp + sname + "TREADY") == 1
                and _read_signal(sim, outp + sname + "TVALID") == 1
            ):
                outputs = outputs + [_read_signal(sim, outp + sname + "TDATA")]
                output_count += 1
            io_dict["outputs"][outp] = outputs

        toggle_clk(sim)

        total_cycle_count = total_cycle_count + 1

        if output_count == old_output_count:
            no_change_count = no_change_count + 1
        else:
            no_change_count = 0
            old_output_count = output_count

        # check if all expected output words received
        if output_count == num_out_values:
            output_done = True

        # end sim on timeout
        if no_change_count == liveness_threshold:
            if trace_file != "":
                sim.flush_vcd_trace()
                sim.stop_vcd_trace()
            raise Exception(
                "Error in simulation! Takes too long to produce output. "
                "Consider setting the LIVENESS_THRESHOLD env.var. to a "
                "larger value."
            )

    if trace_file != "":
        sim.flush_vcd_trace()
        sim.stop_vcd_trace()

    return total_cycle_count


def pyverilate_stitched_ip(
    model,
    read_internal_signals=True,
    disable_common_warnings=True,
    extra_verilator_args=[],
):
    """Given a model with stitched IP, return a PyVerilator sim object.
    Trace depth is also controllable, see get_rtlsim_trace_depth()

    :param read_internal_signals  If set, it will be possible to examine the
        internal (not only port) signals of the Verilog module, but this may
        slow down compilation and emulation.

    :param disable_common_warnings If set, disable the set of warnings that
        Vivado-HLS-generated Verilog typically triggers in Verilator
        (which can be very verbose otherwise)

    """
    if PyVerilator is None:
        raise ImportError("Installation of PyVerilator is required.")

    vivado_stitch_proj_dir = model.get_metadata_prop("vivado_stitch_proj")
    with open(vivado_stitch_proj_dir + "/all_verilog_srcs.txt", "r") as f:
        all_verilog_srcs = f.read().split()

    def file_to_dir(x):
        return os.path.dirname(os.path.realpath(x))

    def file_to_basename(x):
        return os.path.basename(os.path.realpath(x))

    top_module_file_name = file_to_basename(model.get_metadata_prop("wrapper_filename"))
    top_module_name = top_module_file_name.strip(".v")
    build_dir = make_build_dir("pyverilator_ipstitched_")

    # dump all Verilog code to a single file
    # this is because large models with many files require
    # a verilator command line too long for bash on most systems
    # NOTE: there are duplicates in this list, and some files
    # are identical but in multiple directories (regslice_core.v)

    # remove duplicates from list by doing list -> set -> list
    all_verilog_files = list(set(filter(lambda x: x.endswith(".v"), all_verilog_srcs)))

    # remove all but one instances of regslice_core.v
    filtered_verilog_files = []
    remove_entry = False
    for vfile in all_verilog_files:
        if "regslice_core" in vfile:
            if not remove_entry:
                filtered_verilog_files.append(vfile)
            remove_entry = True
        else:
            filtered_verilog_files.append(vfile)

    # concatenate all verilog code into a single file
    with open(vivado_stitch_proj_dir + "/" + top_module_file_name, "w") as wf:
        for vfile in filtered_verilog_files:
            with open(vfile) as rf:
                wf.write("//Added from " + vfile + "\n\n")
                wf.write(rf.read())

    verilator_args = []
    # disable common verilator warnings that should be harmless but commonly occur
    # in large quantities for Vivado HLS-generated verilog code
    if disable_common_warnings:
        verilator_args += ["-Wno-STMTDLY"]
        verilator_args += ["-Wno-PINMISSING"]
        verilator_args += ["-Wno-IMPLICIT"]
        verilator_args += ["-Wno-WIDTH"]
        verilator_args += ["-Wno-COMBDLY"]
    # force inlining of all submodules to ensure we can read internal signals properly
    if read_internal_signals:
        verilator_args += ["--inline-mult", "0"]

    sim = PyVerilator.build(
        top_module_file_name,
        verilog_path=[vivado_stitch_proj_dir],
        build_dir=build_dir,
        trace_depth=get_rtlsim_trace_depth(),
        top_module_name=top_module_name,
        auto_eval=False,
        read_internal_signals=read_internal_signals,
        extra_args=verilator_args + extra_verilator_args,
    )
    return sim


def _find_signal(sim, signal_name):
    # handle both mixed caps and lowercase signal names
    if signal_name in sim.io:
        return signal_name
    elif signal_name.lower() in sim.io:
        return signal_name.lower()
    else:
        raise Exception("Signal not found: " + signal_name)


def _read_signal(sim, signal_name):
    signal_name = _find_signal(sim, signal_name)
    return sim.io[signal_name]


def _write_signal(sim, signal_name, signal_value):
    signal_name = _find_signal(sim, signal_name)
    sim.io[signal_name] = signal_value


def reset_rtlsim(sim, rst_name="ap_rst_n", active_low=True):
    """Sets reset input in pyverilator to zero, toggles the clock and set it
    back to one"""
    _write_signal(sim, rst_name, 0 if active_low else 1)
    toggle_clk(sim)
    toggle_clk(sim)
    _write_signal(sim, rst_name, 1 if active_low else 0)
    toggle_clk(sim)
    toggle_clk(sim)


def toggle_clk(sim, clk_name="ap_clk"):
    """Toggles the clock input in pyverilator once."""
    _write_signal(sim, clk_name, 0)
    sim.eval()
    _write_signal(sim, clk_name, 1)
    sim.eval()


def wait_for_handshake(sim, ifname, basename="s_axi_control_", dataname="DATA"):
    """Wait for handshake (READY and VALID high at the same time) on given
    interface on PyVerilator sim object.

    Arguments:
    - sim : PyVerilator sim object
    - ifname : name for decoupled interface to wait for handshake on
    - basename : prefix for decoupled interface name
    - dataname : interface data sig name, will be return value if it exists

    Returns: value of interface data signal during handshake (if given by dataname),
    None otherwise (e.g. if there is no data signal associated with interface)
    """
    ret = None
    while 1:
        hs = (
            _read_signal(sim, basename + ifname + "READY") == 1
            and _read_signal(sim, basename + ifname + "VALID") == 1
        )
        try:
            ret = _read_signal(sim, basename + ifname + dataname)
        except Exception:
            ret = None
        toggle_clk(sim)
        if hs:
            break
    return ret


def multi_handshake(sim, ifnames, basename="s_axi_control_"):
    """Perform a handshake on list of interfaces given by ifnames. Will assert
    VALID and de-assert after READY observed, in as few cycles as possible."""

    done = []
    for ifname in ifnames:
        _write_signal(sim, basename + ifname + "VALID", 1)
    while len(ifnames) > 0:
        for ifname in ifnames:
            if (
                _read_signal(sim, basename + ifname + "READY") == 1
                and _read_signal(sim, basename + ifname + "VALID") == 1
            ):
                done.append(ifname)
        toggle_clk(sim)
        for ifname in done:
            if ifname in ifnames:
                ifnames.remove(ifname)
            _write_signal(sim, basename + ifname + "VALID", 0)


def axilite_write(
    sim, addr, val, basename="s_axi_control_", wstrb=0xF, sim_addr_and_data=True
):
    """Write val to addr on AXI lite interface given by basename.

    Arguments:
    - sim : PyVerilator sim object
    - addr : address for write
    - val : value to be written at addr
    - basename : prefix for AXI lite interface name
    - wstrb : write strobe value to do partial writes, see AXI protocol reference
    - sim_addr_and_data : handshake AW and W channels simultaneously
    """
    _write_signal(sim, basename + "WSTRB", wstrb)
    _write_signal(sim, basename + "WDATA", val)
    _write_signal(sim, basename + "AWADDR", addr)
    if sim_addr_and_data:
        multi_handshake(sim, ["AW", "W"], basename=basename)
    else:
        _write_signal(sim, basename + "AWVALID", 1)
        wait_for_handshake(sim, "AW", basename=basename)
        # write request done
        _write_signal(sim, basename + "AWVALID", 0)
        # write data
        _write_signal(sim, basename + "WVALID", 1)
        wait_for_handshake(sim, "W", basename=basename)
        # write data OK
        _write_signal(sim, basename + "WVALID", 0)
    # wait for write response
    _write_signal(sim, basename + "BREADY", 1)
    wait_for_handshake(sim, "B", basename=basename)
    # write response OK
    _write_signal(sim, basename + "BREADY", 0)


def axilite_read(sim, addr, basename="s_axi_control_"):
    """Read val from addr on AXI lite interface given by basename.

    Arguments:
    - sim : PyVerilator sim object
    - addr : address for read
    - basename : prefix for AXI lite interface name

    Returns: read value from AXI lite interface at given addr
    """
    _write_signal(sim, basename + "ARADDR", addr)
    _write_signal(sim, basename + "ARVALID", 1)
    wait_for_handshake(sim, "AR", basename=basename)
    # read request OK
    _write_signal(sim, basename + "ARVALID", 0)
    # wait for read response
    _write_signal(sim, basename + "RREADY", 1)
    ret_data = wait_for_handshake(sim, "R", basename=basename)
    _write_signal(sim, basename + "RREADY", 0)
    return ret_data
