// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1ns/1ps

module StreamingFCLayer_Batch_0_StreamingFCLayer_Batch_0_mux_255_72_1_1 #(
parameter
    ID                = 0,
    NUM_STAGE         = 1,
    din0_WIDTH       = 32,
    din1_WIDTH       = 32,
    din2_WIDTH       = 32,
    din3_WIDTH       = 32,
    din4_WIDTH       = 32,
    din5_WIDTH       = 32,
    din6_WIDTH       = 32,
    din7_WIDTH       = 32,
    din8_WIDTH       = 32,
    din9_WIDTH       = 32,
    din10_WIDTH       = 32,
    din11_WIDTH       = 32,
    din12_WIDTH       = 32,
    din13_WIDTH       = 32,
    din14_WIDTH       = 32,
    din15_WIDTH       = 32,
    din16_WIDTH       = 32,
    din17_WIDTH       = 32,
    din18_WIDTH       = 32,
    din19_WIDTH       = 32,
    din20_WIDTH       = 32,
    din21_WIDTH       = 32,
    din22_WIDTH       = 32,
    din23_WIDTH       = 32,
    din24_WIDTH       = 32,
    din25_WIDTH         = 32,
    dout_WIDTH            = 32
)(
    input  [71 : 0]     din0,
    input  [71 : 0]     din1,
    input  [71 : 0]     din2,
    input  [71 : 0]     din3,
    input  [71 : 0]     din4,
    input  [71 : 0]     din5,
    input  [71 : 0]     din6,
    input  [71 : 0]     din7,
    input  [71 : 0]     din8,
    input  [71 : 0]     din9,
    input  [71 : 0]     din10,
    input  [71 : 0]     din11,
    input  [71 : 0]     din12,
    input  [71 : 0]     din13,
    input  [71 : 0]     din14,
    input  [71 : 0]     din15,
    input  [71 : 0]     din16,
    input  [71 : 0]     din17,
    input  [71 : 0]     din18,
    input  [71 : 0]     din19,
    input  [71 : 0]     din20,
    input  [71 : 0]     din21,
    input  [71 : 0]     din22,
    input  [71 : 0]     din23,
    input  [71 : 0]     din24,
    input  [4 : 0]    din25,
    output [71 : 0]   dout);

// puts internal signals
wire [4 : 0]     sel;
// level 1 signals
wire [71 : 0]         mux_1_0;
wire [71 : 0]         mux_1_1;
wire [71 : 0]         mux_1_2;
wire [71 : 0]         mux_1_3;
wire [71 : 0]         mux_1_4;
wire [71 : 0]         mux_1_5;
wire [71 : 0]         mux_1_6;
wire [71 : 0]         mux_1_7;
wire [71 : 0]         mux_1_8;
wire [71 : 0]         mux_1_9;
wire [71 : 0]         mux_1_10;
wire [71 : 0]         mux_1_11;
wire [71 : 0]         mux_1_12;
// level 2 signals
wire [71 : 0]         mux_2_0;
wire [71 : 0]         mux_2_1;
wire [71 : 0]         mux_2_2;
wire [71 : 0]         mux_2_3;
wire [71 : 0]         mux_2_4;
wire [71 : 0]         mux_2_5;
wire [71 : 0]         mux_2_6;
// level 3 signals
wire [71 : 0]         mux_3_0;
wire [71 : 0]         mux_3_1;
wire [71 : 0]         mux_3_2;
wire [71 : 0]         mux_3_3;
// level 4 signals
wire [71 : 0]         mux_4_0;
wire [71 : 0]         mux_4_1;
// level 5 signals
wire [71 : 0]         mux_5_0;

assign sel = din25;

// Generate level 1 logic
assign mux_1_0 = (sel[0] == 0)? din0 : din1;
assign mux_1_1 = (sel[0] == 0)? din2 : din3;
assign mux_1_2 = (sel[0] == 0)? din4 : din5;
assign mux_1_3 = (sel[0] == 0)? din6 : din7;
assign mux_1_4 = (sel[0] == 0)? din8 : din9;
assign mux_1_5 = (sel[0] == 0)? din10 : din11;
assign mux_1_6 = (sel[0] == 0)? din12 : din13;
assign mux_1_7 = (sel[0] == 0)? din14 : din15;
assign mux_1_8 = (sel[0] == 0)? din16 : din17;
assign mux_1_9 = (sel[0] == 0)? din18 : din19;
assign mux_1_10 = (sel[0] == 0)? din20 : din21;
assign mux_1_11 = (sel[0] == 0)? din22 : din23;
assign mux_1_12 = din24;

// Generate level 2 logic
assign mux_2_0 = (sel[1] == 0)? mux_1_0 : mux_1_1;
assign mux_2_1 = (sel[1] == 0)? mux_1_2 : mux_1_3;
assign mux_2_2 = (sel[1] == 0)? mux_1_4 : mux_1_5;
assign mux_2_3 = (sel[1] == 0)? mux_1_6 : mux_1_7;
assign mux_2_4 = (sel[1] == 0)? mux_1_8 : mux_1_9;
assign mux_2_5 = (sel[1] == 0)? mux_1_10 : mux_1_11;
assign mux_2_6 = mux_1_12;

// Generate level 3 logic
assign mux_3_0 = (sel[2] == 0)? mux_2_0 : mux_2_1;
assign mux_3_1 = (sel[2] == 0)? mux_2_2 : mux_2_3;
assign mux_3_2 = (sel[2] == 0)? mux_2_4 : mux_2_5;
assign mux_3_3 = mux_2_6;

// Generate level 4 logic
assign mux_4_0 = (sel[3] == 0)? mux_3_0 : mux_3_1;
assign mux_4_1 = (sel[3] == 0)? mux_3_2 : mux_3_3;

// Generate level 5 logic
assign mux_5_0 = (sel[4] == 0)? mux_4_0 : mux_4_1;

// output logic
assign dout = mux_5_0;

endmodule
