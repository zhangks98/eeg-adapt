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


// IP VLNV: xilinx.com:hls:StreamingDataWidthConverter_Batch_11:1.0
// IP Revision: 2112341912

(* X_CORE_INFO = "StreamingDataWidthConverter_Batch_11_StreamingDataWidthConverter_Batch_11,Vivado 2019.1" *)
(* CHECK_LICENSE_TYPE = "finn_design_StreamingDataWidthConverter_Batch_11_0,StreamingDataWidthConverter_Batch_11_StreamingDataWidthConverter_Batch_11,{}" *)
(* CORE_GENERATION_INFO = "finn_design_StreamingDataWidthConverter_Batch_11_0,StreamingDataWidthConverter_Batch_11_StreamingDataWidthConverter_Batch_11,{x_ipProduct=Vivado 2019.1,x_ipVendor=xilinx.com,x_ipLibrary=hls,x_ipName=StreamingDataWidthConverter_Batch_11,x_ipVersion=1.0,x_ipCoreRevision=2112341912,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED}" *)
(* IP_DEFINITION_SOURCE = "HLS" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module finn_design_StreamingDataWidthConverter_Batch_11_0 (
  ap_clk,
  ap_rst_n,
  in0_V_V_TVALID,
  in0_V_V_TREADY,
  in0_V_V_TDATA,
  out_V_V_TVALID,
  out_V_V_TREADY,
  out_V_V_TDATA
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_BUSIF in0_V_V:out_V_V, ASSOCIATED_RESET ap_rst_n, FREQ_HZ 100000000.000000, PHASE 0.000, CLK_DOMAIN finn_design_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *)
input wire ap_clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst_n, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst_n RST" *)
input wire ap_rst_n;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in0_V_V TVALID" *)
input wire in0_V_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in0_V_V TREADY" *)
output wire in0_V_V_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME in0_V_V, TDATA_NUM_BYTES 1, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000.000000, PHASE 0.000, CLK_DOMAIN finn_design_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 in0_V_V TDATA" *)
input wire [7 : 0] in0_V_V_TDATA;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out_V_V TVALID" *)
output wire out_V_V_TVALID;
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out_V_V TREADY" *)
input wire out_V_V_TREADY;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME out_V_V, TDATA_NUM_BYTES 200, TUSER_WIDTH 0, TDEST_WIDTH 0, TID_WIDTH 0, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000.000000, PHASE 0.000, CLK_DOMAIN finn_design_ap_clk_0, INSERT_VIP 0" *)
(* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 out_V_V TDATA" *)
output wire [1599 : 0] out_V_V_TDATA;

  StreamingDataWidthConverter_Batch_11_StreamingDataWidthConverter_Batch_11 inst (
    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),
    .in0_V_V_TVALID(in0_V_V_TVALID),
    .in0_V_V_TREADY(in0_V_V_TREADY),
    .in0_V_V_TDATA(in0_V_V_TDATA),
    .out_V_V_TVALID(out_V_V_TVALID),
    .out_V_V_TREADY(out_V_V_TREADY),
    .out_V_V_TDATA(out_V_V_TDATA)
  );
endmodule
