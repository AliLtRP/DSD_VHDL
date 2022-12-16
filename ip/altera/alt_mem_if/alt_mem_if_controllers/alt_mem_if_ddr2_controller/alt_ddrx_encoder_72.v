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


// synthesis_resources = lut 72 
// synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  alt_ddrx_encoder_72_altecc_encoder_rlb
	( 
	clock,
	data,
	q) ;
	input   clock;
	input   [63:0]  data;
	output   [71:0]  q;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri0   clock;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	reg	[71:0]	output_pipeline0c;
	wire aclr;
	wire clocken;
	wire  [63:0]  data_wire;
	wire  [34:0]  parity_01_wire;
	wire  [17:0]  parity_02_wire;
	wire  [8:0]  parity_03_wire;
	wire  [3:0]  parity_04_wire;
	wire  [1:0]  parity_05_wire;
	wire  [30:0]  parity_06_wire;
	wire  [6:0]  parity_07_wire;
	wire  [70:0]  parity_final_wire;
	wire  [71:0]  q_wire;

	// synopsys translate_off
	initial
		output_pipeline0c = 0;
	// synopsys translate_on
	always @ ( posedge clock or  posedge aclr)
		if (aclr == 1'b1) output_pipeline0c <= 72'b0;
		else if  (clocken == 1'b1)   output_pipeline0c <= q_wire;
	assign
		aclr = 1'b0,
		clocken = 1'b1,
		data_wire = data,
		parity_01_wire = {(data_wire[63] ^ parity_01_wire[33]), (data_wire[61] ^ parity_01_wire[32]), (data_wire[59] ^ parity_01_wire[31]), (data_wire[57] ^ parity_01_wire[30]), (data_wire[56] ^ parity_01_wire[29]), (data_wire[54] ^ parity_01_wire[28]), (data_wire[52] ^ parity_01_wire[27]), (data_wire[50] ^ parity_01_wire[26]), (data_wire[48] ^ parity_01_wire[25]), (data_wire[46] ^ parity_01_wire[24]), (data_wire[44] ^ parity_01_wire[23]), (data_wire[42] ^ parity_01_wire[22]), (data_wire[40] ^ parity_01_wire[21]), (data_wire[38] ^ parity_01_wire[20]), (data_wire[36] ^ parity_01_wire[19]), (data_wire[34] ^ parity_01_wire[18]), (data_wire[32] ^ parity_01_wire[17]), (data_wire[30] ^ parity_01_wire[16]), (data_wire[28] ^ parity_01_wire[15]), (data_wire[26] ^ parity_01_wire[14]), (data_wire[25] ^ parity_01_wire[13]), (data_wire[23] ^ parity_01_wire[12]), (data_wire[21] ^ parity_01_wire[11]), (data_wire[19] ^ parity_01_wire[10]), (data_wire[17] ^ parity_01_wire[9]), (data_wire[15] ^ parity_01_wire[8]), (data_wire[13] ^ parity_01_wire[7]), (data_wire[11] ^ parity_01_wire[6]), (data_wire[10] ^ parity_01_wire[5]), (data_wire[8] ^ parity_01_wire[4]), (data_wire[6] ^ parity_01_wire[3]), (data_wire[4] ^ parity_01_wire[2]), (data_wire[3] ^ parity_01_wire[1]), (data_wire[1] ^ parity_01_wire[0]), data_wire[0]},
		parity_02_wire = {((data_wire[62] ^ data_wire[63]) ^ parity_02_wire[16]), ((data_wire[58] ^ data_wire[59]) ^ parity_02_wire[15]), ((data_wire[55] ^ data_wire[56]) ^ parity_02_wire[14]), ((data_wire[51] ^ data_wire[52]) ^ parity_02_wire[13]), ((data_wire[47] ^ data_wire[48]) ^ parity_02_wire[12]), ((data_wire[43] ^ data_wire[44]) ^ parity_02_wire[11]), ((data_wire[39] ^ data_wire[40]) ^ parity_02_wire[10]), ((data_wire[35] ^ data_wire[36]) ^ parity_02_wire[9]), ((data_wire[31] ^ data_wire[32]) ^ parity_02_wire[8]), ((data_wire[27] ^ data_wire[28]) ^ parity_02_wire[7]), ((data_wire[24] ^ data_wire[25]) ^ parity_02_wire[6]), ((data_wire[20] ^ data_wire[21]) ^ parity_02_wire[5]), ((data_wire[16] ^ data_wire[17]) ^ parity_02_wire[4]), ((data_wire[12] ^ data_wire[13]) ^ parity_02_wire[3]), ((data_wire[9] ^ data_wire[10]) ^ parity_02_wire[2]), ((data_wire[5] ^ data_wire[6]) ^ parity_02_wire[1]), ((data_wire[2] ^ data_wire[3]) ^ parity_02_wire[0]), data_wire[0]},
		parity_03_wire = {((((data_wire[60] ^ data_wire[61]) ^ data_wire[62]) ^ data_wire[63]) ^ parity_03_wire[7]), ((((data_wire[53] ^ data_wire[54]) ^ data_wire[55]) ^ data_wire[56]) ^ parity_03_wire[6]), ((((data_wire[45] ^ data_wire[46]) ^ data_wire[47]) ^ data_wire[48]) ^ parity_03_wire[5]), ((((data_wire[37] ^ data_wire[38]) ^ data_wire[39]) ^ data_wire[40]) ^ parity_03_wire[4]), ((((data_wire[29] ^ data_wire[30]) ^ data_wire[31]) ^ data_wire[32]) ^ parity_03_wire[3]), ((((data_wire[22] ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25]) ^ parity_03_wire[2]), ((((data_wire[14] ^ data_wire[15]) ^ data_wire[16]) ^ data_wire[17]) ^ parity_03_wire[1]), ((((data_wire[7] ^ data_wire[8]) ^ data_wire[9]) ^ data_wire[10]) ^ parity_03_wire[0]), ((data_wire[1] ^ data_wire[2]) ^ data_wire[3])},
		parity_04_wire = {((((((((data_wire[49] ^ data_wire[50]) ^ data_wire[51]) ^ data_wire[52]) ^ data_wire[53]) ^ data_wire[54]) ^ data_wire[55]) ^ data_wire[56]) ^ parity_04_wire[2]), ((((((((data_wire[33] ^ data_wire[34]) ^ data_wire[35]) ^ data_wire[36]) ^ data_wire[37]) ^ data_wire[38]) ^ data_wire[39]) ^ data_wire[40]) ^ parity_04_wire[1]), ((((((((data_wire[18] ^ data_wire[19]) ^ data_wire[20]) ^ data_wire[21]) ^ data_wire[22]) ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25]) ^ parity_04_wire[0]), ((((((data_wire[4] ^ data_wire[5]) ^ data_wire[6]) ^ data_wire[7]) ^ data_wire[8]) ^ data_wire[9]) ^ data_wire[10])},
		parity_05_wire = {((((((((((((((((data_wire[41] ^ data_wire[42]) ^ data_wire[43]) ^ data_wire[44]) ^ data_wire[45]) ^ data_wire[46]) ^ data_wire[47]) ^ data_wire[48]) ^ data_wire[49]) ^ data_wire[50]) ^ data_wire[51]) ^ data_wire[52]) ^ data_wire[53]) ^ data_wire[54]) ^ data_wire[55]) ^ data_wire[56]) ^ parity_05_wire[0]), ((((((((((((((data_wire[11] ^ data_wire[12]) ^ data_wire[13]) ^ data_wire[14]) ^ data_wire[15]) ^ data_wire[16]) ^ data_wire[17]) ^ data_wire[18]) ^ data_wire[19]) ^ data_wire[20]) ^ data_wire[21]) ^ data_wire[22]) ^ data_wire[23]) ^ data_wire[24]) ^ data_wire[25])},
		parity_06_wire = {(data_wire[56] ^ parity_06_wire[29]), (data_wire[55] ^ parity_06_wire[28]), (data_wire[54] ^ parity_06_wire[27]), (data_wire[53] ^ parity_06_wire[26]), (data_wire[52] ^ parity_06_wire[25]), (data_wire[51] ^ parity_06_wire[24]), (data_wire[50] ^ parity_06_wire[23]), (data_wire[49] ^ parity_06_wire[22]), (data_wire[48] ^ parity_06_wire[21]), (data_wire[47] ^ parity_06_wire[20]), (data_wire[46] ^ parity_06_wire[19]), (data_wire[45] ^ parity_06_wire[18]), (data_wire[44] ^ parity_06_wire[17]), (data_wire[43] ^ parity_06_wire[16]), (data_wire[42] ^ parity_06_wire[15]), (data_wire[41] ^ parity_06_wire[14]), (data_wire[40] ^ parity_06_wire[13]), (data_wire[39] ^ parity_06_wire[12]), (data_wire[38] ^ parity_06_wire[11]), (data_wire[37] ^ parity_06_wire[10]), (data_wire[36] ^ parity_06_wire[9]), (data_wire[35] ^ parity_06_wire[8]), (data_wire[34] ^ parity_06_wire[7]), (data_wire[33] ^ parity_06_wire[6]), (data_wire[32] ^ parity_06_wire[5]), (data_wire[31] ^ parity_06_wire[4]), (data_wire[30] ^ parity_06_wire[3]), (data_wire[29] ^ parity_06_wire[2]), (data_wire[28] ^ parity_06_wire[1]), (data_wire[27] ^ parity_06_wire[0]), data_wire[26]},
		parity_07_wire = {(data_wire[63] ^ parity_07_wire[5]), (data_wire[62] ^ parity_07_wire[4]), (data_wire[61] ^ parity_07_wire[3]), (data_wire[60] ^ parity_07_wire[2]), (data_wire[59] ^ parity_07_wire[1]), (data_wire[58] ^ parity_07_wire[0]), data_wire[57]},
		parity_final_wire = {(q_wire[70] ^ parity_final_wire[69]), (q_wire[69] ^ parity_final_wire[68]), (q_wire[68] ^ parity_final_wire[67]), (q_wire[67] ^ parity_final_wire[66]), (q_wire[66] ^ parity_final_wire[65]), (q_wire[65] ^ parity_final_wire[64]), (q_wire[64] ^ parity_final_wire[63]), (q_wire[63] ^ parity_final_wire[62]), (q_wire[62] ^ parity_final_wire[61]), (q_wire[61] ^ parity_final_wire[60]), (q_wire[60] ^ parity_final_wire[59]), (q_wire[59] ^ parity_final_wire[58]), (q_wire[58] ^ parity_final_wire[57]), (q_wire[57] ^ parity_final_wire[56]), (q_wire[56] ^ parity_final_wire[55]), (q_wire[55] ^ parity_final_wire[54]), (q_wire[54] ^ parity_final_wire[53]), (q_wire[53] ^ parity_final_wire[52]), (q_wire[52] ^ parity_final_wire[51]), (q_wire[51] ^ parity_final_wire[50]), (q_wire[50] ^ parity_final_wire[49]), (q_wire[49] ^ parity_final_wire[48]), (q_wire[48] ^ parity_final_wire[47]), (q_wire[47] ^ parity_final_wire[46]), (q_wire[46] ^ parity_final_wire[45]), (q_wire[45] ^ parity_final_wire[44]), (q_wire[44] ^ parity_final_wire[43]), (q_wire[43] ^ parity_final_wire[42]), (q_wire[42] ^ parity_final_wire[41]), (q_wire[41] ^ parity_final_wire[40]), (q_wire[40] ^ parity_final_wire[39]), (q_wire[39] ^ parity_final_wire[38]), (q_wire[38] ^ parity_final_wire[37]), (q_wire[37] ^ parity_final_wire[36]), (q_wire[36] ^ parity_final_wire[35]), (q_wire[35] ^ parity_final_wire[34]), (q_wire[34] ^ parity_final_wire[33]), (q_wire[33] ^ parity_final_wire[32]), (q_wire[32] ^ parity_final_wire[31]), (q_wire[31] ^ parity_final_wire[30]), (q_wire[30] ^ parity_final_wire[29]), (q_wire[29] ^ parity_final_wire[28]), (q_wire[28] ^ parity_final_wire[27]), (q_wire[27] ^ parity_final_wire[26]), (q_wire[26] ^ parity_final_wire[25]), (q_wire[25] ^ parity_final_wire[24]), (q_wire[24] ^ parity_final_wire[23]), (q_wire[23] ^ parity_final_wire[22]), (q_wire[22] ^ parity_final_wire[21]), (q_wire[21] ^ parity_final_wire[20]), (q_wire[20] ^ parity_final_wire[19]), (q_wire[19] ^ parity_final_wire[18]), (q_wire[18] ^ parity_final_wire[17]), (q_wire[17]
 ^ parity_final_wire[16]), (q_wire[16] ^ parity_final_wire[15]), (q_wire[15] ^ parity_final_wire[14]), (q_wire[14] ^ parity_final_wire[13]), (q_wire[13] ^ parity_final_wire[12]), (q_wire[12] ^ parity_final_wire[11]), (q_wire[11] ^ parity_final_wire[10]), (q_wire[10] ^ parity_final_wire[9]), (q_wire[9] ^ parity_final_wire[8]), (q_wire[8] ^ parity_final_wire[7]), (q_wire[7] ^ parity_final_wire[6]), (q_wire[6] ^ parity_final_wire[5]), (q_wire[5] ^ parity_final_wire[4]), (q_wire[4] ^ parity_final_wire[3]), (q_wire[3] ^ parity_final_wire[2]), (q_wire[2] ^ parity_final_wire[1]), (q_wire[1] ^ parity_final_wire[0]), q_wire[0]},
		q = output_pipeline0c,
		q_wire = {parity_final_wire[70], parity_07_wire[6], parity_06_wire[30], parity_05_wire[1], parity_04_wire[3], parity_03_wire[8], parity_02_wire[17], parity_01_wire[34], data_wire};
endmodule 


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module alt_ddrx_encoder_72 (
	clock,
	data,
	q);

	input	  clock;
	input	[63:0]  data;
	output	[71:0]  q;

	wire [71:0] sub_wire0;
	wire [71:0] q = sub_wire0[71:0];

	alt_ddrx_encoder_72_altecc_encoder_rlb	alt_ddrx_encoder_72_altecc_encoder_rlb_component (
				.clock (clock),
				.data (data),
				.q (sub_wire0));

endmodule

