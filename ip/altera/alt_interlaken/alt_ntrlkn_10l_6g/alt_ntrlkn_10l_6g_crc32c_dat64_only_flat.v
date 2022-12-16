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

module alt_ntrlkn_10l_6g_crc32c_dat64_only_flat (d,crc_out);
input[63:0] d;
output[31:0] crc_out;
wire[31:0] crc_out;

assign crc_out[0] =
    d[62] ^ d[59] ^ d[54] ^ d[53] ^ d[51] ^ d[48] ^
    d[47] ^ d[46] ^ d[45] ^ d[43] ^ d[42] ^ d[37] ^ d[36] ^
    d[35] ^ d[31] ^ d[30] ^ d[28] ^ d[27] ^ d[26] ^ d[25] ^
    d[23] ^ d[21] ^ d[18] ^ d[17] ^ d[16] ^ d[12] ^ d[9] ^
    d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[0];

assign crc_out[1] =
    d[63] ^ d[60] ^ d[55] ^ d[54] ^ d[52] ^ d[49] ^
    d[48] ^ d[47] ^ d[46] ^ d[44] ^ d[43] ^ d[38] ^ d[37] ^
    d[36] ^ d[32] ^ d[31] ^ d[29] ^ d[28] ^ d[27] ^ d[26] ^
    d[24] ^ d[22] ^ d[19] ^ d[18] ^ d[17] ^ d[13] ^ d[10] ^
    d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[1];

assign crc_out[2] =
    d[61] ^ d[56] ^ d[55] ^ d[53] ^ d[50] ^ d[49] ^
    d[48] ^ d[47] ^ d[45] ^ d[44] ^ d[39] ^ d[38] ^ d[37] ^
    d[33] ^ d[32] ^ d[30] ^ d[29] ^ d[28] ^ d[27] ^ d[25] ^
    d[23] ^ d[20] ^ d[19] ^ d[18] ^ d[14] ^ d[11] ^ d[10] ^
    d[9] ^ d[8] ^ d[7] ^ d[6] ^ d[2];

assign crc_out[3] =
    d[62] ^ d[57] ^ d[56] ^ d[54] ^ d[51] ^ d[50] ^
    d[49] ^ d[48] ^ d[46] ^ d[45] ^ d[40] ^ d[39] ^ d[38] ^
    d[34] ^ d[33] ^ d[31] ^ d[30] ^ d[29] ^ d[28] ^ d[26] ^
    d[24] ^ d[21] ^ d[20] ^ d[19] ^ d[15] ^ d[12] ^ d[11] ^
    d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[3];

assign crc_out[4] =
    d[63] ^ d[58] ^ d[57] ^ d[55] ^ d[52] ^ d[51] ^
    d[50] ^ d[49] ^ d[47] ^ d[46] ^ d[41] ^ d[40] ^ d[39] ^
    d[35] ^ d[34] ^ d[32] ^ d[31] ^ d[30] ^ d[29] ^ d[27] ^
    d[25] ^ d[22] ^ d[21] ^ d[20] ^ d[16] ^ d[13] ^ d[12] ^
    d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[4];

assign crc_out[5] =
    d[59] ^ d[58] ^ d[56] ^ d[53] ^ d[52] ^ d[51] ^
    d[50] ^ d[48] ^ d[47] ^ d[42] ^ d[41] ^ d[40] ^ d[36] ^
    d[35] ^ d[33] ^ d[32] ^ d[31] ^ d[30] ^ d[28] ^ d[26] ^
    d[23] ^ d[22] ^ d[21] ^ d[17] ^ d[14] ^ d[13] ^ d[12] ^
    d[11] ^ d[10] ^ d[9] ^ d[5];

assign crc_out[6] =
    d[62] ^ d[60] ^ d[57] ^ d[52] ^ d[49] ^ d[47] ^
    d[46] ^ d[45] ^ d[41] ^ d[35] ^ d[34] ^ d[33] ^ d[32] ^
    d[30] ^ d[29] ^ d[28] ^ d[26] ^ d[25] ^ d[24] ^ d[22] ^
    d[21] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[13] ^ d[11] ^
    d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ d[4] ^ d[0];

assign crc_out[7] =
    d[63] ^ d[61] ^ d[58] ^ d[53] ^ d[50] ^ d[48] ^
    d[47] ^ d[46] ^ d[42] ^ d[36] ^ d[35] ^ d[34] ^ d[33] ^
    d[31] ^ d[30] ^ d[29] ^ d[27] ^ d[26] ^ d[25] ^ d[23] ^
    d[22] ^ d[18] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[12] ^
    d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[6] ^ d[5] ^ d[1];

assign crc_out[8] =
    d[53] ^ d[49] ^ d[46] ^ d[45] ^ d[42] ^ d[34] ^
    d[32] ^ d[25] ^ d[24] ^ d[21] ^ d[19] ^ d[15] ^ d[13] ^
    d[11] ^ d[10] ^ d[8] ^ d[5] ^ d[4] ^ d[2] ^ d[0];

assign crc_out[9] =
    d[62] ^ d[59] ^ d[53] ^ d[51] ^ d[50] ^ d[48] ^
    d[45] ^ d[42] ^ d[37] ^ d[36] ^ d[33] ^ d[31] ^ d[30] ^
    d[28] ^ d[27] ^ d[23] ^ d[22] ^ d[21] ^ d[20] ^ d[18] ^
    d[17] ^ d[14] ^ d[11] ^ d[8] ^ d[7] ^ d[4] ^ d[3] ^
    d[1] ^ d[0];

assign crc_out[10] =
    d[63] ^ d[62] ^ d[60] ^ d[59] ^ d[53] ^ d[52] ^
    d[49] ^ d[48] ^ d[47] ^ d[45] ^ d[42] ^ d[38] ^ d[36] ^
    d[35] ^ d[34] ^ d[32] ^ d[30] ^ d[29] ^ d[27] ^ d[26] ^
    d[25] ^ d[24] ^ d[22] ^ d[19] ^ d[17] ^ d[16] ^ d[15] ^
    d[7] ^ d[6] ^ d[2] ^ d[1] ^ d[0];

assign crc_out[11] =
    d[63] ^ d[62] ^ d[61] ^ d[60] ^ d[59] ^ d[51] ^
    d[50] ^ d[49] ^ d[47] ^ d[45] ^ d[42] ^ d[39] ^ d[33] ^
    d[21] ^ d[20] ^ d[12] ^ d[9] ^ d[6] ^ d[5] ^ d[4] ^
    d[3] ^ d[2] ^ d[1] ^ d[0];

assign crc_out[12] =
    d[63] ^ d[62] ^ d[61] ^ d[60] ^ d[52] ^ d[51] ^
    d[50] ^ d[48] ^ d[46] ^ d[43] ^ d[40] ^ d[34] ^ d[22] ^
    d[21] ^ d[13] ^ d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^
    d[3] ^ d[2] ^ d[1];

assign crc_out[13] =
    d[63] ^ d[61] ^ d[59] ^ d[54] ^ d[52] ^ d[49] ^
    d[48] ^ d[46] ^ d[45] ^ d[44] ^ d[43] ^ d[42] ^ d[41] ^
    d[37] ^ d[36] ^ d[31] ^ d[30] ^ d[28] ^ d[27] ^ d[26] ^
    d[25] ^ d[22] ^ d[21] ^ d[18] ^ d[17] ^ d[16] ^ d[14] ^
    d[12] ^ d[11] ^ d[9] ^ d[3] ^ d[2] ^ d[0];

assign crc_out[14] =
    d[60] ^ d[59] ^ d[55] ^ d[54] ^ d[51] ^ d[50] ^
    d[49] ^ d[48] ^ d[44] ^ d[38] ^ d[36] ^ d[35] ^ d[32] ^
    d[30] ^ d[29] ^ d[25] ^ d[22] ^ d[21] ^ d[19] ^ d[16] ^
    d[15] ^ d[13] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[6] ^
    d[5] ^ d[3] ^ d[1] ^ d[0];

assign crc_out[15] =
    d[61] ^ d[60] ^ d[56] ^ d[55] ^ d[52] ^ d[51] ^
    d[50] ^ d[49] ^ d[45] ^ d[39] ^ d[37] ^ d[36] ^ d[33] ^
    d[31] ^ d[30] ^ d[26] ^ d[23] ^ d[22] ^ d[20] ^ d[17] ^
    d[16] ^ d[14] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^
    d[6] ^ d[4] ^ d[2] ^ d[1];

assign crc_out[16] =
    d[62] ^ d[61] ^ d[57] ^ d[56] ^ d[53] ^ d[52] ^
    d[51] ^ d[50] ^ d[46] ^ d[40] ^ d[38] ^ d[37] ^ d[34] ^
    d[32] ^ d[31] ^ d[27] ^ d[24] ^ d[23] ^ d[21] ^ d[18] ^
    d[17] ^ d[15] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^ d[8] ^
    d[7] ^ d[5] ^ d[3] ^ d[2];

assign crc_out[17] =
    d[63] ^ d[62] ^ d[58] ^ d[57] ^ d[54] ^ d[53] ^
    d[52] ^ d[51] ^ d[47] ^ d[41] ^ d[39] ^ d[38] ^ d[35] ^
    d[33] ^ d[32] ^ d[28] ^ d[25] ^ d[24] ^ d[22] ^ d[19] ^
    d[18] ^ d[16] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[9] ^
    d[8] ^ d[6] ^ d[4] ^ d[3];

assign crc_out[18] =
    d[63] ^ d[62] ^ d[58] ^ d[55] ^ d[52] ^ d[51] ^
    d[47] ^ d[46] ^ d[45] ^ d[43] ^ d[40] ^ d[39] ^ d[37] ^
    d[35] ^ d[34] ^ d[33] ^ d[31] ^ d[30] ^ d[29] ^ d[28] ^
    d[27] ^ d[21] ^ d[20] ^ d[19] ^ d[18] ^ d[16] ^ d[14] ^
    d[13] ^ d[11] ^ d[10] ^ d[8] ^ d[6] ^ d[0];

assign crc_out[19] =
    d[63] ^ d[62] ^ d[56] ^ d[54] ^ d[52] ^ d[51] ^
    d[45] ^ d[44] ^ d[43] ^ d[42] ^ d[41] ^ d[40] ^ d[38] ^
    d[37] ^ d[34] ^ d[32] ^ d[29] ^ d[27] ^ d[26] ^ d[25] ^
    d[23] ^ d[22] ^ d[20] ^ d[19] ^ d[18] ^ d[16] ^ d[15] ^
    d[14] ^ d[11] ^ d[8] ^ d[6] ^ d[5] ^ d[4] ^ d[1] ^
    d[0];

assign crc_out[20] =
    d[63] ^ d[62] ^ d[59] ^ d[57] ^ d[55] ^ d[54] ^
    d[52] ^ d[51] ^ d[48] ^ d[47] ^ d[44] ^ d[41] ^ d[39] ^
    d[38] ^ d[37] ^ d[36] ^ d[33] ^ d[31] ^ d[25] ^ d[24] ^
    d[20] ^ d[19] ^ d[18] ^ d[15] ^ d[8] ^ d[4] ^ d[2] ^
    d[1] ^ d[0];

assign crc_out[21] =
    d[63] ^ d[60] ^ d[58] ^ d[56] ^ d[55] ^ d[53] ^
    d[52] ^ d[49] ^ d[48] ^ d[45] ^ d[42] ^ d[40] ^ d[39] ^
    d[38] ^ d[37] ^ d[34] ^ d[32] ^ d[26] ^ d[25] ^ d[21] ^
    d[20] ^ d[19] ^ d[16] ^ d[9] ^ d[5] ^ d[3] ^ d[2] ^
    d[1];

assign crc_out[22] =
    d[62] ^ d[61] ^ d[57] ^ d[56] ^ d[51] ^ d[50] ^
    d[49] ^ d[48] ^ d[47] ^ d[45] ^ d[42] ^ d[41] ^ d[40] ^
    d[39] ^ d[38] ^ d[37] ^ d[36] ^ d[33] ^ d[31] ^ d[30] ^
    d[28] ^ d[25] ^ d[23] ^ d[22] ^ d[20] ^ d[18] ^ d[16] ^
    d[12] ^ d[10] ^ d[9] ^ d[8] ^ d[7] ^ d[5] ^ d[3] ^
    d[2] ^ d[0];

assign crc_out[23] =
    d[63] ^ d[59] ^ d[58] ^ d[57] ^ d[54] ^ d[53] ^
    d[52] ^ d[50] ^ d[49] ^ d[47] ^ d[45] ^ d[41] ^ d[40] ^
    d[39] ^ d[38] ^ d[36] ^ d[35] ^ d[34] ^ d[32] ^ d[30] ^
    d[29] ^ d[28] ^ d[27] ^ d[25] ^ d[24] ^ d[19] ^ d[18] ^
    d[16] ^ d[13] ^ d[12] ^ d[11] ^ d[10] ^ d[7] ^ d[5] ^
    d[3] ^ d[1] ^ d[0];

assign crc_out[24] =
    d[60] ^ d[59] ^ d[58] ^ d[55] ^ d[54] ^ d[53] ^
    d[51] ^ d[50] ^ d[48] ^ d[46] ^ d[42] ^ d[41] ^ d[40] ^
    d[39] ^ d[37] ^ d[36] ^ d[35] ^ d[33] ^ d[31] ^ d[30] ^
    d[29] ^ d[28] ^ d[26] ^ d[25] ^ d[20] ^ d[19] ^ d[17] ^
    d[14] ^ d[13] ^ d[12] ^ d[11] ^ d[8] ^ d[6] ^ d[4] ^
    d[2] ^ d[1];

assign crc_out[25] =
    d[62] ^ d[61] ^ d[60] ^ d[56] ^ d[55] ^ d[53] ^
    d[52] ^ d[49] ^ d[48] ^ d[46] ^ d[45] ^ d[41] ^ d[40] ^
    d[38] ^ d[35] ^ d[34] ^ d[32] ^ d[29] ^ d[28] ^ d[25] ^
    d[23] ^ d[20] ^ d[17] ^ d[16] ^ d[15] ^ d[14] ^ d[13] ^
    d[8] ^ d[6] ^ d[4] ^ d[3] ^ d[2] ^ d[0];

assign crc_out[26] =
    d[63] ^ d[61] ^ d[59] ^ d[57] ^ d[56] ^ d[51] ^
    d[50] ^ d[49] ^ d[48] ^ d[45] ^ d[43] ^ d[41] ^ d[39] ^
    d[37] ^ d[33] ^ d[31] ^ d[29] ^ d[28] ^ d[27] ^ d[25] ^
    d[24] ^ d[23] ^ d[15] ^ d[14] ^ d[12] ^ d[8] ^ d[6] ^
    d[3] ^ d[1] ^ d[0];

assign crc_out[27] =
    d[60] ^ d[59] ^ d[58] ^ d[57] ^ d[54] ^ d[53] ^
    d[52] ^ d[50] ^ d[49] ^ d[48] ^ d[47] ^ d[45] ^ d[44] ^
    d[43] ^ d[40] ^ d[38] ^ d[37] ^ d[36] ^ d[35] ^ d[34] ^
    d[32] ^ d[31] ^ d[29] ^ d[27] ^ d[24] ^ d[23] ^ d[21] ^
    d[18] ^ d[17] ^ d[15] ^ d[13] ^ d[12] ^ d[8] ^ d[6] ^
    d[5] ^ d[2] ^ d[1] ^ d[0];

assign crc_out[28] =
    d[62] ^ d[61] ^ d[60] ^ d[58] ^ d[55] ^ d[50] ^
    d[49] ^ d[47] ^ d[44] ^ d[43] ^ d[42] ^ d[41] ^ d[39] ^
    d[38] ^ d[33] ^ d[32] ^ d[31] ^ d[27] ^ d[26] ^ d[24] ^
    d[23] ^ d[22] ^ d[21] ^ d[19] ^ d[17] ^ d[14] ^ d[13] ^
    d[12] ^ d[8] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^ d[1] ^
    d[0];

assign crc_out[29] =
    d[63] ^ d[62] ^ d[61] ^ d[59] ^ d[56] ^ d[51] ^
    d[50] ^ d[48] ^ d[45] ^ d[44] ^ d[43] ^ d[42] ^ d[40] ^
    d[39] ^ d[34] ^ d[33] ^ d[32] ^ d[28] ^ d[27] ^ d[25] ^
    d[24] ^ d[23] ^ d[22] ^ d[20] ^ d[18] ^ d[15] ^ d[14] ^
    d[13] ^ d[9] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2] ^
    d[1];

assign crc_out[30] =
    d[63] ^ d[62] ^ d[60] ^ d[57] ^ d[52] ^ d[51] ^
    d[49] ^ d[46] ^ d[45] ^ d[44] ^ d[43] ^ d[41] ^ d[40] ^
    d[35] ^ d[34] ^ d[33] ^ d[29] ^ d[28] ^ d[26] ^ d[25] ^
    d[24] ^ d[23] ^ d[21] ^ d[19] ^ d[16] ^ d[15] ^ d[14] ^
    d[10] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3] ^ d[2];

assign crc_out[31] =
    d[63] ^ d[61] ^ d[58] ^ d[53] ^ d[52] ^ d[50] ^
    d[47] ^ d[46] ^ d[45] ^ d[44] ^ d[42] ^ d[41] ^ d[36] ^
    d[35] ^ d[34] ^ d[30] ^ d[29] ^ d[27] ^ d[26] ^ d[25] ^
    d[24] ^ d[22] ^ d[20] ^ d[17] ^ d[16] ^ d[15] ^ d[11] ^
    d[8] ^ d[7] ^ d[6] ^ d[5] ^ d[4] ^ d[3];

endmodule