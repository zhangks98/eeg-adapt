
################################################################
# This is a generated script based on design: finn_design
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2019.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_msg_id "BD_TCL-109" "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source finn_design_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z020clg400-1
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name finn_design

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_msg_id "BD_TCL-001" "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_msg_id "BD_TCL-002" "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_msg_id "BD_TCL-003" "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_msg_id "BD_TCL-004" "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

common::send_msg_id "BD_TCL-005" "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_msg_id "BD_TCL-114" "ERROR" $errMsg}
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: StreamingFIFO_22
proc create_hier_cell_StreamingFIFO_22 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_StreamingFIFO_22() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 in0_V_V

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 out_V_V


  # Create pins
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -type rst ap_rst_n

  # Create instance: fifo, and set properties
  set fifo [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 fifo ]
  set_property -dict [ list \
   CONFIG.FIFO_DEPTH {512} \
   CONFIG.FIFO_MEMORY_TYPE {auto} \
   CONFIG.TDATA_NUM_BYTES {10} \
 ] $fifo

  # Create interface connections
  connect_bd_intf_net -intf_net fifo_M_AXIS [get_bd_intf_pins out_V_V] [get_bd_intf_pins fifo/M_AXIS]
  connect_bd_intf_net -intf_net in0_V_V_1 [get_bd_intf_pins in0_V_V] [get_bd_intf_pins fifo/S_AXIS]

  # Create port connections
  connect_bd_net -net ap_clk_1 [get_bd_pins ap_clk] [get_bd_pins fifo/s_axis_aclk]
  connect_bd_net -net ap_rst_n_1 [get_bd_pins ap_rst_n] [get_bd_pins fifo/s_axis_aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: StreamingFCLayer_Batch_3
proc create_hier_cell_StreamingFCLayer_Batch_3 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_StreamingFCLayer_Batch_3() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 in0_V_V

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 out_V_V


  # Create pins
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -type rst ap_rst_n

  # Create instance: StreamingFCLayer_Batch_3, and set properties
  set StreamingFCLayer_Batch_3 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFCLayer_Batch_3:1.0 StreamingFCLayer_Batch_3 ]

  # Create instance: StreamingFCLayer_Batch_3_wstrm, and set properties
  set StreamingFCLayer_Batch_3_wstrm [ create_bd_cell -type ip -vlnv xilinx.com:user:memstream:1.0 StreamingFCLayer_Batch_3_wstrm ]
  set_property -dict [ list \
   CONFIG.MEM_DEPTH {200} \
   CONFIG.MEM_INIT {/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_3_ew1h8sel/} \
   CONFIG.MEM_WIDTH {8} \
   CONFIG.NSTREAMS {1} \
   CONFIG.RAM_STYLE {auto} \
   CONFIG.STRM0_DEPTH {200} \
   CONFIG.STRM0_OFFSET {0} \
   CONFIG.STRM0_WIDTH {8} \
 ] $StreamingFCLayer_Batch_3_wstrm

  # Create interface connections
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_3_out_V_V [get_bd_intf_pins out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_3/out_V_V]
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_3_wstrm_m_axis_0 [get_bd_intf_pins StreamingFCLayer_Batch_3/weights_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_3_wstrm/m_axis_0]
  connect_bd_intf_net -intf_net in0_V_V_1 [get_bd_intf_pins in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_3/in0_V_V]

  # Create port connections
  connect_bd_net -net ap_clk_1 [get_bd_pins ap_clk] [get_bd_pins StreamingFCLayer_Batch_3/ap_clk] [get_bd_pins StreamingFCLayer_Batch_3_wstrm/aclk]
  connect_bd_net -net ap_rst_n_1 [get_bd_pins ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_3/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_3_wstrm/aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: StreamingFCLayer_Batch_2
proc create_hier_cell_StreamingFCLayer_Batch_2 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_StreamingFCLayer_Batch_2() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 in0_V_V

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 out_V_V


  # Create pins
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -type rst ap_rst_n

  # Create instance: StreamingFCLayer_Batch_2, and set properties
  set StreamingFCLayer_Batch_2 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFCLayer_Batch_2:1.0 StreamingFCLayer_Batch_2 ]

  # Create instance: StreamingFCLayer_Batch_2_wstrm, and set properties
  set StreamingFCLayer_Batch_2_wstrm [ create_bd_cell -type ip -vlnv xilinx.com:user:memstream:1.0 StreamingFCLayer_Batch_2_wstrm ]
  set_property -dict [ list \
   CONFIG.MEM_DEPTH {18000} \
   CONFIG.MEM_INIT {/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_2_iaqji5ia/} \
   CONFIG.MEM_WIDTH {80} \
   CONFIG.NSTREAMS {1} \
   CONFIG.RAM_STYLE {auto} \
   CONFIG.STRM0_DEPTH {18000} \
   CONFIG.STRM0_OFFSET {0} \
   CONFIG.STRM0_WIDTH {80} \
 ] $StreamingFCLayer_Batch_2_wstrm

  # Create interface connections
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_2_out_V_V [get_bd_intf_pins out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_2/out_V_V]
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_2_wstrm_m_axis_0 [get_bd_intf_pins StreamingFCLayer_Batch_2/weights_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_2_wstrm/m_axis_0]
  connect_bd_intf_net -intf_net in0_V_V_1 [get_bd_intf_pins in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_2/in0_V_V]

  # Create port connections
  connect_bd_net -net ap_clk_1 [get_bd_pins ap_clk] [get_bd_pins StreamingFCLayer_Batch_2/ap_clk] [get_bd_pins StreamingFCLayer_Batch_2_wstrm/aclk]
  connect_bd_net -net ap_rst_n_1 [get_bd_pins ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_2/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_2_wstrm/aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: StreamingFCLayer_Batch_1
proc create_hier_cell_StreamingFCLayer_Batch_1 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_StreamingFCLayer_Batch_1() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 in0_V_V

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 out_V_V


  # Create pins
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -type rst ap_rst_n

  # Create instance: StreamingFCLayer_Batch_1, and set properties
  set StreamingFCLayer_Batch_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFCLayer_Batch_1:1.0 StreamingFCLayer_Batch_1 ]

  # Create instance: StreamingFCLayer_Batch_1_wstrm, and set properties
  set StreamingFCLayer_Batch_1_wstrm [ create_bd_cell -type ip -vlnv xilinx.com:user:memstream:1.0 StreamingFCLayer_Batch_1_wstrm ]
  set_property -dict [ list \
   CONFIG.MEM_DEPTH {1125} \
   CONFIG.MEM_INIT {/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_1_ey_wc87u/} \
   CONFIG.MEM_WIDTH {320} \
   CONFIG.NSTREAMS {1} \
   CONFIG.RAM_STYLE {auto} \
   CONFIG.STRM0_DEPTH {1125} \
   CONFIG.STRM0_OFFSET {0} \
   CONFIG.STRM0_WIDTH {320} \
 ] $StreamingFCLayer_Batch_1_wstrm

  # Create interface connections
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_1_out_V_V [get_bd_intf_pins out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_1/out_V_V]
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_1_wstrm_m_axis_0 [get_bd_intf_pins StreamingFCLayer_Batch_1/weights_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_1_wstrm/m_axis_0]
  connect_bd_intf_net -intf_net in0_V_V_1 [get_bd_intf_pins in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_1/in0_V_V]

  # Create port connections
  connect_bd_net -net ap_clk_1 [get_bd_pins ap_clk] [get_bd_pins StreamingFCLayer_Batch_1/ap_clk] [get_bd_pins StreamingFCLayer_Batch_1_wstrm/aclk]
  connect_bd_net -net ap_rst_n_1 [get_bd_pins ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_1/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_1_wstrm/aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}

# Hierarchical cell: StreamingFCLayer_Batch_0
proc create_hier_cell_StreamingFCLayer_Batch_0 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_msg_id "BD_TCL-102" "ERROR" "create_hier_cell_StreamingFCLayer_Batch_0() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 in0_V_V

  create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 out_V_V


  # Create pins
  create_bd_pin -dir I -type clk ap_clk
  create_bd_pin -dir I -type rst ap_rst_n

  # Create instance: StreamingFCLayer_Batch_0, and set properties
  set StreamingFCLayer_Batch_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFCLayer_Batch_0:1.0 StreamingFCLayer_Batch_0 ]

  # Create instance: StreamingFCLayer_Batch_0_wstrm, and set properties
  set StreamingFCLayer_Batch_0_wstrm [ create_bd_cell -type ip -vlnv xilinx.com:user:memstream:1.0 StreamingFCLayer_Batch_0_wstrm ]
  set_property -dict [ list \
   CONFIG.MEM_DEPTH {250} \
   CONFIG.MEM_INIT {/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_0_nm1evqa3/} \
   CONFIG.MEM_WIDTH {360} \
   CONFIG.NSTREAMS {1} \
   CONFIG.RAM_STYLE {auto} \
   CONFIG.STRM0_DEPTH {250} \
   CONFIG.STRM0_OFFSET {0} \
   CONFIG.STRM0_WIDTH {360} \
 ] $StreamingFCLayer_Batch_0_wstrm

  # Create interface connections
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_0_out_V_V [get_bd_intf_pins out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_0/out_V_V]
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_0_wstrm_m_axis_0 [get_bd_intf_pins StreamingFCLayer_Batch_0/weights_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_0_wstrm/m_axis_0]
  connect_bd_intf_net -intf_net in0_V_V_1 [get_bd_intf_pins in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_0/in0_V_V]

  # Create port connections
  connect_bd_net -net ap_clk_1 [get_bd_pins ap_clk] [get_bd_pins StreamingFCLayer_Batch_0/ap_clk] [get_bd_pins StreamingFCLayer_Batch_0_wstrm/aclk]
  connect_bd_net -net ap_rst_n_1 [get_bd_pins ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_0/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_0_wstrm/aresetn]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_msg_id "BD_TCL-100" "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_msg_id "BD_TCL-101" "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set m_axis_0 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 m_axis_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000.000000} \
   ] $m_axis_0

  set s_axis_0 [ create_bd_intf_port -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 s_axis_0 ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000.000000} \
   CONFIG.HAS_TKEEP {0} \
   CONFIG.HAS_TLAST {0} \
   CONFIG.HAS_TREADY {1} \
   CONFIG.HAS_TSTRB {0} \
   CONFIG.LAYERED_METADATA {undef} \
   CONFIG.TDATA_NUM_BYTES {25} \
   CONFIG.TDEST_WIDTH {0} \
   CONFIG.TID_WIDTH {0} \
   CONFIG.TUSER_WIDTH {0} \
   ] $s_axis_0


  # Create ports
  set ap_clk [ create_bd_port -dir I -type clk ap_clk ]
  set_property -dict [ list \
   CONFIG.FREQ_HZ {100000000.000000} \
 ] $ap_clk
  set ap_rst_n [ create_bd_port -dir I -type rst ap_rst_n ]

  # Create instance: ConvolutionInputGenerator1D_0, and set properties
  set ConvolutionInputGenerator1D_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:ConvolutionInputGenerator1D_0:1.0 ConvolutionInputGenerator1D_0 ]

  # Create instance: ConvolutionInputGenerator1D_1, and set properties
  set ConvolutionInputGenerator1D_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:ConvolutionInputGenerator1D_1:1.0 ConvolutionInputGenerator1D_1 ]

  # Create instance: ConvolutionInputGenerator1D_2, and set properties
  set ConvolutionInputGenerator1D_2 [ create_bd_cell -type ip -vlnv xilinx.com:hls:ConvolutionInputGenerator1D_2:1.0 ConvolutionInputGenerator1D_2 ]

  # Create instance: StreamingDataWidthConverter_Batch_0, and set properties
  set StreamingDataWidthConverter_Batch_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_0:1.0 StreamingDataWidthConverter_Batch_0 ]

  # Create instance: StreamingDataWidthConverter_Batch_1, and set properties
  set StreamingDataWidthConverter_Batch_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_1:1.0 StreamingDataWidthConverter_Batch_1 ]

  # Create instance: StreamingDataWidthConverter_Batch_2, and set properties
  set StreamingDataWidthConverter_Batch_2 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_2:1.0 StreamingDataWidthConverter_Batch_2 ]

  # Create instance: StreamingDataWidthConverter_Batch_3, and set properties
  set StreamingDataWidthConverter_Batch_3 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_3:1.0 StreamingDataWidthConverter_Batch_3 ]

  # Create instance: StreamingDataWidthConverter_Batch_4, and set properties
  set StreamingDataWidthConverter_Batch_4 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_4:1.0 StreamingDataWidthConverter_Batch_4 ]

  # Create instance: StreamingDataWidthConverter_Batch_5, and set properties
  set StreamingDataWidthConverter_Batch_5 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_5:1.0 StreamingDataWidthConverter_Batch_5 ]

  # Create instance: StreamingDataWidthConverter_Batch_6, and set properties
  set StreamingDataWidthConverter_Batch_6 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_6:1.0 StreamingDataWidthConverter_Batch_6 ]

  # Create instance: StreamingDataWidthConverter_Batch_7, and set properties
  set StreamingDataWidthConverter_Batch_7 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_7:1.0 StreamingDataWidthConverter_Batch_7 ]

  # Create instance: StreamingDataWidthConverter_Batch_8, and set properties
  set StreamingDataWidthConverter_Batch_8 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_8:1.0 StreamingDataWidthConverter_Batch_8 ]

  # Create instance: StreamingDataWidthConverter_Batch_9, and set properties
  set StreamingDataWidthConverter_Batch_9 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_9:1.0 StreamingDataWidthConverter_Batch_9 ]

  # Create instance: StreamingDataWidthConverter_Batch_10, and set properties
  set StreamingDataWidthConverter_Batch_10 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_10:1.0 StreamingDataWidthConverter_Batch_10 ]

  # Create instance: StreamingDataWidthConverter_Batch_11, and set properties
  set StreamingDataWidthConverter_Batch_11 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_11:1.0 StreamingDataWidthConverter_Batch_11 ]

  # Create instance: StreamingDataWidthConverter_Batch_12, and set properties
  set StreamingDataWidthConverter_Batch_12 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_12:1.0 StreamingDataWidthConverter_Batch_12 ]

  # Create instance: StreamingFCLayer_Batch_0
  create_hier_cell_StreamingFCLayer_Batch_0 [current_bd_instance .] StreamingFCLayer_Batch_0

  # Create instance: StreamingFCLayer_Batch_1
  create_hier_cell_StreamingFCLayer_Batch_1 [current_bd_instance .] StreamingFCLayer_Batch_1

  # Create instance: StreamingFCLayer_Batch_2
  create_hier_cell_StreamingFCLayer_Batch_2 [current_bd_instance .] StreamingFCLayer_Batch_2

  # Create instance: StreamingFCLayer_Batch_3
  create_hier_cell_StreamingFCLayer_Batch_3 [current_bd_instance .] StreamingFCLayer_Batch_3

  # Create instance: StreamingFIFO_0, and set properties
  set StreamingFIFO_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFIFO_0:1.0 StreamingFIFO_0 ]

  # Create instance: StreamingFIFO_6, and set properties
  set StreamingFIFO_6 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFIFO_6:1.0 StreamingFIFO_6 ]

  # Create instance: StreamingFIFO_14, and set properties
  set StreamingFIFO_14 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFIFO_14:1.0 StreamingFIFO_14 ]

  # Create instance: StreamingFIFO_22
  create_hier_cell_StreamingFIFO_22 [current_bd_instance .] StreamingFIFO_22

  # Create instance: StreamingMaxPool_Batch_0, and set properties
  set StreamingMaxPool_Batch_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingMaxPool_Batch_0:1.0 StreamingMaxPool_Batch_0 ]

  # Create instance: StreamingMaxPool_Batch_1, and set properties
  set StreamingMaxPool_Batch_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingMaxPool_Batch_1:1.0 StreamingMaxPool_Batch_1 ]

  # Create instance: StreamingMaxPool_Batch_2, and set properties
  set StreamingMaxPool_Batch_2 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingMaxPool_Batch_2:1.0 StreamingMaxPool_Batch_2 ]

  # Create instance: StreamingMaxPool_Batch_3, and set properties
  set StreamingMaxPool_Batch_3 [ create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingMaxPool_Batch_3:1.0 StreamingMaxPool_Batch_3 ]

  # Create instance: Thresholding_Batch_0, and set properties
  set Thresholding_Batch_0 [ create_bd_cell -type ip -vlnv xilinx.com:hls:Thresholding_Batch_0:1.0 Thresholding_Batch_0 ]

  # Create instance: Thresholding_Batch_1, and set properties
  set Thresholding_Batch_1 [ create_bd_cell -type ip -vlnv xilinx.com:hls:Thresholding_Batch_1:1.0 Thresholding_Batch_1 ]

  # Create instance: Thresholding_Batch_2, and set properties
  set Thresholding_Batch_2 [ create_bd_cell -type ip -vlnv xilinx.com:hls:Thresholding_Batch_2:1.0 Thresholding_Batch_2 ]

  # Create instance: Thresholding_Batch_3, and set properties
  set Thresholding_Batch_3 [ create_bd_cell -type ip -vlnv xilinx.com:hls:Thresholding_Batch_3:1.0 Thresholding_Batch_3 ]

  # Create interface connections
  connect_bd_intf_net -intf_net ConvolutionInputGenerator1D_0_out_V_V [get_bd_intf_pins ConvolutionInputGenerator1D_0/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_2/in0_V_V]
  connect_bd_intf_net -intf_net ConvolutionInputGenerator1D_1_out_V_V [get_bd_intf_pins ConvolutionInputGenerator1D_1/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_6/in0_V_V]
  connect_bd_intf_net -intf_net ConvolutionInputGenerator1D_2_out_V_V [get_bd_intf_pins ConvolutionInputGenerator1D_2/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_10/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_0_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_0/out_V_V] [get_bd_intf_pins Thresholding_Batch_0/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_10_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_10/out_V_V] [get_bd_intf_pins StreamingFIFO_22/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_11_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_11/out_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_3/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_12_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_12/out_V_V] [get_bd_intf_pins Thresholding_Batch_3/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_1_out_V_V [get_bd_intf_pins ConvolutionInputGenerator1D_0/in0_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_1/out_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_2_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_2/out_V_V] [get_bd_intf_pins StreamingFIFO_6/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_3_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_3/out_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_1/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_4_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_4/out_V_V] [get_bd_intf_pins Thresholding_Batch_1/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_5_out_V_V [get_bd_intf_pins ConvolutionInputGenerator1D_1/in0_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_5/out_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_6_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_6/out_V_V] [get_bd_intf_pins StreamingFIFO_14/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_7_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_7/out_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_2/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_8_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_8/out_V_V] [get_bd_intf_pins Thresholding_Batch_2/in0_V_V]
  connect_bd_intf_net -intf_net StreamingDataWidthConverter_Batch_9_out_V_V [get_bd_intf_pins ConvolutionInputGenerator1D_2/in0_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_9/out_V_V]
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_0_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_3/in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_0/out_V_V]
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_1_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_7/in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_1/out_V_V]
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_2_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_11/in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_2/out_V_V]
  connect_bd_intf_net -intf_net StreamingFCLayer_Batch_3_out_V_V [get_bd_intf_ports m_axis_0] [get_bd_intf_pins StreamingFCLayer_Batch_3/out_V_V]
  connect_bd_intf_net -intf_net StreamingFIFO_0_out_V_V [get_bd_intf_pins StreamingFIFO_0/out_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_0/in0_V_V]
  connect_bd_intf_net -intf_net StreamingFIFO_14_out_V_V [get_bd_intf_pins StreamingFCLayer_Batch_1/in0_V_V] [get_bd_intf_pins StreamingFIFO_14/out_V_V]
  connect_bd_intf_net -intf_net StreamingFIFO_22_out_V_V [get_bd_intf_pins StreamingFCLayer_Batch_2/in0_V_V] [get_bd_intf_pins StreamingFIFO_22/out_V_V]
  connect_bd_intf_net -intf_net StreamingFIFO_6_out_V_V [get_bd_intf_pins StreamingFCLayer_Batch_0/in0_V_V] [get_bd_intf_pins StreamingFIFO_6/out_V_V]
  connect_bd_intf_net -intf_net StreamingMaxPool_Batch_0_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_0/in0_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_0/out_V_V]
  connect_bd_intf_net -intf_net StreamingMaxPool_Batch_1_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_4/in0_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_1/out_V_V]
  connect_bd_intf_net -intf_net StreamingMaxPool_Batch_2_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_8/in0_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_2/out_V_V]
  connect_bd_intf_net -intf_net StreamingMaxPool_Batch_3_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_12/in0_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_3/out_V_V]
  connect_bd_intf_net -intf_net Thresholding_Batch_0_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_1/in0_V_V] [get_bd_intf_pins Thresholding_Batch_0/out_V_V]
  connect_bd_intf_net -intf_net Thresholding_Batch_1_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_5/in0_V_V] [get_bd_intf_pins Thresholding_Batch_1/out_V_V]
  connect_bd_intf_net -intf_net Thresholding_Batch_2_out_V_V [get_bd_intf_pins StreamingDataWidthConverter_Batch_9/in0_V_V] [get_bd_intf_pins Thresholding_Batch_2/out_V_V]
  connect_bd_intf_net -intf_net Thresholding_Batch_3_out_V_V [get_bd_intf_pins StreamingFCLayer_Batch_3/in0_V_V] [get_bd_intf_pins Thresholding_Batch_3/out_V_V]
  connect_bd_intf_net -intf_net in0_V_V_0_1 [get_bd_intf_ports s_axis_0] [get_bd_intf_pins StreamingFIFO_0/in0_V_V]

  # Create port connections
  connect_bd_net -net ap_clk_0_1 [get_bd_ports ap_clk] [get_bd_pins ConvolutionInputGenerator1D_0/ap_clk] [get_bd_pins ConvolutionInputGenerator1D_1/ap_clk] [get_bd_pins ConvolutionInputGenerator1D_2/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_0/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_1/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_10/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_11/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_12/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_2/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_3/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_4/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_5/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_6/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_7/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_8/ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_9/ap_clk] [get_bd_pins StreamingFCLayer_Batch_0/ap_clk] [get_bd_pins StreamingFCLayer_Batch_1/ap_clk] [get_bd_pins StreamingFCLayer_Batch_2/ap_clk] [get_bd_pins StreamingFCLayer_Batch_3/ap_clk] [get_bd_pins StreamingFIFO_0/ap_clk] [get_bd_pins StreamingFIFO_14/ap_clk] [get_bd_pins StreamingFIFO_22/ap_clk] [get_bd_pins StreamingFIFO_6/ap_clk] [get_bd_pins StreamingMaxPool_Batch_0/ap_clk] [get_bd_pins StreamingMaxPool_Batch_1/ap_clk] [get_bd_pins StreamingMaxPool_Batch_2/ap_clk] [get_bd_pins StreamingMaxPool_Batch_3/ap_clk] [get_bd_pins Thresholding_Batch_0/ap_clk] [get_bd_pins Thresholding_Batch_1/ap_clk] [get_bd_pins Thresholding_Batch_2/ap_clk] [get_bd_pins Thresholding_Batch_3/ap_clk]
  connect_bd_net -net ap_rst_n_0_1 [get_bd_ports ap_rst_n] [get_bd_pins ConvolutionInputGenerator1D_0/ap_rst_n] [get_bd_pins ConvolutionInputGenerator1D_1/ap_rst_n] [get_bd_pins ConvolutionInputGenerator1D_2/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_0/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_1/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_10/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_11/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_12/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_2/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_3/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_4/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_5/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_6/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_7/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_8/ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_9/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_0/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_1/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_2/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_3/ap_rst_n] [get_bd_pins StreamingFIFO_0/ap_rst_n] [get_bd_pins StreamingFIFO_14/ap_rst_n] [get_bd_pins StreamingFIFO_22/ap_rst_n] [get_bd_pins StreamingFIFO_6/ap_rst_n] [get_bd_pins StreamingMaxPool_Batch_0/ap_rst_n] [get_bd_pins StreamingMaxPool_Batch_1/ap_rst_n] [get_bd_pins StreamingMaxPool_Batch_2/ap_rst_n] [get_bd_pins StreamingMaxPool_Batch_3/ap_rst_n] [get_bd_pins Thresholding_Batch_0/ap_rst_n] [get_bd_pins Thresholding_Batch_1/ap_rst_n] [get_bd_pins Thresholding_Batch_2/ap_rst_n] [get_bd_pins Thresholding_Batch_3/ap_rst_n]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


