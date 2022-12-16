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


`timescale 1 ps / 1 ps

module alt_ntrlkn_4l_3g_crc24_dat64_flat (c,d,crc_out);
input[23:0] c;
input[63:0] d;
output[23:0] crc_out;
wire[23:0] crc_out;

assign crc_out[0] =
    c[1] ^ c[6] ^ c[8] ^ c[9] ^ c[12] ^ c[13] ^
    c[16] ^ c[18] ^ c[19] ^ c[20] ^ c[22] ^ c[23] ^ d[63] ^
    d[62] ^ d[60] ^ d[59] ^ d[58] ^ d[56] ^ d[53] ^ d[52] ^
    d[49] ^ d[48] ^ d[46] ^ d[41] ^ d[39] ^ d[38] ^ d[37] ^
    d[36] ^ d[34] ^ d[32] ^ d[31] ^ d[30] ^ d[29] ^ d[23] ^
    d[16] ^ d[14] ^ d[11] ^ d[10] ^ d[8] ^ d[7] ^ d[6] ^
    d[4] ^ d[3] ^ d[0];

assign crc_out[1] =
    c[0] ^ c[1] ^ c[2] ^ c[6] ^ c[7] ^ c[8] ^
    c[10] ^ c[12] ^ c[14] ^ c[16] ^ c[17] ^ c[18] ^ c[21] ^
    c[22] ^ d[62] ^ d[61] ^ d[58] ^ d[57] ^ d[56] ^ d[54] ^
    d[52] ^ d[50] ^ d[48] ^ d[47] ^ d[46] ^ d[42] ^ d[41] ^
    d[40] ^ d[36] ^ d[35] ^ d[34] ^ d[33] ^ d[29] ^ d[24] ^
    d[23] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[12] ^ d[10] ^
    d[9] ^ d[6] ^ d[5] ^ d[3] ^ d[1] ^ d[0];

assign crc_out[2] =
    c[1] ^ c[2] ^ c[3] ^ c[7] ^ c[8] ^ c[9] ^
    c[11] ^ c[13] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[22] ^
    c[23] ^ d[63] ^ d[62] ^ d[59] ^ d[58] ^ d[57] ^ d[55] ^
    d[53] ^ d[51] ^ d[49] ^ d[48] ^ d[47] ^ d[43] ^ d[42] ^
    d[41] ^ d[37] ^ d[36] ^ d[35] ^ d[34] ^ d[30] ^ d[25] ^
    d[24] ^ d[18] ^ d[17] ^ d[16] ^ d[15] ^ d[13] ^ d[11] ^
    d[10] ^ d[7] ^ d[6] ^ d[4] ^ d[2] ^ d[1];

assign crc_out[3] =
    c[2] ^ c[3] ^ c[4] ^ c[8] ^ c[9] ^ c[10] ^
    c[12] ^ c[14] ^ c[16] ^ c[18] ^ c[19] ^ c[20] ^ c[23] ^
    d[63] ^ d[60] ^ d[59] ^ d[58] ^ d[56] ^ d[54] ^ d[52] ^
    d[50] ^ d[49] ^ d[48] ^ d[44] ^ d[43] ^ d[42] ^ d[38] ^
    d[37] ^ d[36] ^ d[35] ^ d[31] ^ d[26] ^ d[25] ^ d[19] ^
    d[18] ^ d[17] ^ d[16] ^ d[14] ^ d[12] ^ d[11] ^ d[8] ^
    d[7] ^ d[5] ^ d[3] ^ d[2];

assign crc_out[4] =
    c[3] ^ c[4] ^ c[5] ^ c[9] ^ c[10] ^ c[11] ^
    c[13] ^ c[15] ^ c[17] ^ c[19] ^ c[20] ^ c[21] ^ d[61] ^
    d[60] ^ d[59] ^ d[57] ^ d[55] ^ d[53] ^ d[51] ^ d[50] ^
    d[49] ^ d[45] ^ d[44] ^ d[43] ^ d[39] ^ d[38] ^ d[37] ^
    d[36] ^ d[32] ^ d[27] ^ d[26] ^ d[20] ^ d[19] ^ d[18] ^
    d[17] ^ d[15] ^ d[13] ^ d[12] ^ d[9] ^ d[8] ^ d[6] ^
    d[4] ^ d[3];

assign crc_out[5] =
    c[0] ^ c[1] ^ c[4] ^ c[5] ^ c[8] ^ c[9] ^
    c[10] ^ c[11] ^ c[13] ^ c[14] ^ c[19] ^ c[21] ^ c[23] ^
    d[63] ^ d[61] ^ d[59] ^ d[54] ^ d[53] ^ d[51] ^ d[50] ^
    d[49] ^ d[48] ^ d[45] ^ d[44] ^ d[41] ^ d[40] ^ d[36] ^
    d[34] ^ d[33] ^ d[32] ^ d[31] ^ d[30] ^ d[29] ^ d[28] ^
    d[27] ^ d[23] ^ d[21] ^ d[20] ^ d[19] ^ d[18] ^ d[13] ^
    d[11] ^ d[9] ^ d[8] ^ d[6] ^ d[5] ^ d[3] ^ d[0];

assign crc_out[6] =
    c[2] ^ c[5] ^ c[8] ^ c[10] ^ c[11] ^ c[13] ^
    c[14] ^ c[15] ^ c[16] ^ c[18] ^ c[19] ^ c[23] ^ d[63] ^
    d[59] ^ d[58] ^ d[56] ^ d[55] ^ d[54] ^ d[53] ^ d[51] ^
    d[50] ^ d[48] ^ d[45] ^ d[42] ^ d[39] ^ d[38] ^ d[36] ^
    d[35] ^ d[33] ^ d[28] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^
    d[20] ^ d[19] ^ d[16] ^ d[12] ^ d[11] ^ d[9] ^ d[8] ^
    d[3] ^ d[1] ^ d[0];

assign crc_out[7] =
    c[0] ^ c[3] ^ c[6] ^ c[9] ^ c[11] ^ c[12] ^
    c[14] ^ c[15] ^ c[16] ^ c[17] ^ c[19] ^ c[20] ^ d[60] ^
    d[59] ^ d[57] ^ d[56] ^ d[55] ^ d[54] ^ d[52] ^ d[51] ^
    d[49] ^ d[46] ^ d[43] ^ d[40] ^ d[39] ^ d[37] ^ d[36] ^
    d[34] ^ d[29] ^ d[25] ^ d[24] ^ d[23] ^ d[22] ^ d[21] ^
    d[20] ^ d[17] ^ d[13] ^ d[12] ^ d[10] ^ d[9] ^ d[4] ^
    d[2] ^ d[1];

assign crc_out[8] =
    c[0] ^ c[4] ^ c[6] ^ c[7] ^ c[8] ^ c[9] ^
    c[10] ^ c[15] ^ c[17] ^ c[19] ^ c[21] ^ c[22] ^ c[23] ^
    d[63] ^ d[62] ^ d[61] ^ d[59] ^ d[57] ^ d[55] ^ d[50] ^
    d[49] ^ d[48] ^ d[47] ^ d[46] ^ d[44] ^ d[40] ^ d[39] ^
    d[36] ^ d[35] ^ d[34] ^ d[32] ^ d[31] ^ d[29] ^ d[26] ^
    d[25] ^ d[24] ^ d[22] ^ d[21] ^ d[18] ^ d[16] ^ d[13] ^
    d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[0];

assign crc_out[9] =
    c[0] ^ c[5] ^ c[6] ^ c[7] ^ c[10] ^ c[11] ^
    c[12] ^ c[13] ^ c[19] ^ d[59] ^ d[53] ^ d[52] ^ d[51] ^
    d[50] ^ d[47] ^ d[46] ^ d[45] ^ d[40] ^ d[39] ^ d[38] ^
    d[35] ^ d[34] ^ d[33] ^ d[31] ^ d[29] ^ d[27] ^ d[26] ^
    d[25] ^ d[22] ^ d[19] ^ d[17] ^ d[16] ^ d[11] ^ d[10] ^
    d[9] ^ d[5] ^ d[4] ^ d[1] ^ d[0];

assign crc_out[10] =
    c[0] ^ c[1] ^ c[6] ^ c[7] ^ c[8] ^ c[11] ^
    c[12] ^ c[13] ^ c[14] ^ c[20] ^ d[60] ^ d[54] ^ d[53] ^
    d[52] ^ d[51] ^ d[48] ^ d[47] ^ d[46] ^ d[41] ^ d[40] ^
    d[39] ^ d[36] ^ d[35] ^ d[34] ^ d[32] ^ d[30] ^ d[28] ^
    d[27] ^ d[26] ^ d[23] ^ d[20] ^ d[18] ^ d[17] ^ d[12] ^
    d[11] ^ d[10] ^ d[6] ^ d[5] ^ d[2] ^ d[1];

assign crc_out[11] =
    c[0] ^ c[2] ^ c[6] ^ c[7] ^ c[14] ^ c[15] ^
    c[16] ^ c[18] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^
    d[63] ^ d[62] ^ d[61] ^ d[60] ^ d[59] ^ d[58] ^ d[56] ^
    d[55] ^ d[54] ^ d[47] ^ d[46] ^ d[42] ^ d[40] ^ d[39] ^
    d[38] ^ d[35] ^ d[34] ^ d[33] ^ d[32] ^ d[30] ^ d[28] ^
    d[27] ^ d[24] ^ d[23] ^ d[21] ^ d[19] ^ d[18] ^ d[16] ^
    d[14] ^ d[13] ^ d[12] ^ d[10] ^ d[8] ^ d[4] ^ d[2] ^
    d[0];

assign crc_out[12] =
    c[0] ^ c[1] ^ c[3] ^ c[7] ^ c[8] ^ c[15] ^
    c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^
    d[63] ^ d[62] ^ d[61] ^ d[60] ^ d[59] ^ d[57] ^ d[56] ^
    d[55] ^ d[48] ^ d[47] ^ d[43] ^ d[41] ^ d[40] ^ d[39] ^
    d[36] ^ d[35] ^ d[34] ^ d[33] ^ d[31] ^ d[29] ^ d[28] ^
    d[25] ^ d[24] ^ d[22] ^ d[20] ^ d[19] ^ d[17] ^ d[15] ^
    d[14] ^ d[13] ^ d[11] ^ d[9] ^ d[5] ^ d[3] ^ d[1];

assign crc_out[13] =
    c[0] ^ c[1] ^ c[2] ^ c[4] ^ c[8] ^ c[9] ^
    c[16] ^ c[17] ^ c[18] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^
    d[63] ^ d[62] ^ d[61] ^ d[60] ^ d[58] ^ d[57] ^ d[56] ^
    d[49] ^ d[48] ^ d[44] ^ d[42] ^ d[41] ^ d[40] ^ d[37] ^
    d[36] ^ d[35] ^ d[34] ^ d[32] ^ d[30] ^ d[29] ^ d[26] ^
    d[25] ^ d[23] ^ d[21] ^ d[20] ^ d[18] ^ d[16] ^ d[15] ^
    d[14] ^ d[12] ^ d[10] ^ d[6] ^ d[4] ^ d[2];

assign crc_out[14] =
    c[1] ^ c[2] ^ c[3] ^ c[5] ^ c[9] ^ c[10] ^
    c[17] ^ c[18] ^ c[19] ^ c[21] ^ c[22] ^ c[23] ^ d[63] ^
    d[62] ^ d[61] ^ d[59] ^ d[58] ^ d[57] ^ d[50] ^ d[49] ^
    d[45] ^ d[43] ^ d[42] ^ d[41] ^ d[38] ^ d[37] ^ d[36] ^
    d[35] ^ d[33] ^ d[31] ^ d[30] ^ d[27] ^ d[26] ^ d[24] ^
    d[22] ^ d[21] ^ d[19] ^ d[17] ^ d[16] ^ d[15] ^ d[13] ^
    d[11] ^ d[7] ^ d[5] ^ d[3];

assign crc_out[15] =
    c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[8] ^ c[9] ^
    c[10] ^ c[11] ^ c[12] ^ c[13] ^ c[16] ^ d[56] ^ d[53] ^
    d[52] ^ d[51] ^ d[50] ^ d[49] ^ d[48] ^ d[44] ^ d[43] ^
    d[42] ^ d[41] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[25] ^
    d[22] ^ d[20] ^ d[18] ^ d[17] ^ d[12] ^ d[11] ^ d[10] ^
    d[7] ^ d[3] ^ d[0];

assign crc_out[16] =
    c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[9] ^ c[10] ^
    c[11] ^ c[12] ^ c[13] ^ c[14] ^ c[17] ^ d[57] ^ d[54] ^
    d[53] ^ d[52] ^ d[51] ^ d[50] ^ d[49] ^ d[45] ^ d[44] ^
    d[43] ^ d[42] ^ d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[26] ^
    d[23] ^ d[21] ^ d[19] ^ d[18] ^ d[13] ^ d[12] ^ d[11] ^
    d[8] ^ d[4] ^ d[1];

assign crc_out[17] =
    c[1] ^ c[3] ^ c[4] ^ c[5] ^ c[8] ^ c[9] ^
    c[10] ^ c[11] ^ c[14] ^ c[15] ^ c[16] ^ c[19] ^ c[20] ^
    c[22] ^ c[23] ^ d[63] ^ d[62] ^ d[60] ^ d[59] ^ d[56] ^
    d[55] ^ d[54] ^ d[51] ^ d[50] ^ d[49] ^ d[48] ^ d[45] ^
    d[44] ^ d[43] ^ d[41] ^ d[39] ^ d[38] ^ d[37] ^ d[36] ^
    d[34] ^ d[27] ^ d[24] ^ d[23] ^ d[22] ^ d[20] ^ d[19] ^
    d[16] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^
    d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[0];

assign crc_out[18] =
    c[0] ^ c[2] ^ c[4] ^ c[5] ^ c[6] ^ c[9] ^
    c[10] ^ c[11] ^ c[12] ^ c[15] ^ c[16] ^ c[17] ^ c[20] ^
    c[21] ^ c[23] ^ d[63] ^ d[61] ^ d[60] ^ d[57] ^ d[56] ^
    d[55] ^ d[52] ^ d[51] ^ d[50] ^ d[49] ^ d[46] ^ d[45] ^
    d[44] ^ d[42] ^ d[40] ^ d[39] ^ d[38] ^ d[37] ^ d[35] ^
    d[28] ^ d[25] ^ d[24] ^ d[23] ^ d[21] ^ d[20] ^ d[17] ^
    d[14] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^
    d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[1];

assign crc_out[19] =
    c[0] ^ c[1] ^ c[3] ^ c[5] ^ c[6] ^ c[7] ^
    c[10] ^ c[11] ^ c[12] ^ c[13] ^ c[16] ^ c[17] ^ c[18] ^
    c[21] ^ c[22] ^ d[62] ^ d[61] ^ d[58] ^ d[57] ^ d[56] ^
    d[53] ^ d[52] ^ d[51] ^ d[50] ^ d[47] ^ d[46] ^ d[45] ^
    d[43] ^ d[41] ^ d[40] ^ d[39] ^ d[38] ^ d[36] ^ d[29] ^
    d[26] ^ d[25] ^ d[24] ^ d[22] ^ d[21] ^ d[18] ^ d[15] ^
    d[14] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^
    d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[2];

assign crc_out[20] =
    c[0] ^ c[2] ^ c[4] ^ c[7] ^ c[9] ^ c[11] ^
    c[14] ^ c[16] ^ c[17] ^ c[20] ^ d[60] ^ d[57] ^ d[56] ^
    d[54] ^ d[51] ^ d[49] ^ d[47] ^ d[44] ^ d[42] ^ d[40] ^
    d[38] ^ d[36] ^ d[34] ^ d[32] ^ d[31] ^ d[29] ^ d[27] ^
    d[26] ^ d[25] ^ d[22] ^ d[19] ^ d[15] ^ d[13] ^ d[12] ^
    d[9] ^ d[5] ^ d[4] ^ d[0];

assign crc_out[21] =
    c[3] ^ c[5] ^ c[6] ^ c[9] ^ c[10] ^ c[13] ^
    c[15] ^ c[16] ^ c[17] ^ c[19] ^ c[20] ^ c[21] ^ c[22] ^
    c[23] ^ d[63] ^ d[62] ^ d[61] ^ d[60] ^ d[59] ^ d[57] ^
    d[56] ^ d[55] ^ d[53] ^ d[50] ^ d[49] ^ d[46] ^ d[45] ^
    d[43] ^ d[38] ^ d[36] ^ d[35] ^ d[34] ^ d[33] ^ d[31] ^
    d[29] ^ d[28] ^ d[27] ^ d[26] ^ d[20] ^ d[13] ^ d[11] ^
    d[8] ^ d[7] ^ d[5] ^ d[4] ^ d[3] ^ d[1] ^ d[0];

assign crc_out[22] =
    c[4] ^ c[6] ^ c[7] ^ c[10] ^ c[11] ^ c[14] ^
    c[16] ^ c[17] ^ c[18] ^ c[20] ^ c[21] ^ c[22] ^ c[23] ^
    d[63] ^ d[62] ^ d[61] ^ d[60] ^ d[58] ^ d[57] ^ d[56] ^
    d[54] ^ d[51] ^ d[50] ^ d[47] ^ d[46] ^ d[44] ^ d[39] ^
    d[37] ^ d[36] ^ d[35] ^ d[34] ^ d[32] ^ d[30] ^ d[29] ^
    d[28] ^ d[27] ^ d[21] ^ d[14] ^ d[12] ^ d[9] ^ d[8] ^
    d[6] ^ d[5] ^ d[4] ^ d[2] ^ d[1];

assign crc_out[23] =
    c[0] ^ c[5] ^ c[7] ^ c[8] ^ c[11] ^ c[12] ^
    c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[21] ^ c[22] ^ c[23] ^
    d[63] ^ d[62] ^ d[61] ^ d[59] ^ d[58] ^ d[57] ^ d[55] ^
    d[52] ^ d[51] ^ d[48] ^ d[47] ^ d[45] ^ d[40] ^ d[38] ^
    d[37] ^ d[36] ^ d[35] ^ d[33] ^ d[31] ^ d[30] ^ d[29] ^
    d[28] ^ d[22] ^ d[15] ^ d[13] ^ d[10] ^ d[9] ^ d[7] ^
    d[6] ^ d[5] ^ d[3] ^ d[2];

endmodule
