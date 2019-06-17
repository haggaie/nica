// Sigmon monitors
//
module sigmon_monitors 
  (		       
		       input wire 	  clk,
		       input wire 	  reset,
		       input wire 	  monitoring_enable, 
		       input wire 	  sigmon_enable_event,
		       input wire 	  timestamp_counter_24toggle,
		       input wire 	  nwp2sbu_sop,
		       input wire 	  nwp2sbu_eop,
		       input wire 	  sbu2nwp_sop,
		       input wire 	  sbu2nwp_eop,
		       input wire 	  cxp2sbu_sop,
		       input wire 	  cxp2sbu_eop,
		       input wire 	  sbu2cxp_sop,
		       input wire 	  sbu2cxp_eop,
		       input wire 	  sbu2cxpfifo_sop,
		       input wire 	  sbu2cxpfifo_eop,
		       input wire 	  sbu2nwpfifo_sop,
		       input wire 	  sbu2nwpfifo_eop,
		       input wire 	  nwp2sbu_lossless_credits_on,
		       input wire 	  cxp2sbu_lossless_credits_on,
		       input wire 	  nwp2sbu_lossless_credits_off,
		       input wire 	  cxp2sbu_lossless_credits_off,
		       input wire 	  got_ikwaddr,
		       input wire 	  got_ikraddr,
		       input wire 	  got_ddrwaddr,
		       input wire 	  got_ddrwdata,
		       input wire 	  got_ddrwdone,
		       input wire 	  got_ddrraddr,
		       input wire 	  got_ddrrdata,
                       input wire         axi4mm_aw_rdy,
                       input wire         axi4mm_aw_vld,
                       input wire         axi4mm_w_rdy,
                       input wire         axi4mm_w_vld,
                       input wire         axi4mm_w_last,
                       input wire         axi4mm_b_rdy,
                       input wire         axi4mm_b_vld,
                       input wire         axi4mm_ar_rdy,
                       input wire         axi4mm_ar_vld,
                       input wire         axi4mm_r_rdy,
                       input wire         axi4mm_r_vld,
                       input wire         axi4mm_r_last,
		       input wire 	  dram_test_enabled,
		       input wire [15:0]  nica_events,
		       input wire [15:0]  count_events,
		       input wire [2:0]   clb0_events,
		       input wire [2:0]   clb1_events,
		       input wire [2:0]   clb2_events,
		       input wire [2:0]   clb3_events,
		       input wire 	  clb0_out_on,
		       input wire 	  clb0_out_off,
		       input wire 	  clb1_out_on,
		       input wire 	  clb1_out_off,
		       input wire 	  clb2_out_on,
		       input wire 	  clb2_out_off,
		       input wire 	  clb3_out_on,
		       input wire 	  clb3_out_off,
		       input wire 	  stream0_match,
		       input wire 	  stream0_sample,
		       input wire 	  stream1_match,
		       input wire 	  stream1_sample,
		       input wire 	  stream2_match,
		       input wire 	  stream2_sample,
		       input wire 	  stream3_match,
		       input wire 	  stream3_sample,
		       input wire 	  stream0_merged,
		       input wire 	  stream1_merged,
		       input wire 	  stream2_merged,
		       input wire 	  stream3_merged,
		       input wire [47:0]  stream0_sample_data,
		       input wire [47:0]  stream1_sample_data,
		       input wire [47:0]  stream2_sample_data,
		       input wire [47:0]  stream3_sample_data,
		       input wire [15:0]  monitor0_events_select,
		       input wire [15:0]  monitor1_events_select,
		       input wire [15:0]  monitor2_events_select,
		       input wire [15:0]  monitor3_events_select,
		       input wire [15:0]  monitor4_events_select,
		       input wire [15:0]  monitor5_events_select,
		       input wire [15:0]  monitor6_events_select,
		       input wire [15:0]  monitor7_events_select,
		       input wire [7:0]   monitors_fifo_rd,
		       output wire [35:0] monitor0_fifo_data, 
		       output wire [35:0] monitor1_fifo_data, 
		       output wire [35:0] monitor2_fifo_data, 
		       output wire [35:0] monitor3_fifo_data, 
		       output wire [35:0] monitor4_fifo_data, 
		       output wire [35:0] monitor5_fifo_data, 
		       output wire [35:0] monitor6_fifo_data, 
		       output wire [35:0] monitor7_fifo_data, 
		       output wire [10:0] monitor0_fifo_data_count, 
		       output wire [10:0] monitor1_fifo_data_count, 
		       output wire [10:0] monitor2_fifo_data_count, 
		       output wire [10:0] monitor3_fifo_data_count, 
		       output wire [10:0] monitor4_fifo_data_count, 
		       output wire [10:0] monitor5_fifo_data_count, 
		       output wire [10:0] monitor6_fifo_data_count, 
		       output wire [10:0] monitor7_fifo_data_count, 
		       output wire [7:0]  monitors_valid,
		       output wire [7:0]  monitors_data_loss
);

  sigmon_monitor  monitor0 (
 .clk(clk),
 .reset(reset),
 .monitor_enable(monitoring_enable),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .axi4mm_aw_rdy(axi4mm_aw_rdy),
 .axi4mm_aw_vld(axi4mm_aw_vld),
 .axi4mm_w_rdy(axi4mm_w_rdy),
 .axi4mm_w_vld(axi4mm_w_vld),
 .axi4mm_w_last(axi4mm_w_last),
 .axi4mm_b_rdy(axi4mm_b_rdy),
 .axi4mm_b_vld(axi4mm_b_vld),
 .axi4mm_ar_rdy(axi4mm_ar_rdy),
 .axi4mm_ar_vld(axi4mm_ar_vld),
 .axi4mm_r_rdy(axi4mm_r_rdy),
 .axi4mm_r_vld(axi4mm_r_vld),
 .axi4mm_r_last(axi4mm_r_last),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events(count_events),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .sample0_datain(stream0_sample_data),
 .sample1_datain(stream1_sample_data),
 .sample2_datain(stream2_sample_data),
 .sample3_datain(stream3_sample_data),

.events_id(monitor0_events_select),
.data_read(monitors_fifo_rd[0]),
.data_out(monitor0_fifo_data), 
.data_count(monitor0_fifo_data_count), 
.data_valid(monitors_valid[0]),
.data_loss(monitors_data_loss[0])
 );
  
  sigmon_monitor  monitor1 (
 .clk(clk),
 .reset(reset),
 .monitor_enable(monitoring_enable),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events(count_events),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .sample0_datain(stream0_sample_data),
 .sample1_datain(stream1_sample_data),
 .sample2_datain(stream2_sample_data),
 .sample3_datain(stream3_sample_data),

.events_id(monitor1_events_select),
.data_read(monitors_fifo_rd[1]),
.data_out(monitor1_fifo_data), 
.data_count(monitor1_fifo_data_count), 
.data_valid(monitors_valid[1]),
.data_loss(monitors_data_loss[1])
 );
  
  sigmon_monitor  monitor2 (
 .clk(clk),
 .reset(reset),
 .monitor_enable(monitoring_enable),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events(count_events),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .sample0_datain(stream0_sample_data),
 .sample1_datain(stream1_sample_data),
 .sample2_datain(stream2_sample_data),
 .sample3_datain(stream3_sample_data),

.events_id(monitor2_events_select),
.data_read(monitors_fifo_rd[2]),
.data_out(monitor2_fifo_data), 
.data_count(monitor2_fifo_data_count), 
.data_valid(monitors_valid[2]),
.data_loss(monitors_data_loss[2])
 );
  
  sigmon_monitor  monitor3 (
 .clk(clk),
 .reset(reset),
 .monitor_enable(monitoring_enable),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events(count_events),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .sample0_datain(stream0_sample_data),
 .sample1_datain(stream1_sample_data),
 .sample2_datain(stream2_sample_data),
 .sample3_datain(stream3_sample_data),

.events_id(monitor3_events_select),
.data_read(monitors_fifo_rd[3]),
.data_out(monitor3_fifo_data), 
.data_count(monitor3_fifo_data_count), 
.data_valid(monitors_valid[3]),
.data_loss(monitors_data_loss[3])
 );
  
  sigmon_monitor  monitor4 (
 .clk(clk),
 .reset(reset),
 .monitor_enable(monitoring_enable),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events(count_events),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .sample0_datain(stream0_sample_data),
 .sample1_datain(stream1_sample_data),
 .sample2_datain(stream2_sample_data),
 .sample3_datain(stream3_sample_data),

.events_id(monitor4_events_select),
.data_read(monitors_fifo_rd[4]),
.data_out(monitor4_fifo_data), 
.data_count(monitor4_fifo_data_count), 
.data_valid(monitors_valid[4]),
.data_loss(monitors_data_loss[4])
 );
  
  sigmon_monitor  monitor5 (
 .clk(clk),
 .reset(reset),
 .monitor_enable(monitoring_enable),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events(count_events),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .sample0_datain(stream0_sample_data),
 .sample1_datain(stream1_sample_data),
 .sample2_datain(stream2_sample_data),
 .sample3_datain(stream3_sample_data),

.events_id(monitor5_events_select),
.data_read(monitors_fifo_rd[5]),
.data_out(monitor5_fifo_data), 
.data_count(monitor5_fifo_data_count), 
.data_valid(monitors_valid[5]),
.data_loss(monitors_data_loss[5])
 );
  
  sigmon_monitor  monitor6 (
 .clk(clk),
 .reset(reset),
 .monitor_enable(monitoring_enable),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events(count_events),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .sample0_datain(stream0_sample_data),
 .sample1_datain(stream1_sample_data),
 .sample2_datain(stream2_sample_data),
 .sample3_datain(stream3_sample_data),

.events_id(monitor6_events_select),
.data_read(monitors_fifo_rd[6]),
.data_out(monitor6_fifo_data), 
.data_count(monitor6_fifo_data_count), 
.data_valid(monitors_valid[6]),
.data_loss(monitors_data_loss[6])
 );
  
  sigmon_monitor  monitor7 (
 .clk(clk),
 .reset(reset),
 .monitor_enable(monitoring_enable),
 .sigmon_enable_event(sigmon_enable_event),
 .timestamp_counter_24toggle(timestamp_counter_24toggle),
 .nwp2sbu_sop(nwp2sbu_sop),
 .nwp2sbu_eop(nwp2sbu_eop),
 .sbu2nwp_sop(sbu2nwp_sop),
 .sbu2nwp_eop(sbu2nwp_eop),
 .cxp2sbu_sop(cxp2sbu_sop),
 .cxp2sbu_eop(cxp2sbu_eop),
 .sbu2cxp_sop(sbu2cxp_sop),
 .sbu2cxp_eop(sbu2cxp_eop),
 .sbu2cxpfifo_sop(sbu2cxpfifo_sop),
 .sbu2cxpfifo_eop(sbu2cxpfifo_eop),
 .sbu2nwpfifo_sop(sbu2nwpfifo_sop),
 .sbu2nwpfifo_eop(sbu2nwpfifo_eop),
 .nwp2sbu_lossless_credits_on(nwp2sbu_lossless_credits_on),
 .cxp2sbu_lossless_credits_on(cxp2sbu_lossless_credits_on),
 .nwp2sbu_lossless_credits_off(nwp2sbu_lossless_credits_off),
 .cxp2sbu_lossless_credits_off(cxp2sbu_lossless_credits_off),
 .got_ikwaddr(got_ikwaddr),
 .got_ikraddr(got_ikraddr),
 .got_ddrwaddr(got_ddrwaddr),
 .got_ddrwdata(got_ddrwdata),
 .got_ddrwdone(got_ddrwdone),
 .got_ddrraddr(got_ddrraddr),
 .got_ddrrdata(got_ddrrdata),
 .dram_test_enabled(dram_test_enabled),
 .nica_events(nica_events),
 .count_events(count_events),
 .clb0_events(clb0_events),
 .clb1_events(clb1_events),
 .clb0_out_on(clb0_out_on),
 .clb0_out_off(clb0_out_off),
 .clb1_out_on(clb1_out_on),
 .clb1_out_off(clb1_out_off),
 .clb2_events(clb2_events),
 .clb3_events(clb3_events),
 .clb2_out_on(clb2_out_on),
 .clb2_out_off(clb2_out_off),
 .clb3_out_on(clb3_out_on),
 .clb3_out_off(clb3_out_off),
 .stream0_match(stream0_match),
 .stream0_sample(stream0_sample),
 .stream1_match(stream1_match),
 .stream1_sample(stream1_sample),
 .stream2_match(stream2_match),
 .stream2_sample(stream2_sample),
 .stream3_match(stream3_match),
 .stream3_sample(stream3_sample),
 .stream0_merged(stream0_merged),
 .stream1_merged(stream1_merged),
 .stream2_merged(stream2_merged),
 .stream3_merged(stream3_merged),
 .sample0_datain(stream0_sample_data),
 .sample1_datain(stream1_sample_data),
 .sample2_datain(stream2_sample_data),
 .sample3_datain(stream3_sample_data),

.events_id(monitor7_events_select),
.data_read(monitors_fifo_rd[7]),
.data_out(monitor7_fifo_data), 
.data_count(monitor7_fifo_data_count), 
.data_valid(monitors_valid[7]),
.data_loss(monitors_data_loss[7])
 );
  
endmodule
