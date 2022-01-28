
module StreamingFIFO_14(
ap_clk,
ap_rst_n,
count,
in0_V_V_TDATA,
in0_V_V_TVALID,
in0_V_V_TREADY,
out_V_V_TDATA,
out_V_V_TVALID,
out_V_V_TREADY
);

input   ap_clk;
input   ap_rst_n;
output [7:0] count;
input  [79:0] in0_V_V_TDATA;
input   in0_V_V_TVALID;
output   in0_V_V_TREADY;
output  [79:0] out_V_V_TDATA;
output   out_V_V_TVALID;
input   out_V_V_TREADY;

Q_srl #(
.depth(256),
.width(80)
)
StreamingFIFO_14_StreamingFIFO_14
(
 .clock(ap_clk),
 .reset(!ap_rst_n),
 .count(count),
 .i_d(in0_V_V_TDATA),
 .i_v(in0_V_V_TVALID),
 .i_r(in0_V_V_TREADY),
 .o_d(out_V_V_TDATA),
 .o_v(out_V_V_TVALID),
 .o_r(out_V_V_TREADY)
);

endmodule
