// (c) Copyright 1995-2022 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:user:memstream:1.0
// IP Revision: 5

(* X_CORE_INFO = "memstream,Vivado 2019.1" *)
(* CHECK_LICENSE_TYPE = "finn_design_StreamingFCLayer_Batch_0_wstrm_0,memstream,{}" *)
(* CORE_GENERATION_INFO = "finn_design_StreamingFCLayer_Batch_0_wstrm_0,memstream,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=user,x_ipName=memstream,x_ipVersion=1.0,x_ipCoreRevision=5,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,CONFIG_EN=true,NSTREAMS=1,MEM_DEPTH=250,MEM_WIDTH=360,MEM_INIT=/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_0_yrzn1xqf/,RAM_STYLE=auto,STRM0_WIDTH=360,STRM1_WIDTH=32,STRM2_WIDTH=32,STRM3_WIDTH=32,STRM4_WIDTH=32,STRM5_WIDTH=32,STRM0_DEPTH=250,STRM1_DEPTH\
=2304,STRM2_DEPTH=2304,STRM3_DEPTH=2304,STRM4_DEPTH=2304,STRM5_DEPTH=2304,STRM0_OFFSET=0,STRM1_OFFSET=2304,STRM2_OFFSET=4608,STRM3_OFFSET=6912,STRM4_OFFSET=9216,STRM5_OFFSET=11520,AXILITE_ADDR_WIDTH=14}" *)
(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module finn_design_StreamingFCLayer_Batch_0_wstrm_0 (
  aclk,
  aresetn,
  awready,
  awvalid,
  awaddr,
  awprot,
  wready,
  wvalid,
  wdata,
  wstrb,
  bready,
  bvalid,
  bresp,
  arready,
  arvalid,
  araddr,
  arprot,
  rready,
  rvalid,
  rresp,
  rdata,
  m_axis_0_tready,
  m_axis_0_tvalid,
  m_axis_0_tdata
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axis_0:m_axis_1:m_axis_2:m_axis_3:m_axis_4:m_axis_5:s_axilite, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000.000000, PHASE 0.000, CLK_DOMAIN finn_design_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
input wire aclk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
input wire aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite AWREADY" *)
output wire awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite AWVALID" *)
input wire awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite AWADDR" *)
input wire [13 : 0] awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite AWPROT" *)
input wire [2 : 0] awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite WREADY" *)
output wire wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite WVALID" *)
input wire wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite WDATA" *)
input wire [31 : 0] wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite WSTRB" *)
input wire [3 : 0] wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite BREADY" *)
input wire bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite BVALID" *)
output wire bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite BRESP" *)
output wire [1 : 0] bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite ARREADY" *)
output wire arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite ARVALID" *)
input wire arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite ARADDR" *)
input wire [13 : 0] araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite ARPROT" *)
input wire [2 : 0] arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite RREADY" *)
input wire rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite RVALID" *)
output wire rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite RRESP" *)
output wire [1 : 0] rresp;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axilite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000.000000, ID_WIDTH 0, ADDR_WIDTH 14, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.000, CLK_DOMAIN finn_design_ap_clk_0, NUM_READ_THREADS 1, NUM_W\
RITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axilite RDATA" *)
output wire [31 : 0] rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TREADY" *)
input wire m_axis_0_tready;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TVALID" *)
output wire m_axis_0_tvalid;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axis_0, TDATA_NUM_BYTES 45, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000.000000, PHASE 0.000, CLK_DOMAIN finn_design_ap_clk_0, LAYERED_METADATA undef, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m_axis_0 TDATA" *)
output wire [359 : 0] m_axis_0_tdata;

  memstream #(
    .CONFIG_EN(1'B1),
    .NSTREAMS(1),
    .MEM_DEPTH(250),
    .MEM_WIDTH(360),
    .MEM_INIT("/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_0_yrzn1xqf/"),
    .RAM_STYLE("auto"),
    .STRM0_WIDTH(360),
    .STRM1_WIDTH(32),
    .STRM2_WIDTH(32),
    .STRM3_WIDTH(32),
    .STRM4_WIDTH(32),
    .STRM5_WIDTH(32),
    .STRM0_DEPTH(250),
    .STRM1_DEPTH(2304),
    .STRM2_DEPTH(2304),
    .STRM3_DEPTH(2304),
    .STRM4_DEPTH(2304),
    .STRM5_DEPTH(2304),
    .STRM0_OFFSET(0),
    .STRM1_OFFSET(2304),
    .STRM2_OFFSET(4608),
    .STRM3_OFFSET(6912),
    .STRM4_OFFSET(9216),
    .STRM5_OFFSET(11520),
    .AXILITE_ADDR_WIDTH(14)
  ) inst (
    .aclk(aclk),
    .aresetn(aresetn),
    .awready(awready),
    .awvalid(awvalid),
    .awaddr(awaddr),
    .awprot(awprot),
    .wready(wready),
    .wvalid(wvalid),
    .wdata(wdata),
    .wstrb(wstrb),
    .bready(bready),
    .bvalid(bvalid),
    .bresp(bresp),
    .arready(arready),
    .arvalid(arvalid),
    .araddr(araddr),
    .arprot(arprot),
    .rready(rready),
    .rvalid(rvalid),
    .rresp(rresp),
    .rdata(rdata),
    .m_axis_0_afull(1'B0),
    .m_axis_0_tready(m_axis_0_tready),
    .m_axis_0_tvalid(m_axis_0_tvalid),
    .m_axis_0_tdata(m_axis_0_tdata),
    .m_axis_1_afull(1'B0),
    .m_axis_1_tready(1'B1),
    .m_axis_1_tvalid(),
    .m_axis_1_tdata(),
    .m_axis_2_afull(1'B0),
    .m_axis_2_tready(1'B1),
    .m_axis_2_tvalid(),
    .m_axis_2_tdata(),
    .m_axis_3_afull(1'B0),
    .m_axis_3_tready(1'B1),
    .m_axis_3_tvalid(),
    .m_axis_3_tdata(),
    .m_axis_4_afull(1'B0),
    .m_axis_4_tready(1'B1),
    .m_axis_4_tvalid(),
    .m_axis_4_tdata(),
    .m_axis_5_afull(1'B0),
    .m_axis_5_tready(1'B1),
    .m_axis_5_tvalid(),
    .m_axis_5_tdata()
  );
endmodule
