// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2019.1
// Copyright (C) 1986-2019 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module ConvolutionInputGenerator1D_0_ConvolutionInputGene_1 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        in_V_V_TDATA,
        in_V_V_TVALID,
        in_V_V_TREADY,
        out_V_V_TDATA,
        out_V_V_TVALID,
        out_V_V_TREADY
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state4 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
input  [199:0] in_V_V_TDATA;
input   in_V_V_TVALID;
output   in_V_V_TREADY;
output  [1799:0] out_V_V_TDATA;
output   out_V_V_TVALID;
input   out_V_V_TREADY;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg in_V_V_TREADY;
reg out_V_V_TVALID;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    in_V_V_TDATA_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter0;
wire    ap_block_pp0_stage0;
wire   [0:0] icmp_ln1687_fu_214_p2;
wire   [0:0] icmp_ln1689_fu_229_p2;
wire   [0:0] icmp_ln1725_fu_356_p2;
reg    out_V_V_TDATA_blk_n;
reg    ap_enable_reg_pp0_iter1;
reg   [0:0] icmp_ln1689_reg_1079;
reg   [7:0] i_0_0_reg_169;
reg    ap_predicate_op64_read_state2;
reg    ap_predicate_op77_read_state2;
reg    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_state3_io;
reg    ap_block_pp0_stage0_11001;
wire   [7:0] add_ln1687_fu_220_p2;
reg   [31:0] current_block_write_3_reg_1083;
wire   [3:0] trunc_ln1710_fu_238_p1;
reg   [3:0] trunc_ln1710_reg_1089;
wire   [0:0] icmp_ln1711_fu_248_p2;
reg   [0:0] icmp_ln1711_reg_1103;
wire   [0:0] icmp_ln1711_2_fu_266_p2;
reg   [0:0] icmp_ln1711_2_reg_1108;
wire   [0:0] icmp_ln1711_3_fu_284_p2;
reg   [0:0] icmp_ln1711_3_reg_1113;
wire   [0:0] icmp_ln1711_4_fu_296_p2;
reg   [0:0] icmp_ln1711_4_reg_1118;
wire   [0:0] icmp_ln1711_5_fu_308_p2;
reg   [0:0] icmp_ln1711_5_reg_1123;
wire   [0:0] icmp_ln1711_6_fu_314_p2;
reg   [0:0] icmp_ln1711_6_reg_1128;
wire   [0:0] icmp_ln1711_8_fu_320_p2;
reg   [0:0] icmp_ln1711_8_reg_1133;
reg   [0:0] icmp_ln1725_reg_1138;
reg   [199:0] tmp_V_2_reg_1142;
reg    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg   [31:0] inp_13_0_fu_100;
wire   [31:0] select_ln1720_fu_338_p3;
wire   [31:0] add_ln1694_fu_455_p2;
reg   [31:0] ofm_y_1_0_fu_104;
wire   [31:0] select_ln1720_1_fu_347_p3;
reg   [31:0] read_block_1_0_fu_108;
wire   [31:0] add_ln1733_fu_365_p2;
wire   [31:0] add_ln1700_fu_481_p2;
reg   [31:0] current_block_write_s_fu_112;
wire   [31:0] select_ln1735_fu_377_p3;
wire   [31:0] select_ln1697_fu_473_p3;
reg   [199:0] inputBuf_0_V_fu_116;
wire   [3:0] trunc_ln321_fu_395_p1;
reg   [199:0] inputBuf_1_V_fu_120;
reg   [199:0] inputBuf_2_V_fu_124;
reg   [199:0] inputBuf_3_V_fu_128;
reg   [199:0] inputBuf_4_V_fu_132;
reg   [199:0] inputBuf_5_V_fu_136;
reg   [199:0] inputBuf_6_V_fu_140;
reg   [199:0] inputBuf_7_V_fu_144;
reg   [199:0] inputBuf_8_V_fu_148;
reg   [199:0] inputBuf_9_V_fu_152;
reg    ap_block_pp0_stage0_01001;
wire   [31:0] add_ln1710_fu_242_p2;
wire   [31:0] add_ln1710_2_fu_260_p2;
wire   [31:0] add_ln1710_3_fu_278_p2;
wire   [31:0] add_ln1710_4_fu_290_p2;
wire   [31:0] add_ln1710_5_fu_302_p2;
wire   [31:0] add_ln1712_fu_254_p2;
wire   [31:0] add_ln1712_2_fu_272_p2;
wire   [31:0] add_ln1719_fu_326_p2;
wire   [0:0] icmp_ln1720_fu_332_p2;
wire   [0:0] icmp_ln1735_fu_371_p2;
wire   [31:0] add_ln1696_fu_461_p2;
wire   [0:0] icmp_ln1697_fu_467_p2;
wire   [3:0] select_ln1711_fu_502_p3;
wire   [3:0] tmp_1_fu_544_p11;
wire   [31:0] add_ln1710_1_fu_570_p2;
wire   [0:0] icmp_ln1711_1_fu_575_p2;
wire   [3:0] xor_ln1711_fu_586_p2;
wire   [3:0] add_ln1711_1_fu_591_p2;
wire   [3:0] tmp_2_fu_604_p11;
wire   [3:0] select_ln1711_2_fu_630_p3;
wire   [3:0] tmp_3_fu_642_p11;
wire   [3:0] select_ln1711_3_fu_668_p3;
wire   [3:0] tmp_4_fu_680_p11;
wire   [3:0] select_ln1711_4_fu_706_p3;
wire   [3:0] tmp_5_fu_718_p11;
wire   [3:0] select_ln1711_5_fu_744_p3;
wire   [3:0] tmp_6_fu_756_p11;
wire   [3:0] select_ln1711_6_fu_782_p3;
wire   [3:0] tmp_7_fu_794_p11;
wire   [31:0] add_ln1712_1_fu_581_p2;
wire   [0:0] icmp_ln1711_7_fu_820_p2;
wire   [3:0] add_ln1711_7_fu_826_p2;
wire   [3:0] tmp_8_fu_839_p11;
wire   [3:0] select_ln1711_8_fu_865_p3;
wire   [3:0] tmp_9_fu_877_p11;
wire   [199:0] tmp_9_fu_877_p12;
wire   [199:0] tmp_8_fu_839_p12;
wire   [199:0] tmp_7_fu_794_p12;
wire   [199:0] tmp_6_fu_756_p12;
wire   [199:0] tmp_5_fu_718_p12;
wire   [199:0] tmp_4_fu_680_p12;
wire   [199:0] tmp_3_fu_642_p12;
wire   [199:0] tmp_2_fu_604_p12;
wire   [199:0] tmp_1_fu_544_p12;
wire    ap_CS_fsm_state4;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_719;
reg    ap_condition_724;
reg    ap_condition_727;
reg    ap_condition_730;
reg    ap_condition_733;
reg    ap_condition_736;
reg    ap_condition_739;
reg    ap_condition_742;
reg    ap_condition_745;
reg    ap_condition_748;
reg    ap_condition_751;
reg    ap_condition_754;
reg    ap_condition_757;
reg    ap_condition_760;
reg    ap_condition_763;
reg    ap_condition_766;
reg    ap_condition_769;
reg    ap_condition_772;
reg    ap_condition_783;
reg    ap_condition_794;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

ConvolutionInputGenerator1D_0_ConvolutionInputGenerator1D_0_mux_104_200_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 200 ),
    .din1_WIDTH( 200 ),
    .din2_WIDTH( 200 ),
    .din3_WIDTH( 200 ),
    .din4_WIDTH( 200 ),
    .din5_WIDTH( 200 ),
    .din6_WIDTH( 200 ),
    .din7_WIDTH( 200 ),
    .din8_WIDTH( 200 ),
    .din9_WIDTH( 200 ),
    .din10_WIDTH( 4 ),
    .dout_WIDTH( 200 ))
ConvolutionInputGenerator1D_0_mux_104_200_1_1_U1(
    .din0(inputBuf_0_V_fu_116),
    .din1(inputBuf_1_V_fu_120),
    .din2(inputBuf_2_V_fu_124),
    .din3(inputBuf_3_V_fu_128),
    .din4(inputBuf_4_V_fu_132),
    .din5(inputBuf_5_V_fu_136),
    .din6(inputBuf_6_V_fu_140),
    .din7(inputBuf_7_V_fu_144),
    .din8(inputBuf_8_V_fu_148),
    .din9(inputBuf_9_V_fu_152),
    .din10(tmp_1_fu_544_p11),
    .dout(tmp_1_fu_544_p12)
);

ConvolutionInputGenerator1D_0_ConvolutionInputGenerator1D_0_mux_104_200_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 200 ),
    .din1_WIDTH( 200 ),
    .din2_WIDTH( 200 ),
    .din3_WIDTH( 200 ),
    .din4_WIDTH( 200 ),
    .din5_WIDTH( 200 ),
    .din6_WIDTH( 200 ),
    .din7_WIDTH( 200 ),
    .din8_WIDTH( 200 ),
    .din9_WIDTH( 200 ),
    .din10_WIDTH( 4 ),
    .dout_WIDTH( 200 ))
ConvolutionInputGenerator1D_0_mux_104_200_1_1_U2(
    .din0(inputBuf_0_V_fu_116),
    .din1(inputBuf_1_V_fu_120),
    .din2(inputBuf_2_V_fu_124),
    .din3(inputBuf_3_V_fu_128),
    .din4(inputBuf_4_V_fu_132),
    .din5(inputBuf_5_V_fu_136),
    .din6(inputBuf_6_V_fu_140),
    .din7(inputBuf_7_V_fu_144),
    .din8(inputBuf_8_V_fu_148),
    .din9(inputBuf_9_V_fu_152),
    .din10(tmp_2_fu_604_p11),
    .dout(tmp_2_fu_604_p12)
);

ConvolutionInputGenerator1D_0_ConvolutionInputGenerator1D_0_mux_104_200_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 200 ),
    .din1_WIDTH( 200 ),
    .din2_WIDTH( 200 ),
    .din3_WIDTH( 200 ),
    .din4_WIDTH( 200 ),
    .din5_WIDTH( 200 ),
    .din6_WIDTH( 200 ),
    .din7_WIDTH( 200 ),
    .din8_WIDTH( 200 ),
    .din9_WIDTH( 200 ),
    .din10_WIDTH( 4 ),
    .dout_WIDTH( 200 ))
ConvolutionInputGenerator1D_0_mux_104_200_1_1_U3(
    .din0(inputBuf_0_V_fu_116),
    .din1(inputBuf_1_V_fu_120),
    .din2(inputBuf_2_V_fu_124),
    .din3(inputBuf_3_V_fu_128),
    .din4(inputBuf_4_V_fu_132),
    .din5(inputBuf_5_V_fu_136),
    .din6(inputBuf_6_V_fu_140),
    .din7(inputBuf_7_V_fu_144),
    .din8(inputBuf_8_V_fu_148),
    .din9(inputBuf_9_V_fu_152),
    .din10(tmp_3_fu_642_p11),
    .dout(tmp_3_fu_642_p12)
);

ConvolutionInputGenerator1D_0_ConvolutionInputGenerator1D_0_mux_104_200_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 200 ),
    .din1_WIDTH( 200 ),
    .din2_WIDTH( 200 ),
    .din3_WIDTH( 200 ),
    .din4_WIDTH( 200 ),
    .din5_WIDTH( 200 ),
    .din6_WIDTH( 200 ),
    .din7_WIDTH( 200 ),
    .din8_WIDTH( 200 ),
    .din9_WIDTH( 200 ),
    .din10_WIDTH( 4 ),
    .dout_WIDTH( 200 ))
ConvolutionInputGenerator1D_0_mux_104_200_1_1_U4(
    .din0(inputBuf_0_V_fu_116),
    .din1(inputBuf_1_V_fu_120),
    .din2(inputBuf_2_V_fu_124),
    .din3(inputBuf_3_V_fu_128),
    .din4(inputBuf_4_V_fu_132),
    .din5(inputBuf_5_V_fu_136),
    .din6(inputBuf_6_V_fu_140),
    .din7(inputBuf_7_V_fu_144),
    .din8(inputBuf_8_V_fu_148),
    .din9(inputBuf_9_V_fu_152),
    .din10(tmp_4_fu_680_p11),
    .dout(tmp_4_fu_680_p12)
);

ConvolutionInputGenerator1D_0_ConvolutionInputGenerator1D_0_mux_104_200_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 200 ),
    .din1_WIDTH( 200 ),
    .din2_WIDTH( 200 ),
    .din3_WIDTH( 200 ),
    .din4_WIDTH( 200 ),
    .din5_WIDTH( 200 ),
    .din6_WIDTH( 200 ),
    .din7_WIDTH( 200 ),
    .din8_WIDTH( 200 ),
    .din9_WIDTH( 200 ),
    .din10_WIDTH( 4 ),
    .dout_WIDTH( 200 ))
ConvolutionInputGenerator1D_0_mux_104_200_1_1_U5(
    .din0(inputBuf_0_V_fu_116),
    .din1(inputBuf_1_V_fu_120),
    .din2(inputBuf_2_V_fu_124),
    .din3(inputBuf_3_V_fu_128),
    .din4(inputBuf_4_V_fu_132),
    .din5(inputBuf_5_V_fu_136),
    .din6(inputBuf_6_V_fu_140),
    .din7(inputBuf_7_V_fu_144),
    .din8(inputBuf_8_V_fu_148),
    .din9(inputBuf_9_V_fu_152),
    .din10(tmp_5_fu_718_p11),
    .dout(tmp_5_fu_718_p12)
);

ConvolutionInputGenerator1D_0_ConvolutionInputGenerator1D_0_mux_104_200_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 200 ),
    .din1_WIDTH( 200 ),
    .din2_WIDTH( 200 ),
    .din3_WIDTH( 200 ),
    .din4_WIDTH( 200 ),
    .din5_WIDTH( 200 ),
    .din6_WIDTH( 200 ),
    .din7_WIDTH( 200 ),
    .din8_WIDTH( 200 ),
    .din9_WIDTH( 200 ),
    .din10_WIDTH( 4 ),
    .dout_WIDTH( 200 ))
ConvolutionInputGenerator1D_0_mux_104_200_1_1_U6(
    .din0(inputBuf_0_V_fu_116),
    .din1(inputBuf_1_V_fu_120),
    .din2(inputBuf_2_V_fu_124),
    .din3(inputBuf_3_V_fu_128),
    .din4(inputBuf_4_V_fu_132),
    .din5(inputBuf_5_V_fu_136),
    .din6(inputBuf_6_V_fu_140),
    .din7(inputBuf_7_V_fu_144),
    .din8(inputBuf_8_V_fu_148),
    .din9(inputBuf_9_V_fu_152),
    .din10(tmp_6_fu_756_p11),
    .dout(tmp_6_fu_756_p12)
);

ConvolutionInputGenerator1D_0_ConvolutionInputGenerator1D_0_mux_104_200_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 200 ),
    .din1_WIDTH( 200 ),
    .din2_WIDTH( 200 ),
    .din3_WIDTH( 200 ),
    .din4_WIDTH( 200 ),
    .din5_WIDTH( 200 ),
    .din6_WIDTH( 200 ),
    .din7_WIDTH( 200 ),
    .din8_WIDTH( 200 ),
    .din9_WIDTH( 200 ),
    .din10_WIDTH( 4 ),
    .dout_WIDTH( 200 ))
ConvolutionInputGenerator1D_0_mux_104_200_1_1_U7(
    .din0(inputBuf_0_V_fu_116),
    .din1(inputBuf_1_V_fu_120),
    .din2(inputBuf_2_V_fu_124),
    .din3(inputBuf_3_V_fu_128),
    .din4(inputBuf_4_V_fu_132),
    .din5(inputBuf_5_V_fu_136),
    .din6(inputBuf_6_V_fu_140),
    .din7(inputBuf_7_V_fu_144),
    .din8(inputBuf_8_V_fu_148),
    .din9(inputBuf_9_V_fu_152),
    .din10(tmp_7_fu_794_p11),
    .dout(tmp_7_fu_794_p12)
);

ConvolutionInputGenerator1D_0_ConvolutionInputGenerator1D_0_mux_104_200_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 200 ),
    .din1_WIDTH( 200 ),
    .din2_WIDTH( 200 ),
    .din3_WIDTH( 200 ),
    .din4_WIDTH( 200 ),
    .din5_WIDTH( 200 ),
    .din6_WIDTH( 200 ),
    .din7_WIDTH( 200 ),
    .din8_WIDTH( 200 ),
    .din9_WIDTH( 200 ),
    .din10_WIDTH( 4 ),
    .dout_WIDTH( 200 ))
ConvolutionInputGenerator1D_0_mux_104_200_1_1_U8(
    .din0(inputBuf_0_V_fu_116),
    .din1(inputBuf_1_V_fu_120),
    .din2(inputBuf_2_V_fu_124),
    .din3(inputBuf_3_V_fu_128),
    .din4(inputBuf_4_V_fu_132),
    .din5(inputBuf_5_V_fu_136),
    .din6(inputBuf_6_V_fu_140),
    .din7(inputBuf_7_V_fu_144),
    .din8(inputBuf_8_V_fu_148),
    .din9(inputBuf_9_V_fu_152),
    .din10(tmp_8_fu_839_p11),
    .dout(tmp_8_fu_839_p12)
);

ConvolutionInputGenerator1D_0_ConvolutionInputGenerator1D_0_mux_104_200_1_1 #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 200 ),
    .din1_WIDTH( 200 ),
    .din2_WIDTH( 200 ),
    .din3_WIDTH( 200 ),
    .din4_WIDTH( 200 ),
    .din5_WIDTH( 200 ),
    .din6_WIDTH( 200 ),
    .din7_WIDTH( 200 ),
    .din8_WIDTH( 200 ),
    .din9_WIDTH( 200 ),
    .din10_WIDTH( 4 ),
    .dout_WIDTH( 200 ))
ConvolutionInputGenerator1D_0_mux_104_200_1_1_U9(
    .din0(inputBuf_0_V_fu_116),
    .din1(inputBuf_1_V_fu_120),
    .din2(inputBuf_2_V_fu_124),
    .din3(inputBuf_3_V_fu_128),
    .din4(inputBuf_4_V_fu_132),
    .din5(inputBuf_5_V_fu_136),
    .din6(inputBuf_6_V_fu_140),
    .din7(inputBuf_7_V_fu_144),
    .din8(inputBuf_8_V_fu_148),
    .din9(inputBuf_9_V_fu_152),
    .din10(tmp_9_fu_877_p11),
    .dout(tmp_9_fu_877_p12)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b1 == ap_condition_pp0_exit_iter0_state2) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        current_block_write_s_fu_112 <= select_ln1697_fu_473_p3;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1725_fu_356_p2 == 1'd1) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        current_block_write_s_fu_112 <= select_ln1735_fu_377_p3;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        current_block_write_s_fu_112 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        i_0_0_reg_169 <= 8'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        i_0_0_reg_169 <= add_ln1687_fu_220_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        inp_13_0_fu_100 <= add_ln1694_fu_455_p2;
    end else if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1725_fu_356_p2 == 1'd0) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1725_fu_356_p2 == 1'd1) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        inp_13_0_fu_100 <= select_ln1720_fu_338_p3;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        inp_13_0_fu_100 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_724)) begin
            inputBuf_0_V_fu_116 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_719)) begin
            inputBuf_0_V_fu_116 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_730)) begin
            inputBuf_1_V_fu_120 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_727)) begin
            inputBuf_1_V_fu_120 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_736)) begin
            inputBuf_2_V_fu_124 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_733)) begin
            inputBuf_2_V_fu_124 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_742)) begin
            inputBuf_3_V_fu_128 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_739)) begin
            inputBuf_3_V_fu_128 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_748)) begin
            inputBuf_4_V_fu_132 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_745)) begin
            inputBuf_4_V_fu_132 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_754)) begin
            inputBuf_5_V_fu_136 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_751)) begin
            inputBuf_5_V_fu_136 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_760)) begin
            inputBuf_6_V_fu_140 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_757)) begin
            inputBuf_6_V_fu_140 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_766)) begin
            inputBuf_7_V_fu_144 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_763)) begin
            inputBuf_7_V_fu_144 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_772)) begin
            inputBuf_8_V_fu_148 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_769)) begin
            inputBuf_8_V_fu_148 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        if ((1'b1 == ap_condition_794)) begin
            inputBuf_9_V_fu_152 <= tmp_V_2_reg_1142;
        end else if ((1'b1 == ap_condition_783)) begin
            inputBuf_9_V_fu_152 <= in_V_V_TDATA;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1725_fu_356_p2 == 1'd0) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1725_fu_356_p2 == 1'd1) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        ofm_y_1_0_fu_104 <= select_ln1720_1_fu_347_p3;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        ofm_y_1_0_fu_104 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        read_block_1_0_fu_108 <= add_ln1700_fu_481_p2;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1725_fu_356_p2 == 1'd1) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        read_block_1_0_fu_108 <= add_ln1733_fu_365_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        read_block_1_0_fu_108 <= 32'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        current_block_write_3_reg_1083 <= current_block_write_s_fu_112;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1687_fu_214_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln1689_reg_1079 <= icmp_ln1689_fu_229_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        icmp_ln1711_2_reg_1108 <= icmp_ln1711_2_fu_266_p2;
        icmp_ln1711_3_reg_1113 <= icmp_ln1711_3_fu_284_p2;
        icmp_ln1711_4_reg_1118 <= icmp_ln1711_4_fu_296_p2;
        icmp_ln1711_5_reg_1123 <= icmp_ln1711_5_fu_308_p2;
        icmp_ln1711_6_reg_1128 <= icmp_ln1711_6_fu_314_p2;
        icmp_ln1711_8_reg_1133 <= icmp_ln1711_8_fu_320_p2;
        icmp_ln1711_reg_1103 <= icmp_ln1711_fu_248_p2;
        icmp_ln1725_reg_1138 <= icmp_ln1725_fu_356_p2;
        trunc_ln1710_reg_1089 <= trunc_ln1710_fu_238_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op64_read_state2 == 1'b1))) begin
        tmp_V_2_reg_1142 <= in_V_V_TDATA;
    end
end

always @ (*) begin
    if ((icmp_ln1687_fu_214_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if ((((icmp_ln1725_fu_356_p2 == 1'd1) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)))) begin
        in_V_V_TDATA_blk_n = in_V_V_TVALID;
    end else begin
        in_V_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op77_read_state2 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_predicate_op64_read_state2 == 1'b1)))) begin
        in_V_V_TREADY = 1'b1;
    end else begin
        in_V_V_TREADY = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln1689_reg_1079 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_V_V_TDATA_blk_n = out_V_V_TREADY;
    end else begin
        out_V_V_TDATA_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        out_V_V_TVALID = 1'b1;
    end else begin
        out_V_V_TVALID = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((icmp_ln1687_fu_214_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((icmp_ln1687_fu_214_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln1687_fu_220_p2 = (i_0_0_reg_169 + 8'd1);

assign add_ln1694_fu_455_p2 = (inp_13_0_fu_100 + 32'd1);

assign add_ln1696_fu_461_p2 = (current_block_write_s_fu_112 + 32'd1);

assign add_ln1700_fu_481_p2 = (read_block_1_0_fu_108 + 32'd1);

assign add_ln1710_1_fu_570_p2 = (32'd2 + current_block_write_3_reg_1083);

assign add_ln1710_2_fu_260_p2 = (32'd3 + current_block_write_s_fu_112);

assign add_ln1710_3_fu_278_p2 = (32'd4 + current_block_write_s_fu_112);

assign add_ln1710_4_fu_290_p2 = (32'd5 + current_block_write_s_fu_112);

assign add_ln1710_5_fu_302_p2 = (32'd6 + current_block_write_s_fu_112);

assign add_ln1710_fu_242_p2 = (32'd1 + current_block_write_s_fu_112);

assign add_ln1711_1_fu_591_p2 = (4'd2 + trunc_ln1710_reg_1089);

assign add_ln1711_7_fu_826_p2 = ($signed(4'd14) + $signed(trunc_ln1710_reg_1089));

assign add_ln1712_1_fu_581_p2 = (32'd8 + current_block_write_3_reg_1083);

assign add_ln1712_2_fu_272_p2 = (32'd9 + current_block_write_s_fu_112);

assign add_ln1712_fu_254_p2 = (32'd7 + current_block_write_s_fu_112);

assign add_ln1719_fu_326_p2 = (32'd1 + ofm_y_1_0_fu_104);

assign add_ln1733_fu_365_p2 = (read_block_1_0_fu_108 + 32'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((ap_enable_reg_pp0_iter0 == 1'b1) & (((in_V_V_TVALID == 1'b0) & (ap_predicate_op77_read_state2 == 1'b1)) | ((in_V_V_TVALID == 1'b0) & (ap_predicate_op64_read_state2 == 1'b1))));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (((in_V_V_TVALID == 1'b0) & (ap_predicate_op77_read_state2 == 1'b1)) | ((in_V_V_TVALID == 1'b0) & (ap_predicate_op64_read_state2 == 1'b1)))));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = (((ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_block_state3_io)) | ((ap_enable_reg_pp0_iter0 == 1'b1) & (((in_V_V_TVALID == 1'b0) & (ap_predicate_op77_read_state2 == 1'b1)) | ((in_V_V_TVALID == 1'b0) & (ap_predicate_op64_read_state2 == 1'b1)))));
end

always @ (*) begin
    ap_block_state2_pp0_stage0_iter0 = (((in_V_V_TVALID == 1'b0) & (ap_predicate_op77_read_state2 == 1'b1)) | ((in_V_V_TVALID == 1'b0) & (ap_predicate_op64_read_state2 == 1'b1)));
end

always @ (*) begin
    ap_block_state3_io = ((icmp_ln1689_reg_1079 == 1'd0) & (out_V_V_TREADY == 1'b0));
end

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_719 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln321_fu_395_p1 == 4'd0));
end

always @ (*) begin
    ap_condition_724 = ((trunc_ln1710_reg_1089 == 4'd0) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_727 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln321_fu_395_p1 == 4'd1));
end

always @ (*) begin
    ap_condition_730 = ((trunc_ln1710_reg_1089 == 4'd1) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_733 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln321_fu_395_p1 == 4'd2));
end

always @ (*) begin
    ap_condition_736 = ((trunc_ln1710_reg_1089 == 4'd2) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_739 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln321_fu_395_p1 == 4'd3));
end

always @ (*) begin
    ap_condition_742 = ((trunc_ln1710_reg_1089 == 4'd3) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_745 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln321_fu_395_p1 == 4'd4));
end

always @ (*) begin
    ap_condition_748 = ((trunc_ln1710_reg_1089 == 4'd4) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_751 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln321_fu_395_p1 == 4'd5));
end

always @ (*) begin
    ap_condition_754 = ((trunc_ln1710_reg_1089 == 4'd5) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_757 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln321_fu_395_p1 == 4'd6));
end

always @ (*) begin
    ap_condition_760 = ((trunc_ln1710_reg_1089 == 4'd6) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_763 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln321_fu_395_p1 == 4'd7));
end

always @ (*) begin
    ap_condition_766 = ((trunc_ln1710_reg_1089 == 4'd7) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_769 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (trunc_ln321_fu_395_p1 == 4'd8));
end

always @ (*) begin
    ap_condition_772 = ((trunc_ln1710_reg_1089 == 4'd8) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_condition_783 = (~(trunc_ln321_fu_395_p1 == 4'd8) & ~(trunc_ln321_fu_395_p1 == 4'd7) & ~(trunc_ln321_fu_395_p1 == 4'd6) & ~(trunc_ln321_fu_395_p1 == 4'd5) & ~(trunc_ln321_fu_395_p1 == 4'd4) & ~(trunc_ln321_fu_395_p1 == 4'd3) & ~(trunc_ln321_fu_395_p1 == 4'd2) & ~(trunc_ln321_fu_395_p1 == 4'd1) & ~(trunc_ln321_fu_395_p1 == 4'd0) & (icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1));
end

always @ (*) begin
    ap_condition_794 = (~(trunc_ln1710_reg_1089 == 4'd8) & ~(trunc_ln1710_reg_1089 == 4'd7) & ~(trunc_ln1710_reg_1089 == 4'd6) & ~(trunc_ln1710_reg_1089 == 4'd5) & ~(trunc_ln1710_reg_1089 == 4'd4) & ~(trunc_ln1710_reg_1089 == 4'd3) & ~(trunc_ln1710_reg_1089 == 4'd2) & ~(trunc_ln1710_reg_1089 == 4'd1) & ~(trunc_ln1710_reg_1089 == 4'd0) & (icmp_ln1725_reg_1138 == 1'd1) & (icmp_ln1689_reg_1079 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_predicate_op64_read_state2 = ((icmp_ln1725_fu_356_p2 == 1'd1) & (icmp_ln1689_fu_229_p2 == 1'd0) & (icmp_ln1687_fu_214_p2 == 1'd0));
end

always @ (*) begin
    ap_predicate_op77_read_state2 = ((icmp_ln1689_fu_229_p2 == 1'd1) & (icmp_ln1687_fu_214_p2 == 1'd0));
end

assign icmp_ln1687_fu_214_p2 = ((i_0_0_reg_169 == 8'd249) ? 1'b1 : 1'b0);

assign icmp_ln1689_fu_229_p2 = ((inp_13_0_fu_100 < 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1697_fu_467_p2 = ((add_ln1696_fu_461_p2 == 32'd10) ? 1'b1 : 1'b0);

assign icmp_ln1711_1_fu_575_p2 = ((add_ln1710_1_fu_570_p2 > 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1711_2_fu_266_p2 = ((add_ln1710_2_fu_260_p2 > 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1711_3_fu_284_p2 = ((add_ln1710_3_fu_278_p2 > 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1711_4_fu_296_p2 = ((add_ln1710_4_fu_290_p2 > 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1711_5_fu_308_p2 = ((add_ln1710_5_fu_302_p2 > 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1711_6_fu_314_p2 = ((add_ln1712_fu_254_p2 > 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1711_7_fu_820_p2 = ((add_ln1712_1_fu_581_p2 > 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1711_8_fu_320_p2 = ((add_ln1712_2_fu_272_p2 > 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1711_fu_248_p2 = ((add_ln1710_fu_242_p2 > 32'd9) ? 1'b1 : 1'b0);

assign icmp_ln1720_fu_332_p2 = ((add_ln1719_fu_326_p2 == 32'd240) ? 1'b1 : 1'b0);

assign icmp_ln1725_fu_356_p2 = ((read_block_1_0_fu_108 < 32'd248) ? 1'b1 : 1'b0);

assign icmp_ln1735_fu_371_p2 = ((add_ln1710_fu_242_p2 == 32'd10) ? 1'b1 : 1'b0);

assign out_V_V_TDATA = {{{{{{{{{tmp_9_fu_877_p12}, {tmp_8_fu_839_p12}}, {tmp_7_fu_794_p12}}, {tmp_6_fu_756_p12}}, {tmp_5_fu_718_p12}}, {tmp_4_fu_680_p12}}, {tmp_3_fu_642_p12}}, {tmp_2_fu_604_p12}}, {tmp_1_fu_544_p12}};

assign select_ln1697_fu_473_p3 = ((icmp_ln1697_fu_467_p2[0:0] === 1'b1) ? 32'd0 : add_ln1696_fu_461_p2);

assign select_ln1711_2_fu_630_p3 = ((icmp_ln1711_2_reg_1108[0:0] === 1'b1) ? 4'd9 : 4'd3);

assign select_ln1711_3_fu_668_p3 = ((icmp_ln1711_3_reg_1113[0:0] === 1'b1) ? 4'd10 : 4'd4);

assign select_ln1711_4_fu_706_p3 = ((icmp_ln1711_4_reg_1118[0:0] === 1'b1) ? 4'd11 : 4'd5);

assign select_ln1711_5_fu_744_p3 = ((icmp_ln1711_5_reg_1123[0:0] === 1'b1) ? 4'd12 : 4'd6);

assign select_ln1711_6_fu_782_p3 = ((icmp_ln1711_6_reg_1128[0:0] === 1'b1) ? 4'd13 : 4'd7);

assign select_ln1711_8_fu_865_p3 = ((icmp_ln1711_8_reg_1133[0:0] === 1'b1) ? 4'd15 : 4'd9);

assign select_ln1711_fu_502_p3 = ((icmp_ln1711_reg_1103[0:0] === 1'b1) ? 4'd7 : 4'd1);

assign select_ln1720_1_fu_347_p3 = ((icmp_ln1720_fu_332_p2[0:0] === 1'b1) ? 32'd0 : add_ln1719_fu_326_p2);

assign select_ln1720_fu_338_p3 = ((icmp_ln1720_fu_332_p2[0:0] === 1'b1) ? 32'd0 : inp_13_0_fu_100);

assign select_ln1735_fu_377_p3 = ((icmp_ln1735_fu_371_p2[0:0] === 1'b1) ? 32'd0 : add_ln1710_fu_242_p2);

assign tmp_1_fu_544_p11 = (select_ln1711_fu_502_p3 + trunc_ln1710_reg_1089);

assign tmp_2_fu_604_p11 = ((icmp_ln1711_1_fu_575_p2[0:0] === 1'b1) ? xor_ln1711_fu_586_p2 : add_ln1711_1_fu_591_p2);

assign tmp_3_fu_642_p11 = (select_ln1711_2_fu_630_p3 + trunc_ln1710_reg_1089);

assign tmp_4_fu_680_p11 = (select_ln1711_3_fu_668_p3 + trunc_ln1710_reg_1089);

assign tmp_5_fu_718_p11 = (select_ln1711_4_fu_706_p3 + trunc_ln1710_reg_1089);

assign tmp_6_fu_756_p11 = (select_ln1711_5_fu_744_p3 + trunc_ln1710_reg_1089);

assign tmp_7_fu_794_p11 = (select_ln1711_6_fu_782_p3 + trunc_ln1710_reg_1089);

assign tmp_8_fu_839_p11 = ((icmp_ln1711_7_fu_820_p2[0:0] === 1'b1) ? add_ln1711_7_fu_826_p2 : xor_ln1711_fu_586_p2);

assign tmp_9_fu_877_p11 = (select_ln1711_8_fu_865_p3 + trunc_ln1710_reg_1089);

assign trunc_ln1710_fu_238_p1 = current_block_write_s_fu_112[3:0];

assign trunc_ln321_fu_395_p1 = current_block_write_s_fu_112[3:0];

assign xor_ln1711_fu_586_p2 = (trunc_ln1710_reg_1089 ^ 4'd8);

endmodule //ConvolutionInputGenerator1D_0_ConvolutionInputGene_1
