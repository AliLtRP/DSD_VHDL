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

-- DATE "12/16/2022 11:02:09"

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

ENTITY 	ab IS
    PORT (
	a : IN std_logic_vector(3 DOWNTO 0);
	b : IN std_logic_vector(3 DOWNTO 0);
	cin : IN std_logic;
	c : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END ab;

-- Design Ports Information
-- a[0]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[2]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[3]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cin	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[0]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[1]	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[2]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c[3]	=>  Location: PIN_M4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[0]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[1]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[2]	=>  Location: PIN_N4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- b[3]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ab IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_b : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cin : std_logic;
SIGNAL ww_c : std_logic_vector(3 DOWNTO 0);
SIGNAL \a[0]~input_o\ : std_logic;
SIGNAL \a[1]~input_o\ : std_logic;
SIGNAL \a[2]~input_o\ : std_logic;
SIGNAL \a[3]~input_o\ : std_logic;
SIGNAL \cin~input_o\ : std_logic;
SIGNAL \c[0]~output_o\ : std_logic;
SIGNAL \c[1]~output_o\ : std_logic;
SIGNAL \c[2]~output_o\ : std_logic;
SIGNAL \c[3]~output_o\ : std_logic;
SIGNAL \b[0]~input_o\ : std_logic;
SIGNAL \b[1]~input_o\ : std_logic;
SIGNAL \x0|x1|x1|x1|s~combout\ : std_logic;
SIGNAL \b[2]~input_o\ : std_logic;
SIGNAL \x0|x1|x2|x1|s~combout\ : std_logic;
SIGNAL \b[3]~input_o\ : std_logic;
SIGNAL \x0|x1|x3|x1|s~combout\ : std_logic;

BEGIN

ww_a <= a;
ww_b <= b;
ww_cin <= cin;
c <= ww_c;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: IOOBUF_X24_Y0_N9
\c[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \b[0]~input_o\,
	devoe => ww_devoe,
	o => \c[0]~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\c[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \x0|x1|x1|x1|s~combout\,
	devoe => ww_devoe,
	o => \c[1]~output_o\);

-- Location: IOOBUF_X10_Y31_N2
\c[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \x0|x1|x2|x1|s~combout\,
	devoe => ww_devoe,
	o => \c[2]~output_o\);

-- Location: IOOBUF_X8_Y0_N2
\c[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \x0|x1|x3|x1|s~combout\,
	devoe => ww_devoe,
	o => \c[3]~output_o\);

-- Location: IOIBUF_X12_Y0_N8
\b[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(0),
	o => \b[0]~input_o\);

-- Location: IOIBUF_X8_Y0_N8
\b[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(1),
	o => \b[1]~input_o\);

-- Location: LCCOMB_X11_Y1_N8
\x0|x1|x1|x1|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \x0|x1|x1|x1|s~combout\ = \b[1]~input_o\ $ (\b[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \b[1]~input_o\,
	datad => \b[0]~input_o\,
	combout => \x0|x1|x1|x1|s~combout\);

-- Location: IOIBUF_X10_Y0_N8
\b[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(2),
	o => \b[2]~input_o\);

-- Location: LCCOMB_X11_Y1_N26
\x0|x1|x2|x1|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \x0|x1|x2|x1|s~combout\ = \b[2]~input_o\ $ (((\b[1]~input_o\) # (\b[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \b[2]~input_o\,
	datac => \b[1]~input_o\,
	datad => \b[0]~input_o\,
	combout => \x0|x1|x2|x1|s~combout\);

-- Location: IOIBUF_X29_Y0_N1
\b[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_b(3),
	o => \b[3]~input_o\);

-- Location: LCCOMB_X11_Y1_N4
\x0|x1|x3|x1|s\ : cycloneiv_lcell_comb
-- Equation(s):
-- \x0|x1|x3|x1|s~combout\ = \b[3]~input_o\ $ (((\b[1]~input_o\) # ((\b[2]~input_o\) # (\b[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \b[1]~input_o\,
	datab => \b[2]~input_o\,
	datac => \b[3]~input_o\,
	datad => \b[0]~input_o\,
	combout => \x0|x1|x3|x1|s~combout\);

-- Location: IOIBUF_X22_Y0_N1
\a[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(0),
	o => \a[0]~input_o\);

-- Location: IOIBUF_X14_Y31_N8
\a[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(1),
	o => \a[1]~input_o\);

-- Location: IOIBUF_X33_Y10_N1
\a[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(2),
	o => \a[2]~input_o\);

-- Location: IOIBUF_X29_Y0_N8
\a[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_a(3),
	o => \a[3]~input_o\);

-- Location: IOIBUF_X33_Y14_N8
\cin~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cin,
	o => \cin~input_o\);

ww_c(0) <= \c[0]~output_o\;

ww_c(1) <= \c[1]~output_o\;

ww_c(2) <= \c[2]~output_o\;

ww_c(3) <= \c[3]~output_o\;
END structure;


