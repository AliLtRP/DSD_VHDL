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

-- DATE "12/15/2022 13:05:39"

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

ENTITY 	one IS
    PORT (
	a3 : IN std_logic;
	a2 : IN std_logic;
	a1 : IN std_logic;
	a0 : IN std_logic;
	b3 : OUT std_logic;
	b2 : OUT std_logic;
	b1 : OUT std_logic;
	b0 : OUT std_logic
	);
END one;

-- Design Ports Information
-- b3	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b2	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b1	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b0	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a3	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a2	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a1	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a0	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF one IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a3 : std_logic;
SIGNAL ww_a2 : std_logic;
SIGNAL ww_a1 : std_logic;
SIGNAL ww_a0 : std_logic;
SIGNAL ww_b3 : std_logic;
SIGNAL ww_b2 : std_logic;
SIGNAL ww_b1 : std_logic;
SIGNAL ww_b0 : std_logic;
SIGNAL \b3~output_o\ : std_logic;
SIGNAL \b2~output_o\ : std_logic;
SIGNAL \b1~output_o\ : std_logic;
SIGNAL \b0~output_o\ : std_logic;
SIGNAL \a3~input_o\ : std_logic;
SIGNAL \a2~input_o\ : std_logic;
SIGNAL \a1~input_o\ : std_logic;
SIGNAL \a0~input_o\ : std_logic;
SIGNAL \ALT_INV_a0~input_o\ : std_logic;
SIGNAL \ALT_INV_a1~input_o\ : std_logic;
SIGNAL \ALT_INV_a2~input_o\ : std_logic;
SIGNAL \ALT_INV_a3~input_o\ : std_logic;

BEGIN

ww_a3 <= a3;
ww_a2 <= a2;
ww_a1 <= a1;
ww_a0 <= a0;
b3 <= ww_b3;
b2 <= ww_b2;
b1 <= ww_b1;
b0 <= ww_b0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_a0~input_o\ <= NOT \a0~input_o\;
\ALT_INV_a1~input_o\ <= NOT \a1~input_o\;
\ALT_INV_a2~input_o\ <= NOT \a2~input_o\;
\ALT_INV_a3~input_o\ <= NOT \a3~input_o\;

-- Location: IOOBUF_X24_Y31_N9
\b3~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_a3~input_o\,
	devoe => ww_devoe,
	o => \b3~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\b2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_a2~input_o\,
	devoe => ww_devoe,
	o => \b2~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\b1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_a1~input_o\,
	devoe => ww_devoe,
	o => \b1~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\b0~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_a0~input_o\,
	devoe => ww_devoe,
	o => \b0~output_o\);

-- Location: IOIBUF_X20_Y31_N8
\a3~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a3,
	o => \a3~input_o\);

-- Location: IOIBUF_X24_Y0_N1
\a2~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a2,
	o => \a2~input_o\);

-- Location: IOIBUF_X24_Y0_N8
\a1~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a1,
	o => \a1~input_o\);

-- Location: IOIBUF_X20_Y0_N1
\a0~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a0,
	o => \a0~input_o\);

ww_b3 <= \b3~output_o\;

ww_b2 <= \b2~output_o\;

ww_b1 <= \b1~output_o\;

ww_b0 <= \b0~output_o\;
END structure;


