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


// megafunction wizard: %ALTECC%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altecc_decoder 

// ============================================================
// File Name: alt_ddrx_decoder_40.v
// Megafunction Name(s):
// 			altecc_decoder
//
// Simulation Library Files(s):
// 			lpm
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 9.1 Internal Build 157 07/06/2009 PN Web Edition
// ************************************************************


//Copyright (C) 1991-2010 Altera Corporation
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


//VERSION_BEGIN 9.1 cbx_altecc_decoder 2009:06:09:13:32:57:PN cbx_cycloneii 2008:05:20:01:57:37:PN cbx_lpm_add_sub 2009:05:05:06:30:25:PN cbx_lpm_compare 2009:02:26:09:32:14:PN cbx_lpm_decode 2009:02:26:09:32:14:PN cbx_mgl 2009:07:03:02:47:54:PN cbx_stratix 2009:07:02:14:27:13:PN cbx_stratixii 2009:05:21:05:59:50:PN  VERSION_END
//__ACDS_USER_COMMENT__ synthesis VERILOG_INPUT_VERSION VERILOG_2001
//__ACDS_USER_COMMENT__ altera message_off 10463


//__ACDS_USER_COMMENT__ synthesis_resources = lpm_decode 1 lut 35 mux21 32 
//__ACDS_USER_COMMENT__ synopsys translate_off
`timescale 1 ps / 1 ps
//__ACDS_USER_COMMENT__ synopsys translate_on
module  alt_ddrx_decoder_40_altecc_decoder_c8f
	( 
	clock,
	data,
	err_corrected,
	err_detected,
	err_fatal,
	q) ;
	input   clock;
	input   [38:0]  data;
	output   err_corrected;
	output   err_detected;
	output   err_fatal;
	output   [31:0]  q;
`ifndef ALTERA_RESERVED_QIS
//__ACDS_USER_COMMENT__ synopsys translate_off
`endif
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
//__ACDS_USER_COMMENT__ synopsys translate_on
`endif

	reg	[0:0]	err_corrected_pipeline0c;
	reg	[0:0]	err_detected_pipeline0c;
	reg	[0:0]	err_fatal_pipeline0c;
	reg	[31:0]	output_pipeline0c;
	wire  [63:0]   wire_error_bit_decoder_eq;
	wire	wire_mux21_0_dataout;
	wire	wire_mux21_1_dataout;
	wire	wire_mux21_10_dataout;
	wire	wire_mux21_11_dataout;
	wire	wire_mux21_12_dataout;
	wire	wire_mux21_13_dataout;
	wire	wire_mux21_14_dataout;
	wire	wire_mux21_15_dataout;
	wire	wire_mux21_16_dataout;
	wire	wire_mux21_17_dataout;
	wire	wire_mux21_18_dataout;
	wire	wire_mux21_19_dataout;
	wire	wire_mux21_2_dataout;
	wire	wire_mux21_20_dataout;
	wire	wire_mux21_21_dataout;
	wire	wire_mux21_22_dataout;
	wire	wire_mux21_23_dataout;
	wire	wire_mux21_24_dataout;
	wire	wire_mux21_25_dataout;
	wire	wire_mux21_26_dataout;
	wire	wire_mux21_27_dataout;
	wire	wire_mux21_28_dataout;
	wire	wire_mux21_29_dataout;
	wire	wire_mux21_3_dataout;
	wire	wire_mux21_30_dataout;
	wire	wire_mux21_31_dataout;
	wire	wire_mux21_4_dataout;
	wire	wire_mux21_5_dataout;
	wire	wire_mux21_6_dataout;
	wire	wire_mux21_7_dataout;
	wire	wire_mux21_8_dataout;
	wire	wire_mux21_9_dataout;
	wire aclr;
	wire clocken;
	wire  data_bit;
	wire  [31:0]  data_t;
	wire  [38:0]  data_wire;
	wire  [63:0]  decode_output;
	wire  err_corrected_wire;
	wire  err_detected_wire;
	wire  err_fatal_wire;
	wire  [18:0]  parity_01_wire;
	wire  [9:0]  parity_02_wire;
	wire  [4:0]  parity_03_wire;
	wire  [1:0]  parity_04_wire;
	wire  [0:0]  parity_05_wire;
	wire  [5:0]  parity_06_wire;
	wire  parity_bit;
	wire  [37:0]  parity_final_wire;
	wire  [5:0]  parity_t;
	wire  [31:0]  q_wire;
	wire  syn_bit;
	wire  syn_e;
	wire  [4:0]  syn_t;
	wire  [6:0]  syndrome;

	//__ACDS_USER_COMMENT__ synopsys translate_off
	initial
		err_corrected_pipeline0c = 0;
	//__ACDS_USER_COMMENT__ synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) err_corrected_pipeline0c <= 1'b0;
		else if  (clocken == 1'b1)   err_corrected_pipeline0c <= err_corrected_wire;
	//__ACDS_USER_COMMENT__ synopsys translate_off
	initial
		err_detected_pipeline0c = 0;
	//__ACDS_USER_COMMENT__ synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) err_detected_pipeline0c <= 1'b0;
		else if  (clocken == 1'b1)   err_detected_pipeline0c <= err_detected_wire;
	//__ACDS_USER_COMMENT__ synopsys translate_off
	initial
		err_fatal_pipeline0c = 0;
	//__ACDS_USER_COMMENT__ synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) err_fatal_pipeline0c <= 1'b0;
		else if  (clocken == 1'b1)   err_fatal_pipeline0c <= err_fatal_wire;
	//__ACDS_USER_COMMENT__ synopsys translate_off
	initial
		output_pipeline0c = 0;
	//__ACDS_USER_COMMENT__ synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) output_pipeline0c <= 32'b0;
		else if  (clocken == 1'b1)   output_pipeline0c <= q_wire;
	lpm_decode   error_bit_decoder
	( 
	.data(syndrome[5:0]),
	.eq(wire_error_bit_decoder_eq)
	`ifndef FORMAL_VERIFICATION
	//__ACDS_USER_COMMENT__ synopsys translate_off
	`endif
	,
	.aclr(1'b0),
	.clken(1'b1),
	//.clock(1'b0),
	.enable(1'b1)
	`ifndef FORMAL_VERIFICATION
	//__ACDS_USER_COMMENT__ synopsys translate_on
	`endif
	);
	defparam
		error_bit_decoder.lpm_decodes = 64,
		error_bit_decoder.lpm_width = 6,
		error_bit_decoder.lpm_type = "lpm_decode";
	assign		wire_mux21_0_dataout = (syndrome[6] === 1'b1) ? (decode_output[3] ^ data_wire[0]) : data_wire[0];
	assign		wire_mux21_1_dataout = (syndrome[6] === 1'b1) ? (decode_output[5] ^ data_wire[1]) : data_wire[1];
	assign		wire_mux21_10_dataout = (syndrome[6] === 1'b1) ? (decode_output[15] ^ data_wire[10]) : data_wire[10];
	assign		wire_mux21_11_dataout = (syndrome[6] === 1'b1) ? (decode_output[17] ^ data_wire[11]) : data_wire[11];
	assign		wire_mux21_12_dataout = (syndrome[6] === 1'b1) ? (decode_output[18] ^ data_wire[12]) : data_wire[12];
	assign		wire_mux21_13_dataout = (syndrome[6] === 1'b1) ? (decode_output[19] ^ data_wire[13]) : data_wire[13];
	assign		wire_mux21_14_dataout = (syndrome[6] === 1'b1) ? (decode_output[20] ^ data_wire[14]) : data_wire[14];
	assign		wire_mux21_15_dataout = (syndrome[6] === 1'b1) ? (decode_output[21] ^ data_wire[15]) : data_wire[15];
	assign		wire_mux21_16_dataout = (syndrome[6] === 1'b1) ? (decode_output[22] ^ data_wire[16]) : data_wire[16];
	assign		wire_mux21_17_dataout = (syndrome[6] === 1'b1) ? (decode_output[23] ^ data_wire[17]) : data_wire[17];
	assign		wire_mux21_18_dataout = (syndrome[6] === 1'b1) ? (decode_output[24] ^ data_wire[18]) : data_wire[18];
	assign		wire_mux21_19_dataout = (syndrome[6] === 1'b1) ? (decode_output[25] ^ data_wire[19]) : data_wire[19];
	assign		wire_mux21_2_dataout = (syndrome[6] === 1'b1) ? (decode_output[6] ^ data_wire[2]) : data_wire[2];
	assign		wire_mux21_20_dataout = (syndrome[6] === 1'b1) ? (decode_output[26] ^ data_wire[20]) : data_wire[20];
	assign		wire_mux21_21_dataout = (syndrome[6] === 1'b1) ? (decode_output[27] ^ data_wire[21]) : data_wire[21];
	assign		wire_mux21_22_dataout = (syndrome[6] === 1'b1) ? (decode_output[28] ^ data_wire[22]) : data_wire[22];
	assign		wire_mux21_23_dataout = (syndrome[6] === 1'b1) ? (decode_output[29] ^ data_wire[23]) : data_wire[23];
	assign		wire_mux21_24_dataout = (syndrome[6] === 1'b1) ? (decode_output[30] ^ data_wire[24]) : data_wire[24];
	assign		wire_mux21_25_dataout = (syndrome[6] === 1'b1) ? (decode_output[31] ^ data_wire[25]) : data_wire[25];
	assign		wire_mux21_26_dataout = (syndrome[6] === 1'b1) ? (decode_output[33] ^ data_wire[26]) : data_wire[26];
	assign		wire_mux21_27_dataout = (syndrome[6] === 1'b1) ? (decode_output[34] ^ data_wire[27]) : data_wire[27];
	assign		wire_mux21_28_dataout = (syndrome[6] === 1'b1) ? (decode_output[35] ^ data_wire[28]) : data_wire[28];
	assign		wire_mux21_29_dataout = (syndrome[6] === 1'b1) ? (decode_output[36] ^ data_wire[29]) : data_wire[29];
	assign		wire_mux21_3_dataout = (syndrome[6] === 1'b1) ? (decode_output[7] ^ data_wire[3]) : data_wire[3];
	assign		wire_mux21_30_dataout = (syndrome[6] === 1'b1) ? (decode_output[37] ^ data_wire[30]) : data_wire[30];
	assign		wire_mux21_31_dataout = (syndrome[6] === 1'b1) ? (decode_output[38] ^ data_wire[31]) : data_wire[31];
	assign		wire_mux21_4_dataout = (syndrome[6] === 1'b1) ? (decode_output[9] ^ data_wire[4]) : data_wire[4];
	assign		wire_mux21_5_dataout = (syndrome[6] === 1'b1) ? (decode_output[10] ^ data_wire[5]) : data_wire[5];
	assign		wire_mux21_6_dataout = (syndrome[6] === 1'b1) ? (decode_output[11] ^ data_wire[6]) : data_wire[6];
	assign		wire_mux21_7_dataout = (syndrome[6] === 1'b1) ? (decode_output[12] ^ data_wire[7]) : data_wire[7];
	assign		wire_mux21_8_dataout = (syndrome[6] === 1'b1) ? (decode_output[13] ^ data_wire[8]) : data_wire[8];
	assign		wire_mux21_9_dataout = (syndrome[6] === 1'b1) ? (decode_output[14] ^ data_wire[9]) : data_wire[9];
	assign
		aclr = 1'b0,
		clocken = 1'b1,
		data_bit = data_t[31],
		data_t = {(data_t[30] | decode_output[38]), (data_t[29] | decode_output[37]), (data_t[28] | decode_output[36]), (data_t[27] | decode_output[35]), (data_t[26] | decode_output[34]), (data_t[25] | decode_output[33]), (data_t[24] | decode_output[31]), (data_t[23] | decode_output[30]), (data_t[22] | decode_output[29]), (data_t[21] | decode_output[28]), (data_t[20] | decode_output[27]), (data_t[19] | decode_output[26]), (data_t[18] | decode_output[25]), (data_t[17] | decode_output[24]), (data_t[16] | decode_output[23]), (data_t[15] | decode_output[22]), (data_t[14] | decode_output[21]), (data_t[13] | decode_output[20]), (data_t[12] | decode_output[19]), (data_t[11] | decode_output[18]), (data_t[10] | decode_output[17]), (data_t[9] | decode_output[15]), (data_t[8] | decode_output[14]), (data_t[7] | decode_output[13]), (data_t[6] | decode_output[12]), (data_t[5] | decode_output[11]), (data_t[4] | decode_output[10]), (data_t[3] | decode_output[9]), (data_t[2] | decode_output[7]), (data_t[1] | decode_output[6]), (data_t[0] | decode_output[5]), decode_output[3]},
		data_wire = data,
		decode_output = wire_error_bit_decoder_eq,
		err_corrected = err_corrected_pipeline0c,
		err_corrected_wire = ((syn_bit & syn_e) & data_bit),
		err_detected = err_detected_pipeline0c,
		err_detected_wire = (syn_bit & (~ (syn_e & parity_bit))),
		err_fatal = err_fatal_pipeline0c,
		err_fatal_wire = (err_detected_wire & (~ err_corrected_wire)),
		parity_01_wire = {(data_wire[30] ^ parity_01_wire[17]), (data_wire[28] ^ parity_01_wire[16]), (data_wire[26] ^ parity_01_wire[15]), (data_wire[25] ^ parity_01_wire[14]), (data_wire[23] ^ parity_01_wire[13]), (data_wire[21] ^ parity_01_wire[12]), (data_wire[19] ^ parity_01_wire[11]), (data_wire[17] ^ parity_01_wire[10]), (data_wire[15] ^ parity_01_wire[9]), (data_wire[13] ^ parity_01_wire[8]), (data_wire[11] ^ parity_01_wire[7]), (data_wire[10] ^ parity_01_wire[6]), (data_wire[8] ^ parity_01_wire[5]), (data_wire[6] ^ parity_01_wire[4]), (data_wire[4] ^ parity_01_wire[3]), (data_wire[3] ^ parity_01_wire[2]), (data_wire[1] ^ parity_01_wire[1]), (data_wire[0] ^ parity_01_wire[0]), data_wire[32]},
		parity_02_wire = {(data_wire[31] ^ parity_02_wire[8]), ((data_wire[27] ^ data_wire[28]) ^ parity_02_wire[7]), ((data_wire[24] ^ data_wire[25]) ^ parity_02_wire[6]), ((data_wire[20] ^ data_wire[21]) ^ parity_02_wire[5]), ((data_wire[16] ^ data_wire[17]) ^ parity_02_wire[4]), ((data_wire[12] ^ data_wire[13]) ^ parity_02_wire[3]), ((data_wire[9] ^ data_wire[10]) ^ parity_02_wire[2]), ((data_wire[5] ^ data_wire[6]) ^ parity_02_wire[1]), ((data_wire[2] ^ data_wire[3]) ^ parity_02_wire[0]), (data_wire[33] ^ data_wire[0])},
		parity_03_wire = {(((data_wire[29] ^ data_wire[30]) ^ data_wire[31]) ^ parity_03_wire[3]), ((((data_wire[22] ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25]) ^ parity_03_wire[2]), ((((data_wire[14] ^ data_wire[15]) ^ data_wire[16]) ^ data_wire[17]) ^ parity_03_wire[1]), ((((data_wire[7] ^ data_wire[8]) ^ data_wire[9]) ^ data_wire[10]) ^ parity_03_wire[0]), (((data_wire[34] ^ data_wire[1]) ^ data_wire[2]) ^ data_wire[3])},
		parity_04_wire = {((((((((data_wire[18] ^ data_wire[19]) ^ data_wire[20]) ^ data_wire[21]) ^ data_wire[22]) ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25]) ^ parity_04_wire[0]), (((((((data_wire[35] ^ data_wire[4]) ^ data_wire[5]) ^ data_wire[6]) ^ data_wire[7]) ^ data_wire[8]) ^ data_wire[9]) ^ data_wire[10])},
		parity_05_wire = {(((((((((((((((data_wire[36] ^ data_wire[11]) ^ data_wire[12]) ^ data_wire[13]) ^ data_wire[14]) ^ data_wire[15]) ^ data_wire[16]) ^ data_wire[17]) ^ data_wire[18]) ^ data_wire[19]) ^ data_wire[20]) ^ data_wire[21]) ^ data_wire[22]) ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25])},
		parity_06_wire = {(data_wire[31] ^ parity_06_wire[4]), (data_wire[30] ^ parity_06_wire[3]), (data_wire[29] ^ parity_06_wire[2]), (data_wire[28] ^ parity_06_wire[1]), (data_wire[27] ^ parity_06_wire[0]), (data_wire[37] ^ data_wire[26])},
		parity_bit = parity_t[5],
		parity_final_wire = {(data_wire[37] ^ parity_final_wire[36]), (data_wire[36] ^ parity_final_wire[35]), (data_wire[35] ^ parity_final_wire[34]), (data_wire[34] ^ parity_final_wire[33]), (data_wire[33] ^ parity_final_wire[32]), (data_wire[32] ^ parity_final_wire[31]), (data_wire[31] ^ parity_final_wire[30]), (data_wire[30] ^ parity_final_wire[29]), (data_wire[29] ^ parity_final_wire[28]), (data_wire[28] ^ parity_final_wire[27]), (data_wire[27] ^ parity_final_wire[26]), (data_wire[26] ^ parity_final_wire[25]), (data_wire[25] ^ parity_final_wire[24]), (data_wire[24] ^ parity_final_wire[23]), (data_wire[23] ^ parity_final_wire[22]), (data_wire[22] ^ parity_final_wire[21]), (data_wire[21] ^ parity_final_wire[20]), (data_wire[20] ^ parity_final_wire[19]), (data_wire[19] ^ parity_final_wire[18]), (data_wire[18] ^ parity_final_wire[17]), (data_wire[17] ^ parity_final_wire[16]), (data_wire[16] ^ parity_final_wire[15]), (data_wire[15] ^ parity_final_wire[14]), (data_wire[14] ^ parity_final_wire[13]), (data_wire[13] ^ parity_final_wire[12]), (data_wire[12] ^ parity_final_wire[11]), (data_wire[11] ^ parity_final_wire[10]), (data_wire[10] ^ parity_final_wire[9]), (data_wire[9] ^ parity_final_wire[8]), (data_wire[8] ^ parity_final_wire[7]), (data_wire[7] ^ parity_final_wire[6]), (data_wire[6] ^ parity_final_wire[5]), (data_wire[5] ^ parity_final_wire[4]), (data_wire[4] ^ parity_final_wire[3]), (data_wire[3] ^ parity_final_wire[2]), (data_wire[2] ^ parity_final_wire[1]), (data_wire[1] ^ parity_final_wire[0]), (data_wire[38] ^ data_wire[0])},
		parity_t = {(parity_t[4] | decode_output[32]), (parity_t[3] | decode_output[16]), (parity_t[2] | decode_output[8]), (parity_t[1] | decode_output[4]), (parity_t[0] | decode_output[2]), decode_output[1]},
		q = output_pipeline0c,
		q_wire = {wire_mux21_31_dataout, wire_mux21_30_dataout, wire_mux21_29_dataout, wire_mux21_28_dataout, wire_mux21_27_dataout, wire_mux21_26_dataout, wire_mux21_25_dataout, wire_mux21_24_dataout, wire_mux21_23_dataout, wire_mux21_22_dataout, wire_mux21_21_dataout, wire_mux21_20_dataout, wire_mux21_19_dataout, wire_mux21_18_dataout, wire_mux21_17_dataout, wire_mux21_16_dataout, wire_mux21_15_dataout, wire_mux21_14_dataout, wire_mux21_13_dataout, wire_mux21_12_dataout, wire_mux21_11_dataout, wire_mux21_10_dataout, wire_mux21_9_dataout, wire_mux21_8_dataout, wire_mux21_7_dataout, wire_mux21_6_dataout, wire_mux21_5_dataout, wire_mux21_4_dataout, wire_mux21_3_dataout, wire_mux21_2_dataout, wire_mux21_1_dataout, wire_mux21_0_dataout},
		syn_bit = syn_t[4],
		syn_e = syndrome[6],
		syn_t = {(syn_t[3] | syndrome[5]), (syn_t[2] | syndrome[4]), (syn_t[1] | syndrome[3]), (syn_t[0] | syndrome[2]), (syndrome[0] | syndrome[1])},
		syndrome = {parity_final_wire[37], parity_06_wire[5], parity_05_wire[0], parity_04_wire[1], parity_03_wire[4], parity_02_wire[9], parity_01_wire[18]};
endmodule //alt_ddrx_decoder_40_altecc_decoder_c8f
//VALID FILE


//__ACDS_USER_COMMENT__ synopsys translate_off
`timescale 1 ps / 1 ps
//__ACDS_USER_COMMENT__ synopsys translate_on
module alt_ddrx_decoder_40 (
	clock,
	data,
	err_corrected,
	err_detected,
	err_fatal,
	q);

	input	  clock;
	input	[38:0]  data;
	output	  err_corrected;
	output	  err_detected;
	output	  err_fatal;
	output	[31:0]  q;

	wire  sub_wire0;
	wire  sub_wire1;
	wire  sub_wire2;
	wire [31:0] sub_wire3;
	wire  err_fatal = sub_wire0;
	wire  err_corrected = sub_wire1;
	wire  err_detected = sub_wire2;
	wire [31:0] q = sub_wire3[31:0];

	alt_ddrx_decoder_40_altecc_decoder_c8f	alt_ddrx_decoder_40_altecc_decoder_c8f_component (
				.clock (clock),
				.data (data),
				.err_fatal (sub_wire0),
				.err_corrected (sub_wire1),
				.err_detected (sub_wire2),
				.q (sub_wire3));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Stratix"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Stratix"
// Retrieval info: CONSTANT: lpm_pipeline NUMERIC "1"
// Retrieval info: CONSTANT: width_codeword NUMERIC "39"
// Retrieval info: CONSTANT: width_dataword NUMERIC "32"
// Retrieval info: USED_PORT: clock 0 0 0 0 INPUT NODEFVAL "clock"
// Retrieval info: USED_PORT: data 0 0 39 0 INPUT NODEFVAL "data[38..0]"
// Retrieval info: USED_PORT: err_corrected 0 0 0 0 OUTPUT NODEFVAL "err_corrected"
// Retrieval info: USED_PORT: err_detected 0 0 0 0 OUTPUT NODEFVAL "err_detected"
// Retrieval info: USED_PORT: err_fatal 0 0 0 0 OUTPUT NODEFVAL "err_fatal"
// Retrieval info: USED_PORT: q 0 0 32 0 OUTPUT NODEFVAL "q[31..0]"
// Retrieval info: CONNECT: @data 0 0 39 0 data 0 0 39 0
// Retrieval info: CONNECT: q 0 0 32 0 @q 0 0 32 0
// Retrieval info: CONNECT: err_fatal 0 0 0 0 @err_fatal 0 0 0 0
// Retrieval info: CONNECT: err_detected 0 0 0 0 @err_detected 0 0 0 0
// Retrieval info: CONNECT: @clock 0 0 0 0 clock 0 0 0 0
// Retrieval info: CONNECT: err_corrected 0 0 0 0 @err_corrected 0 0 0 0
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_ddrx_decoder_40.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_ddrx_decoder_40.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_ddrx_decoder_40.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_ddrx_decoder_40.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_ddrx_decoder_40_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL alt_ddrx_decoder_40_bb.v FALSE
// Retrieval info: LIB_FILE: lpm
