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







// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


// synthesis_resources = lut 39 
// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module  alt_ddrx_encoder_40_altecc_encoder_plb
	( 
	clock,
	data,
	q) ;
	input   clock;
	input   [31:0]  data;
	output   [38:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[38:0]	output_pipeline0c;
	wire aclr;
	wire clocken;
	wire  [31:0]  data_wire;
	wire  [17:0]  parity_01_wire;
	wire  [9:0]  parity_02_wire;
	wire  [4:0]  parity_03_wire;
	wire  [1:0]  parity_04_wire;
	wire  [0:0]  parity_05_wire;
	wire  [5:0]  parity_06_wire;
	wire  [37:0]  parity_final_wire;
	wire  [38:0]  q_wire;

	// synopsys translate_off
	initial
		output_pipeline0c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) output_pipeline0c <= 39'b0;
		else if  (clocken == 1'b1)   output_pipeline0c <= q_wire;
	assign
		aclr = 1'b0,
		clocken = 1'b1,
		data_wire = data,
		parity_01_wire = {(data_wire[30] ^ parity_01_wire[16]), (data_wire[28] ^ parity_01_wire[15]), (data_wire[26] ^ parity_01_wire[14]), (data_wire[25] ^ parity_01_wire[13]), (data_wire[23] ^ parity_01_wire[12]), (data_wire[21] ^ parity_01_wire[11]), (data_wire[19] ^ parity_01_wire[10]), (data_wire[17] ^ parity_01_wire[9]), (data_wire[15] ^ parity_01_wire[8]), (data_wire[13] ^ parity_01_wire[7]), (data_wire[11] ^ parity_01_wire[6]), (data_wire[10] ^ parity_01_wire[5]), (data_wire[8] ^ parity_01_wire[4]), (data_wire[6] ^ parity_01_wire[3]), (data_wire[4] ^ parity_01_wire[2]), (data_wire[3] ^ parity_01_wire[1]), (data_wire[1] ^ parity_01_wire[0]), data_wire[0]},
		parity_02_wire = {(data_wire[31] ^ parity_02_wire[8]), ((data_wire[27] ^ data_wire[28]) ^ parity_02_wire[7]), ((data_wire[24] ^ data_wire[25]) ^ parity_02_wire[6]), ((data_wire[20] ^ data_wire[21]) ^ parity_02_wire[5]), ((data_wire[16] ^ data_wire[17]) ^ parity_02_wire[4]), ((data_wire[12] ^ data_wire[13]) ^ parity_02_wire[3]), ((data_wire[9] ^ data_wire[10]) ^ parity_02_wire[2]), ((data_wire[5] ^ data_wire[6]) ^ parity_02_wire[1]), ((data_wire[2] ^ data_wire[3]) ^ parity_02_wire[0]), data_wire[0]},
		parity_03_wire = {(((data_wire[29] ^ data_wire[30]) ^ data_wire[31]) ^ parity_03_wire[3]), ((((data_wire[22] ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25]) ^ parity_03_wire[2]), ((((data_wire[14] ^ data_wire[15]) ^ data_wire[16]) ^ data_wire[17]) ^ parity_03_wire[1]), ((((data_wire[7] ^ data_wire[8]) ^ data_wire[9]) ^ data_wire[10]) ^ parity_03_wire[0]), ((data_wire[1] ^ data_wire[2]) ^ data_wire[3])},
		parity_04_wire = {((((((((data_wire[18] ^ data_wire[19]) ^ data_wire[20]) ^ data_wire[21]) ^ data_wire[22]) ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25]) ^ parity_04_wire[0]), ((((((data_wire[4] ^ data_wire[5]) ^ data_wire[6]) ^ data_wire[7]) ^ data_wire[8]) ^ data_wire[9]) ^ data_wire[10])},
		parity_05_wire = {((((((((((((((data_wire[11] ^ data_wire[12]) ^ data_wire[13]) ^ data_wire[14]) ^ data_wire[15]) ^ data_wire[16]) ^ data_wire[17]) ^ data_wire[18]) ^ data_wire[19]) ^ data_wire[20]) ^ data_wire[21]) ^ data_wire[22]) ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25])},
		parity_06_wire = {(data_wire[31] ^ parity_06_wire[4]), (data_wire[30] ^ parity_06_wire[3]), (data_wire[29] ^ parity_06_wire[2]), (data_wire[28] ^ parity_06_wire[1]), (data_wire[27] ^ parity_06_wire[0]), data_wire[26]},
		parity_final_wire = {(q_wire[37] ^ parity_final_wire[36]), (q_wire[36] ^ parity_final_wire[35]), (q_wire[35] ^ parity_final_wire[34]), (q_wire[34] ^ parity_final_wire[33]), (q_wire[33] ^ parity_final_wire[32]), (q_wire[32] ^ parity_final_wire[31]), (q_wire[31] ^ parity_final_wire[30]), (q_wire[30] ^ parity_final_wire[29]), (q_wire[29] ^ parity_final_wire[28]), (q_wire[28] ^ parity_final_wire[27]), (q_wire[27] ^ parity_final_wire[26]), (q_wire[26] ^ parity_final_wire[25]), (q_wire[25] ^ parity_final_wire[24]), (q_wire[24] ^ parity_final_wire[23]), (q_wire[23] ^ parity_final_wire[22]), (q_wire[22] ^ parity_final_wire[21]), (q_wire[21] ^ parity_final_wire[20]), (q_wire[20] ^ parity_final_wire[19]), (q_wire[19] ^ parity_final_wire[18]), (q_wire[18] ^ parity_final_wire[17]), (q_wire[17] ^ parity_final_wire[16]), (q_wire[16] ^ parity_final_wire[15]), (q_wire[15] ^ parity_final_wire[14]), (q_wire[14] ^ parity_final_wire[13]), (q_wire[13] ^ parity_final_wire[12]), (q_wire[12] ^ parity_final_wire[11]), (q_wire[11] ^ parity_final_wire[10]), (q_wire[10] ^ parity_final_wire[9]), (q_wire[9] ^ parity_final_wire[8]), (q_wire[8] ^ parity_final_wire[7]), (q_wire[7] ^ parity_final_wire[6]), (q_wire[6] ^ parity_final_wire[5]), (q_wire[5] ^ parity_final_wire[4]), (q_wire[4] ^ parity_final_wire[3]), (q_wire[3] ^ parity_final_wire[2]), (q_wire[2] ^ parity_final_wire[1]), (q_wire[1] ^ parity_final_wire[0]), q_wire[0]},
		q = output_pipeline0c,
		q_wire = {parity_final_wire[37], parity_06_wire[5], parity_05_wire[0], parity_04_wire[1], parity_03_wire[4], parity_02_wire[9], parity_01_wire[17], data_wire};
endmodule 


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module alt_ddrx_encoder_40 (
	clock,
	data,
	q);

	input	  clock;
	input	[31:0]  data;
	output	[38:0]  q;

	wire [38:0] sub_wire0;
	wire [38:0] q = sub_wire0[38:0];

	alt_ddrx_encoder_40_altecc_encoder_plb	alt_ddrx_encoder_40_altecc_encoder_plb_component (
				.clock (clock),
				.data (data),
				.q (sub_wire0));

endmodule

