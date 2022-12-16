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

-- DATE "12/09/2022 20:32:51"

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

ENTITY 	mux_4 IS
    PORT (
	i : IN std_logic_vector(3 DOWNTO 0);
	s : IN std_logic_vector(1 DOWNTO 0);
	z : OUT std_logic
	);
END mux_4;

-- Design Ports Information
-- z	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i[1]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[0]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i[2]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- s[1]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i[0]	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i[3]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF mux_4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_s : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_z : std_logic;
SIGNAL \z~output_o\ : std_logic;
SIGNAL \i[3]~input_o\ : std_logic;
SIGNAL \s[1]~input_o\ : std_logic;
SIGNAL \s[0]~input_o\ : std_logic;
SIGNAL \i[2]~input_o\ : std_logic;
SIGNAL \i[0]~input_o\ : std_logic;
SIGNAL \k6|z~0_combout\ : std_logic;
SIGNAL \i[1]~input_o\ : std_logic;
SIGNAL \k6|z~1_combout\ : std_logic;

BEGIN

ww_i <= i;
ww_s <= s;
z <= ww_z;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X8_Y0_N2
\z~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \k6|z~1_combout\,
	devoe => ww_devoe,
	o => \z~output_o\);

-- Location: IOIBUF_X14_Y0_N8
\i[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i(3),
	o => \i[3]~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\s[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s(1),
	o => \s[1]~input_o\);

-- Location: IOIBUF_X10_Y0_N8
\s[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_s(0),
	o => \s[0]~input_o\);

-- Location: IOIBUF_X14_Y31_N1
\i[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i(2),
	o => \i[2]~input_o\);

-- Location: IOIBUF_X26_Y0_N8
\i[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i(0),
	o => \i[0]~input_o\);

-- Location: LCCOMB_X11_Y1_N0
\k6|z~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \k6|z~0_combout\ = (\s[1]~input_o\ & ((\s[0]~input_o\) # ((\i[2]~input_o\)))) # (!\s[1]~input_o\ & (!\s[0]~input_o\ & ((\i[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s[1]~input_o\,
	datab => \s[0]~input_o\,
	datac => \i[2]~input_o\,
	datad => \i[0]~input_o\,
	combout => \k6|z~0_combout\);

-- Location: IOIBUF_X12_Y0_N8
\i[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i(1),
	o => \i[1]~input_o\);

-- Location: LCCOMB_X11_Y1_N2
\k6|z~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \k6|z~1_combout\ = (\k6|z~0_combout\ & ((\i[3]~input_o\) # ((!\s[0]~input_o\)))) # (!\k6|z~0_combout\ & (((\i[1]~input_o\ & \s[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i[3]~input_o\,
	datab => \k6|z~0_combout\,
	datac => \i[1]~input_o\,
	datad => \s[0]~input_o\,
	combout => \k6|z~1_combout\);

ww_z <= \z~output_o\;
END structure;


