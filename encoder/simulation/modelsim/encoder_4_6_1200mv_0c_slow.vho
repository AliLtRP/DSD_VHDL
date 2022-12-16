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

-- DATE "12/11/2022 07:02:52"

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

ENTITY 	encoder_4 IS
    PORT (
	y : IN std_logic_vector(3 DOWNTO 0);
	a : OUT std_logic_vector(1 DOWNTO 0)
	);
END encoder_4;

-- Design Ports Information
-- y[0]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[1]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[3]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- y[2]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF encoder_4 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_y : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_a : std_logic_vector(1 DOWNTO 0);
SIGNAL \y[0]~input_o\ : std_logic;
SIGNAL \a[0]~output_o\ : std_logic;
SIGNAL \a[1]~output_o\ : std_logic;
SIGNAL \y[1]~input_o\ : std_logic;
SIGNAL \y[3]~input_o\ : std_logic;
SIGNAL \a~0_combout\ : std_logic;
SIGNAL \y[2]~input_o\ : std_logic;
SIGNAL \a~1_combout\ : std_logic;

BEGIN

ww_y <= y;
a <= ww_a;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X20_Y0_N9
\a[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \a~0_combout\,
	devoe => ww_devoe,
	o => \a[0]~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\a[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \a~1_combout\,
	devoe => ww_devoe,
	o => \a[1]~output_o\);

-- Location: IOIBUF_X12_Y0_N8
\y[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(1),
	o => \y[1]~input_o\);

-- Location: IOIBUF_X22_Y0_N1
\y[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(3),
	o => \y[3]~input_o\);

-- Location: LCCOMB_X20_Y1_N16
\a~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \a~0_combout\ = (\y[1]~input_o\) # (\y[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \y[1]~input_o\,
	datad => \y[3]~input_o\,
	combout => \a~0_combout\);

-- Location: IOIBUF_X22_Y0_N8
\y[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(2),
	o => \y[2]~input_o\);

-- Location: LCCOMB_X20_Y1_N10
\a~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \a~1_combout\ = (\y[3]~input_o\) # (\y[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \y[3]~input_o\,
	datad => \y[2]~input_o\,
	combout => \a~1_combout\);

-- Location: IOIBUF_X14_Y31_N8
\y[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_y(0),
	o => \y[0]~input_o\);

ww_a(0) <= \a[0]~output_o\;

ww_a(1) <= \a[1]~output_o\;
END structure;


