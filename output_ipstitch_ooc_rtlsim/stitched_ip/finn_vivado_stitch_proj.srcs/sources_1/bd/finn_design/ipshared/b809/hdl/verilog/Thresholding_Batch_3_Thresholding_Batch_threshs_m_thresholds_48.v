// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1 ns / 1 ps
(* rom_style = "distributed" *) module Thresholding_Batch_3_Thresholding_Batch_threshs_m_thresholds_48_rom (
addr0, ce0, q0, clk);

parameter DWIDTH = 8;
parameter AWIDTH = 8;
parameter MEM_SIZE = 200;

input[AWIDTH-1:0] addr0;
input ce0;
output reg[DWIDTH-1:0] q0;
input clk;

(* ram_style = "distributed" *)reg [DWIDTH-1:0] ram[0:MEM_SIZE-1];

initial begin
    $readmemh("/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_Thresholding_Batch_3_4b2gfw9o/project_Thresholding_Batch_3/sol1/impl/ip/hdl/verilog/Thresholding_Batch_3_Thresholding_Batch_threshs_m_thresholds_48_rom.dat", ram);
end



always @(posedge clk)  
begin 
    if (ce0) 
    begin
        q0 <= ram[addr0];
    end
end



endmodule

`timescale 1 ns / 1 ps
module Thresholding_Batch_3_Thresholding_Batch_threshs_m_thresholds_48(
    reset,
    clk,
    address0,
    ce0,
    q0);

parameter DataWidth = 32'd8;
parameter AddressRange = 32'd200;
parameter AddressWidth = 32'd8;
input reset;
input clk;
input[AddressWidth - 1:0] address0;
input ce0;
output[DataWidth - 1:0] q0;



Thresholding_Batch_3_Thresholding_Batch_threshs_m_thresholds_48_rom Thresholding_Batch_3_Thresholding_Batch_threshs_m_thresholds_48_rom_U(
    .clk( clk ),
    .addr0( address0 ),
    .ce0( ce0 ),
    .q0( q0 ));

endmodule

