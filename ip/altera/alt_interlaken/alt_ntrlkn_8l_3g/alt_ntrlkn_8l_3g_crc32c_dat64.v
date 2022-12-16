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
// 32 bit CRC of 64 data bits (reversed - MSB first)
// polynomial : 1edc6f41
//    x^28 + x^27 + x^26 + x^25 + x^23 + x^22 + x^20 + x^19 + x^18 + x^14 + x^13 + x^11 + x^10 + x^9 + x^8 + x^6 + x^0
//
//        CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
//        00000000001111111111222222222233 0000000000111111111122222222223333333333444444444455555555556666
//        01234567890123456789012345678901 0123456789012345678901234567890123456789012345678901234567890123
// C00  = ...###....##.####..#.##....#..#. #...######..#...###..#.#.####.##...###....##.####..#.##....#..#.
// C01  = #...###....##.####..#.##....#..# .#...######..#...###..#.#.####.##...###....##.####..#.##....#..#
// C02  = ##...###....##.####..#.##....#.. ..#...######..#...###..#.#.####.##...###....##.####..#.##....#..
// C03  = .##...###....##.####..#.##....#. ...#...######..#...###..#.#.####.##...###....##.####..#.##....#.
// C04  = #.##...###....##.####..#.##....# ....#...######..#...###..#.#.####.##...###....##.####..#.##....#
// C05  = ##.##...###....##.####..#.##.... .....#...######..#...###..#.#.####.##...###....##.####..#.##....
// C06  = ####.....#...###.#..#....#..#.#. #...##.#####.#####...##.###.###.####.....#...###.#..#....#..#.#.
// C07  = .####.....#...###.#..#....#..#.# .#...##.#####.#####...##.###.###.####.....#...###.#..#....#..#.#
// C08  = #.#.......#..##..#...#.......... #.#.##..#.##.#.#...#.#..##......#.#.......#..##..#...#..........
// C09  = .#..##....#..#..#.##.#.....#..#. ##.##..##..#..#..##.####...##.##.#..##....#..#..#.##.#.....#..#.
// C10  = #.###.#...#..#.###..##.....##.## ###...##.......###.#..#.####.##.#.###.#...#..#.###..##.....##.##
// C11  = .#.....#..#..#.#.###.......##### #######..#..#.......##...........#.....#..#..#.#.###.......#####
// C12  = ..#.....#..#..#.#.###.......#### .#######..#..#.......##...........#.....#..#..#.#.###.......####
// C13  = ....##...######.##..#.#....#.#.# #.##.....#.##.#.###..##..####.##....##...######.##..#.#....#.#.#
// C14  = #..##.#.....#...####..##...##... ##.#.######..#.##..#.##..#...##.#..##.#.....#...####..##...##...
// C15  = .#..##.#.....#...####..##...##.. .##.#.######..#.##..#.##..#...##.#..##.#.....#...####..##...##..
// C16  = #.#..##.#.....#...####..##...##. ..##.#.######..#.##..#.##..#...##.#..##.#.....#...####..##...##.
// C17  = ##.#..##.#.....#...####..##...## ...##.#.######..#.##..#.##..#...##.#..##.#.....#...####..##...##
// C18  = .###.#.##..#.###...##..#..#...## #.....#.#.##.##.#.####.....#####.###.#.##..#.###...##..#..#...##
// C19  = #.#..##.######.....##.#.#.....## ##..###.#..#..###.###.##.###.#..#.#..##.######.....##.#.#.....##
// C20  = .#..####.#..#..##..##.##.#.#..## ###.#...#......#..###...##.....#.#..####.#..#..##..##.##.#.#..##
// C21  = #.#..####.#..#..##..##.##.#.#..# .###.#...#......#..###...##.....#.#..####.#..#..##..##.##.#.#..#
// C22  = .#..#######..#.#####....##...##. #.##.#.####.#...#.#.#.##.#..#.##.#..#######..#.#####....##...##.
// C23  = #.###.####...#.#.##.###..###...# ##.#.#.#..####..#.##....##.####.#.###.####...#.#.##.###..###...#
// C24  = .#.###.####...#.#.##.###..###... .##.#.#.#..####..#.##....##.####.#.###.####...#.#.##.###..###...
// C25  = #.##..#.##...##.##..##.##...###. #.###.#.#....#####..#..#.#..##..#.##..#.##...##.##..##.##...###.
// C26  = .#...#.#.#.#.#..####....##.#.#.# ##.#..#.#...#.##.......###.###.#.#...#.#.#.#.#..####....##.#.#.#
// C27  = #.#####.#..###.####.###..####... ###..##.#...##.#.##..#.##..#.#.##.#####.#..###.####.###..####...
// C28  = ##....##.####..#.##....#..#.###. ######..#...###..#.#.####.##...###....##.####..#.##....#..#.###.
// C29  = ###....##.####..#.##....#..#.### .######..#...###..#.#.####.##...###....##.####..#.##....#..#.###
// C30  = .###....##.####..#.##....#..#.## ..######..#...###..#.#.####.##...###....##.####..#.##....#..#.##
// C31  = ..###....##.####..#.##....#..#.# ...######..#...###..#.#.####.##...###....##.####..#.##....#..#.#
//
// Number of XORs used is 32
// Maximum XOR input count is 59
// Total XOR inputs 1502

module alt_ntrlkn_8l_3g_crc32c_dat64 (
	input[31:0] crc_in,
	input[63:0] dat_in,
	output[31:0] crc_out
);

parameter METHOD = 1;

generate
  if (METHOD == 0)
    alt_ntrlkn_8l_3g_crc32c_dat64_flat cc (.c(crc_in),.d(dat_in),.crc_out(crc_out));
  else
    alt_ntrlkn_8l_3g_crc32c_dat64_factor cc (.c(crc_in),.d(dat_in),.crc_out(crc_out));
endgenerate

endmodule
