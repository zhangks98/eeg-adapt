// ==============================================================
// Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC v2019.1 (64-bit)
// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// ==============================================================

`timescale 1ns/1ps

module StreamingFCLayer_Batch_1_StreamingFCLayer_Batch_1_mux_456_80_1_1 #(
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
    din25_WIDTH       = 32,
    din26_WIDTH       = 32,
    din27_WIDTH       = 32,
    din28_WIDTH       = 32,
    din29_WIDTH       = 32,
    din30_WIDTH       = 32,
    din31_WIDTH       = 32,
    din32_WIDTH       = 32,
    din33_WIDTH       = 32,
    din34_WIDTH       = 32,
    din35_WIDTH       = 32,
    din36_WIDTH       = 32,
    din37_WIDTH       = 32,
    din38_WIDTH       = 32,
    din39_WIDTH       = 32,
    din40_WIDTH       = 32,
    din41_WIDTH       = 32,
    din42_WIDTH       = 32,
    din43_WIDTH       = 32,
    din44_WIDTH       = 32,
    din45_WIDTH         = 32,
    dout_WIDTH            = 32
)(
    input  [79 : 0]     din0,
    input  [79 : 0]     din1,
    input  [79 : 0]     din2,
    input  [79 : 0]     din3,
    input  [79 : 0]     din4,
    input  [79 : 0]     din5,
    input  [79 : 0]     din6,
    input  [79 : 0]     din7,
    input  [79 : 0]     din8,
    input  [79 : 0]     din9,
    input  [79 : 0]     din10,
    input  [79 : 0]     din11,
    input  [79 : 0]     din12,
    input  [79 : 0]     din13,
    input  [79 : 0]     din14,
    input  [79 : 0]     din15,
    input  [79 : 0]     din16,
    input  [79 : 0]     din17,
    input  [79 : 0]     din18,
    input  [79 : 0]     din19,
    input  [79 : 0]     din20,
    input  [79 : 0]     din21,
    input  [79 : 0]     din22,
    input  [79 : 0]     din23,
    input  [79 : 0]     din24,
    input  [79 : 0]     din25,
    input  [79 : 0]     din26,
    input  [79 : 0]     din27,
    input  [79 : 0]     din28,
    input  [79 : 0]     din29,
    input  [79 : 0]     din30,
    input  [79 : 0]     din31,
    input  [79 : 0]     din32,
    input  [79 : 0]     din33,
    input  [79 : 0]     din34,
    input  [79 : 0]     din35,
    input  [79 : 0]     din36,
    input  [79 : 0]     din37,
    input  [79 : 0]     din38,
    input  [79 : 0]     din39,
    input  [79 : 0]     din40,
    input  [79 : 0]     din41,
    input  [79 : 0]     din42,
    input  [79 : 0]     din43,
    input  [79 : 0]     din44,
    input  [5 : 0]    din45,
    output [79 : 0]   dout);

// puts internal signals
wire [5 : 0]     sel;
// level 1 signals
wire [79 : 0]         mux_1_0;
wire [79 : 0]         mux_1_1;
wire [79 : 0]         mux_1_2;
wire [79 : 0]         mux_1_3;
wire [79 : 0]         mux_1_4;
wire [79 : 0]         mux_1_5;
wire [79 : 0]         mux_1_6;
wire [79 : 0]         mux_1_7;
wire [79 : 0]         mux_1_8;
wire [79 : 0]         mux_1_9;
wire [79 : 0]         mux_1_10;
wire [79 : 0]         mux_1_11;
wire [79 : 0]         mux_1_12;
wire [79 : 0]         mux_1_13;
wire [79 : 0]         mux_1_14;
wire [79 : 0]         mux_1_15;
wire [79 : 0]         mux_1_16;
wire [79 : 0]         mux_1_17;
wire [79 : 0]         mux_1_18;
wire [79 : 0]         mux_1_19;
wire [79 : 0]         mux_1_20;
wire [79 : 0]         mux_1_21;
wire [79 : 0]         mux_1_22;
// level 2 signals
wire [79 : 0]         mux_2_0;
wire [79 : 0]         mux_2_1;
wire [79 : 0]         mux_2_2;
wire [79 : 0]         mux_2_3;
wire [79 : 0]         mux_2_4;
wire [79 : 0]         mux_2_5;
wire [79 : 0]         mux_2_6;
wire [79 : 0]         mux_2_7;
wire [79 : 0]         mux_2_8;
wire [79 : 0]         mux_2_9;
wire [79 : 0]         mux_2_10;
wire [79 : 0]         mux_2_11;
// level 3 signals
wire [79 : 0]         mux_3_0;
wire [79 : 0]         mux_3_1;
wire [79 : 0]         mux_3_2;
wire [79 : 0]         mux_3_3;
wire [79 : 0]         mux_3_4;
wire [79 : 0]         mux_3_5;
// level 4 signals
wire [79 : 0]         mux_4_0;
wire [79 : 0]         mux_4_1;
wire [79 : 0]         mux_4_2;
// level 5 signals
wire [79 : 0]         mux_5_0;
wire [79 : 0]         mux_5_1;
// level 6 signals
wire [79 : 0]         mux_6_0;

assign sel = din45;

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
assign mux_1_12 = (sel[0] == 0)? din24 : din25;
assign mux_1_13 = (sel[0] == 0)? din26 : din27;
assign mux_1_14 = (sel[0] == 0)? din28 : din29;
assign mux_1_15 = (sel[0] == 0)? din30 : din31;
assign mux_1_16 = (sel[0] == 0)? din32 : din33;
assign mux_1_17 = (sel[0] == 0)? din34 : din35;
assign mux_1_18 = (sel[0] == 0)? din36 : din37;
assign mux_1_19 = (sel[0] == 0)? din38 : din39;
assign mux_1_20 = (sel[0] == 0)? din40 : din41;
assign mux_1_21 = (sel[0] == 0)? din42 : din43;
assign mux_1_22 = din44;

// Generate level 2 logic
assign mux_2_0 = (sel[1] == 0)? mux_1_0 : mux_1_1;
assign mux_2_1 = (sel[1] == 0)? mux_1_2 : mux_1_3;
assign mux_2_2 = (sel[1] == 0)? mux_1_4 : mux_1_5;
assign mux_2_3 = (sel[1] == 0)? mux_1_6 : mux_1_7;
assign mux_2_4 = (sel[1] == 0)? mux_1_8 : mux_1_9;
assign mux_2_5 = (sel[1] == 0)? mux_1_10 : mux_1_11;
assign mux_2_6 = (sel[1] == 0)? mux_1_12 : mux_1_13;
assign mux_2_7 = (sel[1] == 0)? mux_1_14 : mux_1_15;
assign mux_2_8 = (sel[1] == 0)? mux_1_16 : mux_1_17;
assign mux_2_9 = (sel[1] == 0)? mux_1_18 : mux_1_19;
assign mux_2_10 = (sel[1] == 0)? mux_1_20 : mux_1_21;
assign mux_2_11 = mux_1_22;

// Generate level 3 logic
assign mux_3_0 = (sel[2] == 0)? mux_2_0 : mux_2_1;
assign mux_3_1 = (sel[2] == 0)? mux_2_2 : mux_2_3;
assign mux_3_2 = (sel[2] == 0)? mux_2_4 : mux_2_5;
assign mux_3_3 = (sel[2] == 0)? mux_2_6 : mux_2_7;
assign mux_3_4 = (sel[2] == 0)? mux_2_8 : mux_2_9;
assign mux_3_5 = (sel[2] == 0)? mux_2_10 : mux_2_11;

// Generate level 4 logic
assign mux_4_0 = (sel[3] == 0)? mux_3_0 : mux_3_1;
assign mux_4_1 = (sel[3] == 0)? mux_3_2 : mux_3_3;
assign mux_4_2 = (sel[3] == 0)? mux_3_4 : mux_3_5;

// Generate level 5 logic
assign mux_5_0 = (sel[4] == 0)? mux_4_0 : mux_4_1;
assign mux_5_1 = mux_4_2;

// Generate level 6 logic
assign mux_6_0 = (sel[5] == 0)? mux_5_0 : mux_5_1;

// output logic
assign dout = mux_6_0;

endmodule
