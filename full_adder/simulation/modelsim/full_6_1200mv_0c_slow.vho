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

-- DATE "12/15/2022 09:05:48"

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

ENTITY 	full IS
    PORT (
	a : IN std_logic;
	b : IN std_logic;
	c0 : IN std_logic;
	s : OUT std_logic;
	c : OUT std_logic
	);
END full;

-- Design Ports Information
-- s	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c0	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF full IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic;
SIGNAL ww_b : std_logic;
SIGNAL ww_c0 : std_logic;
SIGNAL ww_s : std_logic;
SIGNAL ww_c : std_logic;
SIGNAL \s~output_o\ : std_logic;
SIGNAL \c~output_o\ : std_logic;
SIGNAL \a~input_o\ : std_logic;
SIGNAL \c0~input_o\ : std_logic;
SIGNAL \b~input_o\ : std_logic;
SIGNAL \x1|s~0_combout\ : std_logic;
SIGNAL \x2|c~0_combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_c0 <= c0;
s <= ww_s;
c <= ww_c;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X12_Y0_N9
\s~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \x1|s~0_combout\,
	devoe => ww_devoe,
	o => \s~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\c~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \x2|c~0_combout\,
	devoe => ww_devoe,
	o => \c~output_o\);

-- Location: IOIBUF_X8_Y0_N1
\a~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a,
	o => \a~input_o\);

-- Location: IOIBUF_X26_Y0_N8
\c0~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_c0,
	o => \c0~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\b~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b,
	o => \b~input_o\);

-- Location: LCCOMB_X8_Y1_N24
\x1|s~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \x1|s~0_combout\ = \a~input_o\ $ (\c0~input_o\ $ (\b~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a~input_o\,
	datac => \c0~input_o\,
	datad => \b~input_o\,
	combout => \x1|s~0_combout\);

-- Location: LCCOMB_X8_Y1_N2
\x2|c~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \x2|c~0_combout\ = (\a~input_o\ & ((\c0~input_o\) # (\b~input_o\))) # (!\a~input_o\ & (\c0~input_o\ & \b~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \a~input_o\,
	datac => \c0~input_o\,
	datad => \b~input_o\,
	combout => \x2|c~0_combout\);

ww_s <= \s~output_o\;

ww_c <= \c~output_o\;
END structure;


