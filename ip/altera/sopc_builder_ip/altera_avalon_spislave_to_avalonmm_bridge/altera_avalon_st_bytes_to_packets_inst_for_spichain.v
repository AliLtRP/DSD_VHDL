//Legal Notice: (C)2007 Altera Corporation. All rights reserved.  Your
//use of Altera Corporation's design tools, logic functions and other
//software and tools, and its AMPP partner logic functions, and any
//output files any of the foregoing (including device programming or
//simulation files), and any associated documentation or information are
//expressly subject to the terms and conditions of the Altera Program
//License Subscription Agreement or other applicable license agreement,
//including, without limitation, that your use is for the sole purpose
//of programming logic devices manufactured by Altera and sold by Altera
//or its authorized distributors.  Please refer to the applicable
//agreement for further details.

// synthesis translate_off
`timescale 1ns / 1ps
// synthesis translate_on

// turn off superfluous verilog processor warnings 
// altera message_level Level1 
// altera message_off 10034 10035 10036 10037 10230 10240 10030 

module altera_avalon_st_bytes_to_packets_inst_for_spichain (
                                                             // inputs:
                                                              clk,
                                                              in_data,
                                                              in_valid,
                                                              out_ready,
                                                              reset_n,

                                                             // outputs:
                                                              in_ready,
                                                              out_channel,
                                                              out_data,
                                                              out_endofpacket,
                                                              out_startofpacket,
                                                              out_valid
                                                           )
;

  output           in_ready;
  output  [  7: 0] out_channel;
  output  [  7: 0] out_data;
  output           out_endofpacket;
  output           out_startofpacket;
  output           out_valid;
  input            clk;
  input   [  7: 0] in_data;
  input            in_valid;
  input            out_ready;
  input            reset_n;

  wire             in_ready;
  wire    [  7: 0] out_channel;
  wire    [  7: 0] out_data;
  wire             out_endofpacket;
  wire             out_startofpacket;
  wire             out_valid;
  altera_avalon_st_bytes_to_packets the_altera_avalon_st_bytes_to_packets
    (
      .clk               (clk),
      .in_data           (in_data),
      .in_ready          (in_ready),
      .in_valid          (in_valid),
      .out_channel       (out_channel),
      .out_data          (out_data),
      .out_endofpacket   (out_endofpacket),
      .out_ready         (out_ready),
      .out_startofpacket (out_startofpacket),
      .out_valid         (out_valid),
      .reset_n           (reset_n)
    );


endmodule

