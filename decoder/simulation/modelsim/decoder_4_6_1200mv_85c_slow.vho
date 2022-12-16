-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "12/11/2022 06:47:56"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	decoder_4 IS
    PORT (
	a0 : IN std_logic;
	a1 : IN std_logic;
	e : IN std_logic;
	y : OUT std_logic;
	y1 : OUT std_logic;
	y2 : OUT std_logic;
	y3 : OUT std_logic
	);
END decoder_4;

-- Design Ports Information
-- e	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y1	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y2	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y3	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a0	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a1	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF decoder_4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a0 : std_logic;
SIGNAL ww_a1 : std_logic;
SIGNAL ww_e : std_logic;
SIGNAL ww_y : std_logic;
SIGNAL ww_y1 : std_logic;
SIGNAL ww_y2 : std_logic;
SIGNAL ww_y3 : std_logic;
SIGNAL \e~input_o\ : std_logic;
SIGNAL \y~output_o\ : std_logic;
SIGNAL \y1~output_o\ : std_logic;
SIGNAL \y2~output_o\ : std_logic;
SIGNAL \y3~output_o\ : std_logic;
SIGNAL \a0~input_o\ : std_logic;
SIGNAL \a1~input_o\ : std_logic;
SIGNAL \y~0_combout\ : std_logic;
SIGNAL \y1~0_combout\ : std_logic;
SIGNAL \y1~1_combout\ : std_logic;
SIGNAL \y1~2_combout\ : std_logic;
SIGNAL \ALT_INV_y~0_combout\ : std_logic;

BEGIN

ww_a0 <= a0;
ww_a1 <= a1;
ww_e <= e;
y <= ww_y;
y1 <= ww_y1;
y2 <= ww_y2;
y3 <= ww_y3;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_y~0_combout\ <= NOT \y~0_combout\;

-- Location: IOOBUF_X8_Y0_N2
\y~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_y~0_combout\,
	devoe => ww_devoe,
	o => \y~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\y1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y1~0_combout\,
	devoe => ww_devoe,
	o => \y1~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\y2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y1~1_combout\,
	devoe => ww_devoe,
	o => \y2~output_o\);

-- Location: IOOBUF_X8_Y0_N9
\y3~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \y1~2_combout\,
	devoe => ww_devoe,
	o => \y3~output_o\);

-- Location: IOIBUF_X10_Y31_N1
\a0~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a0,
	o => \a0~input_o\);

-- Location: IOIBUF_X12_Y0_N8
\a1~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a1,
	o => \a1~input_o\);

-- Location: LCCOMB_X8_Y1_N24
\y~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \y~0_combout\ = (\a0~input_o\) # (\a1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a0~input_o\,
	datad => \a1~input_o\,
	combout => \y~0_combout\);

-- Location: LCCOMB_X8_Y1_N2
\y1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \y1~0_combout\ = (!\a0~input_o\ & \a1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a0~input_o\,
	datad => \a1~input_o\,
	combout => \y1~0_combout\);

-- Location: LCCOMB_X8_Y1_N20
\y1~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \y1~1_combout\ = (\a0~input_o\ & !\a1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a0~input_o\,
	datad => \a1~input_o\,
	combout => \y1~1_combout\);

-- Location: LCCOMB_X8_Y1_N14
\y1~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \y1~2_combout\ = (\a0~input_o\ & \a1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a0~input_o\,
	datad => \a1~input_o\,
	combout => \y1~2_combout\);

-- Location: IOIBUF_X14_Y31_N8
\e~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_e,
	o => \e~input_o\);

ww_y <= \y~output_o\;

ww_y1 <= \y1~output_o\;

ww_y2 <= \y2~output_o\;

ww_y3 <= \y3~output_o\;
END structure;


