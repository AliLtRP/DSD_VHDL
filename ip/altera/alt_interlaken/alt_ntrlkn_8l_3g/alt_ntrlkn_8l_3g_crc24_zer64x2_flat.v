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

//
// 24 bit CRC of 64 data bits (reversed - MSB first)
// polynomial : 00328b63
//    x^21 + x^20 + x^17 + x^15 + x^11 + x^9 + x^8 + x^6 + x^5 + x^1 + x^0
//
//        CCCCCCCCCCCCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
//        000000000011111111112222 0000000000111111111122222222223333333333444444444455555555556666
//        012345678901234567890123 0123456789012345678901234567890123456789012345678901234567890123
// C00  = #..#.....#....##...##.## ................................................................
// C01  = .#.##....##...#.#..#.##. ................................................................
// C02  = #.#.##....##...#.#..#.## ................................................................
// C03  = .#.#.##....##...#.#..#.# ................................................................
// C04  = #.#.#.##....##...#.#..#. ................................................................
// C05  = ##...#.###...#.#..##..#. ................................................................
// C06  = .###..#.#.#....##.....#. ................................................................
// C07  = #.###..#.#.#....##.....# ................................................................
// C08  = .#..##..###.#.##.####.## ................................................................
// C09  = #.##.##...##.##.#.#..##. ................................................................
// C10  = ##.##.##...##.##.#.#..## ................................................................
// C11  = ######.###..###.#.##..#. ................................................................
// C12  = .######.###..###.#.##..# ................................................................
// C13  = ..######.###..###.#.##.. ................................................................
// C14  = #..######.###..###.#.##. ................................................................
// C15  = ##.######..#########.... ................................................................
// C16  = .##.######..#########... ................................................................
// C17  = #.#..####.#..#..###..### ................................................................
// C18  = ##.#..####.#..#..###..## ................................................................
// C19  = .##.#..####.#..#..###..# ................................................................
// C20  = ..#..#..#.##.####....### ................................................................
// C21  = #.....#....##...##.##... ................................................................
// C22  = .#.....#....##...##.##.. ................................................................
// C23  = ..#.....#....##...##.##. ................................................................
//
// Number of XORs used is 24
// Maximum XOR input count is 17
//   Best possible depth in 4 LUTs = 3
//   Best possible depth in 5 LUTs = 2
//   Best possible depth in 6 LUTs = 2
// Total XOR inputs 296
//
// Special signal relations -
//    none
//

module alt_ntrlkn_8l_3g_crc24_zer64x2_flat (c,crc_out);
input[23:0] c;
output[23:0] crc_out;
wire[23:0] crc_out;

assign crc_out[0] =
    c[0] ^ c[3] ^ c[9] ^ c[14] ^ c[15] ^ c[19] ^
    c[20] ^ c[22] ^ c[23];

assign crc_out[1] =
    c[1] ^ c[3] ^ c[4] ^ c[9] ^ c[10] ^ c[14] ^
    c[16] ^ c[19] ^ c[21] ^ c[22];

assign crc_out[2] =
    c[0] ^ c[2] ^ c[4] ^ c[5] ^ c[10] ^ c[11] ^
    c[15] ^ c[17] ^ c[20] ^ c[22] ^ c[23];

assign crc_out[3] =
    c[1] ^ c[3] ^ c[5] ^ c[6] ^ c[11] ^ c[12] ^
    c[16] ^ c[18] ^ c[21] ^ c[23];

assign crc_out[4] =
    c[0] ^ c[2] ^ c[4] ^ c[6] ^ c[7] ^ c[12] ^
    c[13] ^ c[17] ^ c[19] ^ c[22];

assign crc_out[5] =
    c[0] ^ c[1] ^ c[5] ^ c[7] ^ c[8] ^ c[9] ^
    c[13] ^ c[15] ^ c[18] ^ c[19] ^ c[22];

assign crc_out[6] =
    c[1] ^ c[2] ^ c[3] ^ c[6] ^ c[8] ^ c[10] ^
    c[15] ^ c[16] ^ c[22];

assign crc_out[7] =
    c[0] ^ c[2] ^ c[3] ^ c[4] ^ c[7] ^ c[9] ^
    c[11] ^ c[16] ^ c[17] ^ c[23];

assign crc_out[8] =
    c[1] ^ c[4] ^ c[5] ^ c[8] ^ c[9] ^ c[10] ^
    c[12] ^ c[14] ^ c[15] ^ c[17] ^ c[18] ^ c[19] ^ c[20] ^
    c[22] ^ c[23];

assign crc_out[9] =
    c[0] ^ c[2] ^ c[3] ^ c[5] ^ c[6] ^ c[10] ^
    c[11] ^ c[13] ^ c[14] ^ c[16] ^ c[18] ^ c[21] ^ c[22];

assign crc_out[10] =
    c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[6] ^ c[7] ^
    c[11] ^ c[12] ^ c[14] ^ c[15] ^ c[17] ^ c[19] ^ c[22] ^
    c[23];

assign crc_out[11] =
    c[0] ^ c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^
    c[7] ^ c[8] ^ c[9] ^ c[12] ^ c[13] ^ c[14] ^ c[16] ^
    c[18] ^ c[19] ^ c[22];

assign crc_out[12] =
    c[1] ^ c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^
    c[8] ^ c[9] ^ c[10] ^ c[13] ^ c[14] ^ c[15] ^ c[17] ^
    c[19] ^ c[20] ^ c[23];

assign crc_out[13] =
    c[2] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^
    c[9] ^ c[10] ^ c[11] ^ c[14] ^ c[15] ^ c[16] ^ c[18] ^
    c[20] ^ c[21];

assign crc_out[14] =
    c[0] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^
    c[8] ^ c[10] ^ c[11] ^ c[12] ^ c[15] ^ c[16] ^ c[17] ^
    c[19] ^ c[21] ^ c[22];

assign crc_out[15] =
    c[0] ^ c[1] ^ c[3] ^ c[4] ^ c[5] ^ c[6] ^
    c[7] ^ c[8] ^ c[11] ^ c[12] ^ c[13] ^ c[14] ^ c[15] ^
    c[16] ^ c[17] ^ c[18] ^ c[19];

assign crc_out[16] =
    c[1] ^ c[2] ^ c[4] ^ c[5] ^ c[6] ^ c[7] ^
    c[8] ^ c[9] ^ c[12] ^ c[13] ^ c[14] ^ c[15] ^ c[16] ^
    c[17] ^ c[18] ^ c[19] ^ c[20];

assign crc_out[17] =
    c[0] ^ c[2] ^ c[5] ^ c[6] ^ c[7] ^ c[8] ^
    c[10] ^ c[13] ^ c[16] ^ c[17] ^ c[18] ^ c[21] ^ c[22] ^
    c[23];

assign crc_out[18] =
    c[0] ^ c[1] ^ c[3] ^ c[6] ^ c[7] ^ c[8] ^
    c[9] ^ c[11] ^ c[14] ^ c[17] ^ c[18] ^ c[19] ^ c[22] ^
    c[23];

assign crc_out[19] =
    c[1] ^ c[2] ^ c[4] ^ c[7] ^ c[8] ^ c[9] ^
    c[10] ^ c[12] ^ c[15] ^ c[18] ^ c[19] ^ c[20] ^ c[23];

assign crc_out[20] =
    c[2] ^ c[5] ^ c[8] ^ c[10] ^ c[11] ^ c[13] ^
    c[14] ^ c[15] ^ c[16] ^ c[21] ^ c[22] ^ c[23];

assign crc_out[21] =
    c[0] ^ c[6] ^ c[11] ^ c[12] ^ c[16] ^ c[17] ^
    c[19] ^ c[20];

assign crc_out[22] =
    c[1] ^ c[7] ^ c[12] ^ c[13] ^ c[17] ^ c[18] ^
    c[20] ^ c[21];

assign crc_out[23] =
    c[2] ^ c[8] ^ c[13] ^ c[14] ^ c[18] ^ c[19] ^
    c[21] ^ c[22];

endmodule


