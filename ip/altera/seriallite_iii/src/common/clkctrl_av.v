// (C) 2001-2013 Altera Corporation. All rights reserved.
// Your use of Altera Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License Subscription 
// Agreement, Altera MegaCore Function License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// megafunction wizard: %ALTCLKCTRL%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altclkctrl 

// ============================================================
// File Name: clkctrl.v
// Megafunction Name(s):
// 			altclkctrl
//
// Simulation Library Files(s):
// 			arriavgz
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 13.0.0 Internal Build 137 02/18/2013 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2013 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//altclkctrl CBX_AUTO_BLACKBOX="ALL" CLOCK_TYPE="AUTO" DEVICE_FAMILY="Arria V GZ" ENA_REGISTER_MODE="always enabled" USE_GLITCH_FREE_SWITCH_OVER_IMPLEMENTATION="OFF" ena inclk outclk
//VERSION_BEGIN 13.0 cbx_altclkbuf 2013:02:18:18:04:21:SJ cbx_cycloneii 2013:02:18:18:04:21:SJ cbx_lpm_add_sub 2013:02:18:18:04:21:SJ cbx_lpm_compare 2013:02:18:18:04:21:SJ cbx_lpm_decode 2013:02:18:18:04:21:SJ cbx_lpm_mux 2013:02:18:18:04:21:SJ cbx_mgl 2013:02:18:18:30:53:SJ cbx_stratix 2013:02:18:18:04:21:SJ cbx_stratixii 2013:02:18:18:04:21:SJ cbx_stratixiii 2013:02:18:18:04:22:SJ cbx_stratixv 2013:02:18:18:04:22:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = arriavgz_clkena 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  clkctrl_altclkctrl_8ug
	( 
	ena,
	inclk,
	outclk) ;
	input   ena;
	input   [3:0]  inclk;
	output   outclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   ena;
	tri0   [3:0]  inclk;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  wire_sd1_outclk;
	wire [1:0]  clkselect;

	arriavgz_clkena   sd1
	( 
	.ena(ena),
	.enaout(),
	.inclk(inclk[0]),
	.outclk(wire_sd1_outclk));
	defparam
		sd1.clock_type = "Auto",
		sd1.ena_register_mode = "always enabled",
		sd1.lpm_type = "arriavgz_clkena";
	assign
		clkselect = {2{1'b0}},
		outclk = wire_sd1_outclk;
endmodule //clkctrl_altclkctrl_8ug
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module clkctrl (
	inclk,
	outclk);

	input	  inclk;
	output	  outclk;

	wire  sub_wire0;
	wire  sub_wire1 = 1'h1;
	wire [2:0] sub_wire4 = 3'h0;
	wire  outclk = sub_wire0;
	wire  sub_wire2 = inclk;
	wire [3:0] sub_wire3 = {sub_wire4, sub_wire2};

	clkctrl_altclkctrl_8ug	clkctrl_altclkctrl_8ug_component (
				.ena (sub_wire1),
				.inclk (sub_wire3),
				.outclk (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Arria V GZ"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: PRIVATE: clock_inputs NUMERIC "1"
// Retrieval info: CONSTANT: ENA_REGISTER_MODE STRING "always enabled"
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Arria V GZ"
// Retrieval info: CONSTANT: USE_GLITCH_FREE_SWITCH_OVER_IMPLEMENTATION STRING "OFF"
// Retrieval info: CONSTANT: clock_type STRING "AUTO"
// Retrieval info: USED_PORT: inclk 0 0 0 0 INPUT NODEFVAL "inclk"
// Retrieval info: USED_PORT: outclk 0 0 0 0 OUTPUT NODEFVAL "outclk"
// Retrieval info: CONNECT: @ena 0 0 0 0 VCC 0 0 0 0
// Retrieval info: CONNECT: @inclk 0 0 3 1 GND 0 0 3 0
// Retrieval info: CONNECT: @inclk 0 0 1 0 inclk 0 0 0 0
// Retrieval info: CONNECT: outclk 0 0 0 0 @outclk 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL clkctrl.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL clkctrl.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL clkctrl.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL clkctrl.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL clkctrl_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL clkctrl_bb.v TRUE
// Retrieval info: LIB_FILE: arriavgz
