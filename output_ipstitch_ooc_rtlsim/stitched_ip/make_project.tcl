create_project finn_vivado_stitch_proj /tmp/finn_dev_floodd1@ad.mee.tcd.ie/vivado_stitch_proj_fo405gew -part xc7z020clg400-1
set_property ip_repo_paths [list /workspace/finn/finn-rtllib/memstream /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFIFO_0_etb_h6na/project_StreamingFIFO_0/sol1/impl/verilog /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingMaxPool_Batch_0_zt2layng/project_StreamingMaxPool_Batch_0/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_0_fs6e4z6a/project_StreamingDataWidthConverter_Batch_0/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_Thresholding_Batch_0_m47zln3f/project_Thresholding_Batch_0/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_1_7ug9qxm0/project_StreamingDataWidthConverter_Batch_1/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_ConvolutionInputGenerator1D_0_j0lwo5f5/project_ConvolutionInputGenerator1D_0/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_2_k_n3m5zw/project_StreamingDataWidthConverter_Batch_2/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFIFO_6_i0te771b/project_StreamingFIFO_6/sol1/impl/verilog /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_0_yrzn1xqf/project_StreamingFCLayer_Batch_0/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_3_rmxxkptg/project_StreamingDataWidthConverter_Batch_3/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingMaxPool_Batch_1_iiaoegjl/project_StreamingMaxPool_Batch_1/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_4_0x6t91uo/project_StreamingDataWidthConverter_Batch_4/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_Thresholding_Batch_1_kaswly0p/project_Thresholding_Batch_1/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_5_ry9ratzg/project_StreamingDataWidthConverter_Batch_5/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_ConvolutionInputGenerator1D_1_oq9bjekx/project_ConvolutionInputGenerator1D_1/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_6_yhbuau41/project_StreamingDataWidthConverter_Batch_6/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFIFO_14_2l9ye0ck/project_StreamingFIFO_14/sol1/impl/verilog /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_1_5eper8a6/project_StreamingFCLayer_Batch_1/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_7_202b_wh2/project_StreamingDataWidthConverter_Batch_7/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingMaxPool_Batch_2_ase7piio/project_StreamingMaxPool_Batch_2/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_8_7xwox9_h/project_StreamingDataWidthConverter_Batch_8/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_Thresholding_Batch_2_uofv4zz0/project_Thresholding_Batch_2/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_9_au0fj3q3/project_StreamingDataWidthConverter_Batch_9/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_ConvolutionInputGenerator1D_2_05ze2gpp/project_ConvolutionInputGenerator1D_2/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_10_dn5m6kvz/project_StreamingDataWidthConverter_Batch_10/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFIFO_22_cc12jazb/project_StreamingFIFO_22/sol1/impl/verilog /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_2_8uay9h4c/project_StreamingFCLayer_Batch_2/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_11_gvp___yw/project_StreamingDataWidthConverter_Batch_11/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingMaxPool_Batch_3_ave51hf7/project_StreamingMaxPool_Batch_3/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingDataWidthConverter_Batch_12_8i0q1vn4/project_StreamingDataWidthConverter_Batch_12/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_Thresholding_Batch_3_4b2gfw9o/project_Thresholding_Batch_3/sol1/impl/ip /tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_3_cpz_29h1/project_StreamingFCLayer_Batch_3/sol1/impl/ip] [current_project]
update_ip_catalog
create_bd_design "finn_design"
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFIFO_0:1.0 StreamingFIFO_0
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingMaxPool_Batch_0:1.0 StreamingMaxPool_Batch_0
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_0:1.0 StreamingDataWidthConverter_Batch_0
create_bd_cell -type ip -vlnv xilinx.com:hls:Thresholding_Batch_0:1.0 Thresholding_Batch_0
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_1:1.0 StreamingDataWidthConverter_Batch_1
create_bd_cell -type ip -vlnv xilinx.com:hls:ConvolutionInputGenerator1D_0:1.0 ConvolutionInputGenerator1D_0
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_2:1.0 StreamingDataWidthConverter_Batch_2
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFIFO_6:1.0 StreamingFIFO_6
create_bd_cell -type hier StreamingFCLayer_Batch_0
create_bd_pin -dir I -type clk /StreamingFCLayer_Batch_0/ap_clk
create_bd_pin -dir I -type rst /StreamingFCLayer_Batch_0/ap_rst_n
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFCLayer_Batch_0/out_V_V
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFCLayer_Batch_0/in0_V_V
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFCLayer_Batch_0:1.0 /StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0
create_bd_cell -type ip -vlnv xilinx.com:user:memstream:1.0 /StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0_wstrm
set_property -dict [list CONFIG.NSTREAMS {1} CONFIG.MEM_DEPTH {250} CONFIG.MEM_WIDTH {360} CONFIG.MEM_INIT {/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_0_yrzn1xqf/} CONFIG.RAM_STYLE {auto} CONFIG.STRM0_DEPTH {250} CONFIG.STRM0_WIDTH {360} CONFIG.STRM0_OFFSET {0} ] [get_bd_cells /StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0_wstrm]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0_wstrm/m_axis_0] [get_bd_intf_pins StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0/weights_V_V]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_0/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0_wstrm/aresetn]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_0/ap_clk] [get_bd_pins StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0_wstrm/aclk]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_0/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0/ap_rst_n]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_0/ap_clk] [get_bd_pins StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_0/in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0/in0_V_V]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_0/out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_0/StreamingFCLayer_Batch_0/out_V_V]
save_bd_design
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_3:1.0 StreamingDataWidthConverter_Batch_3
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingMaxPool_Batch_1:1.0 StreamingMaxPool_Batch_1
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_4:1.0 StreamingDataWidthConverter_Batch_4
create_bd_cell -type ip -vlnv xilinx.com:hls:Thresholding_Batch_1:1.0 Thresholding_Batch_1
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_5:1.0 StreamingDataWidthConverter_Batch_5
create_bd_cell -type ip -vlnv xilinx.com:hls:ConvolutionInputGenerator1D_1:1.0 ConvolutionInputGenerator1D_1
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_6:1.0 StreamingDataWidthConverter_Batch_6
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFIFO_14:1.0 StreamingFIFO_14
create_bd_cell -type hier StreamingFCLayer_Batch_1
create_bd_pin -dir I -type clk /StreamingFCLayer_Batch_1/ap_clk
create_bd_pin -dir I -type rst /StreamingFCLayer_Batch_1/ap_rst_n
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFCLayer_Batch_1/out_V_V
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFCLayer_Batch_1/in0_V_V
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFCLayer_Batch_1:1.0 /StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1
create_bd_cell -type ip -vlnv xilinx.com:user:memstream:1.0 /StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1_wstrm
set_property -dict [list CONFIG.NSTREAMS {1} CONFIG.MEM_DEPTH {1125} CONFIG.MEM_WIDTH {320} CONFIG.MEM_INIT {/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_1_5eper8a6/} CONFIG.RAM_STYLE {auto} CONFIG.STRM0_DEPTH {1125} CONFIG.STRM0_WIDTH {320} CONFIG.STRM0_OFFSET {0} ] [get_bd_cells /StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1_wstrm]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1_wstrm/m_axis_0] [get_bd_intf_pins StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1/weights_V_V]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_1/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1_wstrm/aresetn]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_1/ap_clk] [get_bd_pins StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1_wstrm/aclk]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_1/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1/ap_rst_n]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_1/ap_clk] [get_bd_pins StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_1/in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1/in0_V_V]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_1/out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_1/StreamingFCLayer_Batch_1/out_V_V]
save_bd_design
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_7:1.0 StreamingDataWidthConverter_Batch_7
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingMaxPool_Batch_2:1.0 StreamingMaxPool_Batch_2
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_8:1.0 StreamingDataWidthConverter_Batch_8
create_bd_cell -type ip -vlnv xilinx.com:hls:Thresholding_Batch_2:1.0 Thresholding_Batch_2
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_9:1.0 StreamingDataWidthConverter_Batch_9
create_bd_cell -type ip -vlnv xilinx.com:hls:ConvolutionInputGenerator1D_2:1.0 ConvolutionInputGenerator1D_2
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_10:1.0 StreamingDataWidthConverter_Batch_10
create_bd_cell -type hier StreamingFIFO_22
create_bd_pin -dir I -type clk /StreamingFIFO_22/ap_clk
create_bd_pin -dir I -type rst /StreamingFIFO_22/ap_rst_n
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFIFO_22/out_V_V
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFIFO_22/in0_V_V
create_bd_cell -type ip -vlnv xilinx.com:ip:axis_data_fifo:2.0 /StreamingFIFO_22/fifo
set_property -dict [list CONFIG.FIFO_DEPTH {512}] [get_bd_cells /StreamingFIFO_22/fifo]
set_property -dict [list CONFIG.FIFO_MEMORY_TYPE {auto}] [get_bd_cells /StreamingFIFO_22/fifo]
set_property -dict [list CONFIG.TDATA_NUM_BYTES {10}] [get_bd_cells /StreamingFIFO_22/fifo]
connect_bd_intf_net [get_bd_intf_pins StreamingFIFO_22/fifo/M_AXIS] [get_bd_intf_pins StreamingFIFO_22/out_V_V]
connect_bd_intf_net [get_bd_intf_pins StreamingFIFO_22/fifo/S_AXIS] [get_bd_intf_pins StreamingFIFO_22/in0_V_V]
connect_bd_net [get_bd_pins StreamingFIFO_22/ap_rst_n] [get_bd_pins StreamingFIFO_22/fifo/s_axis_aresetn]
connect_bd_net [get_bd_pins StreamingFIFO_22/ap_clk] [get_bd_pins StreamingFIFO_22/fifo/s_axis_aclk]
create_bd_cell -type hier StreamingFCLayer_Batch_2
create_bd_pin -dir I -type clk /StreamingFCLayer_Batch_2/ap_clk
create_bd_pin -dir I -type rst /StreamingFCLayer_Batch_2/ap_rst_n
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFCLayer_Batch_2/out_V_V
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFCLayer_Batch_2/in0_V_V
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFCLayer_Batch_2:1.0 /StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2
create_bd_cell -type ip -vlnv xilinx.com:user:memstream:1.0 /StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2_wstrm
set_property -dict [list CONFIG.NSTREAMS {1} CONFIG.MEM_DEPTH {18000} CONFIG.MEM_WIDTH {80} CONFIG.MEM_INIT {/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_2_8uay9h4c/} CONFIG.RAM_STYLE {auto} CONFIG.STRM0_DEPTH {18000} CONFIG.STRM0_WIDTH {80} CONFIG.STRM0_OFFSET {0} ] [get_bd_cells /StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2_wstrm]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2_wstrm/m_axis_0] [get_bd_intf_pins StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2/weights_V_V]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_2/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2_wstrm/aresetn]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_2/ap_clk] [get_bd_pins StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2_wstrm/aclk]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_2/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2/ap_rst_n]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_2/ap_clk] [get_bd_pins StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_2/in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2/in0_V_V]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_2/out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_2/StreamingFCLayer_Batch_2/out_V_V]
save_bd_design
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_11:1.0 StreamingDataWidthConverter_Batch_11
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingMaxPool_Batch_3:1.0 StreamingMaxPool_Batch_3
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingDataWidthConverter_Batch_12:1.0 StreamingDataWidthConverter_Batch_12
create_bd_cell -type ip -vlnv xilinx.com:hls:Thresholding_Batch_3:1.0 Thresholding_Batch_3
create_bd_cell -type hier StreamingFCLayer_Batch_3
create_bd_pin -dir I -type clk /StreamingFCLayer_Batch_3/ap_clk
create_bd_pin -dir I -type rst /StreamingFCLayer_Batch_3/ap_rst_n
create_bd_intf_pin -mode Master -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFCLayer_Batch_3/out_V_V
create_bd_intf_pin -mode Slave -vlnv xilinx.com:interface:axis_rtl:1.0 /StreamingFCLayer_Batch_3/in0_V_V
create_bd_cell -type ip -vlnv xilinx.com:hls:StreamingFCLayer_Batch_3:1.0 /StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3
create_bd_cell -type ip -vlnv xilinx.com:user:memstream:1.0 /StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3_wstrm
set_property -dict [list CONFIG.NSTREAMS {1} CONFIG.MEM_DEPTH {200} CONFIG.MEM_WIDTH {8} CONFIG.MEM_INIT {/tmp/finn_dev_floodd1@ad.mee.tcd.ie/code_gen_ipgen_StreamingFCLayer_Batch_3_cpz_29h1/} CONFIG.RAM_STYLE {auto} CONFIG.STRM0_DEPTH {200} CONFIG.STRM0_WIDTH {8} CONFIG.STRM0_OFFSET {0} ] [get_bd_cells /StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3_wstrm]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3_wstrm/m_axis_0] [get_bd_intf_pins StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3/weights_V_V]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_3/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3_wstrm/aresetn]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_3/ap_clk] [get_bd_pins StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3_wstrm/aclk]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_3/ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3/ap_rst_n]
connect_bd_net [get_bd_pins StreamingFCLayer_Batch_3/ap_clk] [get_bd_pins StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_3/in0_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3/in0_V_V]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_3/out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_3/StreamingFCLayer_Batch_3/out_V_V]
save_bd_design
make_bd_pins_external [get_bd_pins StreamingFIFO_0/ap_clk]
set_property name ap_clk [get_bd_ports ap_clk_0]
make_bd_pins_external [get_bd_pins StreamingFIFO_0/ap_rst_n]
set_property name ap_rst_n [get_bd_ports ap_rst_n_0]
make_bd_intf_pins_external [get_bd_intf_pins StreamingFIFO_0/in0_V_V]
set_property name s_axis_0 [get_bd_intf_ports in0_V_V_0]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingMaxPool_Batch_0/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingMaxPool_Batch_0/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFIFO_0/out_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_0/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_0/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_0/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingMaxPool_Batch_0/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_0/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins Thresholding_Batch_0/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins Thresholding_Batch_0/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_0/out_V_V] [get_bd_intf_pins Thresholding_Batch_0/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_1/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_1/ap_clk]
connect_bd_intf_net [get_bd_intf_pins Thresholding_Batch_0/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_1/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ConvolutionInputGenerator1D_0/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ConvolutionInputGenerator1D_0/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_1/out_V_V] [get_bd_intf_pins ConvolutionInputGenerator1D_0/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_2/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_2/ap_clk]
connect_bd_intf_net [get_bd_intf_pins ConvolutionInputGenerator1D_0/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_2/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingFIFO_6/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingFIFO_6/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_2/out_V_V] [get_bd_intf_pins StreamingFIFO_6/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_0/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingFCLayer_Batch_0/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFIFO_6/out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_0/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_3/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_3/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_0/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_3/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingMaxPool_Batch_1/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingMaxPool_Batch_1/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_3/out_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_1/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_4/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_4/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingMaxPool_Batch_1/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_4/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins Thresholding_Batch_1/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins Thresholding_Batch_1/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_4/out_V_V] [get_bd_intf_pins Thresholding_Batch_1/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_5/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_5/ap_clk]
connect_bd_intf_net [get_bd_intf_pins Thresholding_Batch_1/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_5/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ConvolutionInputGenerator1D_1/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ConvolutionInputGenerator1D_1/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_5/out_V_V] [get_bd_intf_pins ConvolutionInputGenerator1D_1/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_6/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_6/ap_clk]
connect_bd_intf_net [get_bd_intf_pins ConvolutionInputGenerator1D_1/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_6/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingFIFO_14/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingFIFO_14/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_6/out_V_V] [get_bd_intf_pins StreamingFIFO_14/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_1/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingFCLayer_Batch_1/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFIFO_14/out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_1/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_7/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_7/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_1/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_7/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingMaxPool_Batch_2/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingMaxPool_Batch_2/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_7/out_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_2/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_8/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_8/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingMaxPool_Batch_2/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_8/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins Thresholding_Batch_2/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins Thresholding_Batch_2/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_8/out_V_V] [get_bd_intf_pins Thresholding_Batch_2/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_9/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_9/ap_clk]
connect_bd_intf_net [get_bd_intf_pins Thresholding_Batch_2/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_9/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins ConvolutionInputGenerator1D_2/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins ConvolutionInputGenerator1D_2/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_9/out_V_V] [get_bd_intf_pins ConvolutionInputGenerator1D_2/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_10/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_10/ap_clk]
connect_bd_intf_net [get_bd_intf_pins ConvolutionInputGenerator1D_2/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_10/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingFIFO_22/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingFIFO_22/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_10/out_V_V] [get_bd_intf_pins StreamingFIFO_22/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_2/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingFCLayer_Batch_2/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFIFO_22/out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_2/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_11/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_11/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingFCLayer_Batch_2/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_11/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingMaxPool_Batch_3/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingMaxPool_Batch_3/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_11/out_V_V] [get_bd_intf_pins StreamingMaxPool_Batch_3/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingDataWidthConverter_Batch_12/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingDataWidthConverter_Batch_12/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingMaxPool_Batch_3/out_V_V] [get_bd_intf_pins StreamingDataWidthConverter_Batch_12/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins Thresholding_Batch_3/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins Thresholding_Batch_3/ap_clk]
connect_bd_intf_net [get_bd_intf_pins StreamingDataWidthConverter_Batch_12/out_V_V] [get_bd_intf_pins Thresholding_Batch_3/in0_V_V]
connect_bd_net [get_bd_ports ap_rst_n] [get_bd_pins StreamingFCLayer_Batch_3/ap_rst_n]
connect_bd_net [get_bd_ports ap_clk] [get_bd_pins StreamingFCLayer_Batch_3/ap_clk]
connect_bd_intf_net [get_bd_intf_pins Thresholding_Batch_3/out_V_V] [get_bd_intf_pins StreamingFCLayer_Batch_3/in0_V_V]
make_bd_intf_pins_external [get_bd_intf_pins StreamingFCLayer_Batch_3/out_V_V]
set_property name m_axis_0 [get_bd_intf_ports out_V_V_0]
set_property CONFIG.FREQ_HZ 100000000.000000 [get_bd_ports /ap_clk]
regenerate_bd_layout
validate_bd_design
save_bd_design
make_wrapper -files [get_files /tmp/finn_dev_floodd1@ad.mee.tcd.ie/vivado_stitch_proj_fo405gew/finn_vivado_stitch_proj.srcs/sources_1/bd/finn_design/finn_design.bd] -top
add_files -norecurse /tmp/finn_dev_floodd1@ad.mee.tcd.ie/vivado_stitch_proj_fo405gew/finn_vivado_stitch_proj.srcs/sources_1/bd/finn_design/hdl/finn_design_wrapper.v
ipx::package_project -root_dir /tmp/finn_dev_floodd1@ad.mee.tcd.ie/vivado_stitch_proj_fo405gew/ip -vendor xilinx_finn -library finn -taxonomy /UserIP -module finn_design -import_files
set_property core_revision 2 [ipx::find_open_core xilinx_finn:finn:finn_design:1.0]
ipx::create_xgui_files [ipx::find_open_core xilinx_finn:finn:finn_design:1.0]
set_property value_resolve_type user [ipx::get_bus_parameters -of [ipx::get_bus_interfaces -of [ipx::current_core ]]]
ipx::update_checksums [ipx::find_open_core xilinx_finn:finn:finn_design:1.0]
ipx::save_core [ipx::find_open_core xilinx_finn:finn:finn_design:1.0]
set all_v_files [get_files -filter {FILE_TYPE == Verilog && USED_IN_SYNTHESIS == 1} ]
set fp [open /tmp/finn_dev_floodd1@ad.mee.tcd.ie/vivado_stitch_proj_fo405gew/all_verilog_srcs.txt w]
foreach vf $all_v_files {puts $fp $vf}
close $fp
