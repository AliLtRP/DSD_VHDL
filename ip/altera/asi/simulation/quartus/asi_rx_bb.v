// Generated by ASI 8.0 [Altera, IP Toolbench 1.3.0 Build 196]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2008 Altera Corporation
// Any megafunction design, and related net list (encrypted or decrypted),
// support information, device programming or simulation file, and any other
// associated documentation or information provided by Altera or a partner
// under Altera's Megafunction Partnership Program may be used only to
// program PLD devices (but not masked PLD devices) from Altera.  Any other
// use of such megafunction design, net list, support information, device
// programming or simulation file, or any other related documentation or
// information is prohibited for any other purpose, including, but not
// limited to modification, reverse engineering, de-compiling, or use with
// any other silicon devices, unless such use is explicitly licensed under
// a separate agreement with Altera or a megafunction partner.  Title to
// the intellectual property, including patents, copyrights, trademarks,
// trade secrets, or maskworks, embodied in any such megafunction design,
// net list, support information, device programming or simulation file, or
// any other related documentation or information provided by Altera or a
// megafunction partner, remains with Altera, the megafunction partner, or
// their respective licensors.  No other licenses, including any licenses
// needed under any third party's intellectual property, are provided herein.

module asi_rx (
	rst,
	asi_rx,
	rx_serial_clk,
	rx_serial_clk90,
	rx_clk135,
	rx_data,
	rx_ts_status,
	rx_data_clk,
	rx_data_valid);

	input		rst;
	input		asi_rx;
	input		rx_serial_clk;
	input		rx_serial_clk90;
	input		rx_clk135;
	output	[7:0]	rx_data;
	output	[7:0]	rx_ts_status;
	output		rx_data_clk;
	output		rx_data_valid;
endmodule
