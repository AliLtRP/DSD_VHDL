// megafunction wizard: %ALTIOBUF%
// GENERATION: STANDARD
// VERSION: WM1.0
// MODULE: altiobuf_bidir 

// ============================================================
// File Name: av_aux_buffer.v
// Megafunction Name(s):
// 			altiobuf_bidir
//
// Simulation Library Files(s):
// 			arriav
// ============================================================
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
//
// 12.1 Build 177 11/07/2012 SJ Full Version
// ************************************************************


//Copyright (C) 1991-2012 Altera Corporation
//Your use of Altera Corporation's design tools, logic functions 
//and other software and tools, and its AMPP partner logic 
//functions, and any output files from any of the foregoing 
//(including device programming or simulation files), and any 
//associated documentation or information are expressly subject 
//to the terms and conditions of the Altera Program License 
//Subscription Agreement, Altera MegaCore Function License 
//Agreement, or other applicable license agreement, including, 
//without limitation, that your use is for the sole purpose of 
//programming logic devices manufactured by Altera and sold by 
//Altera or its authorized distributors.  Please refer to the 
//applicable agreement for further details.


//altiobuf_bidir CBX_AUTO_BLACKBOX="ALL" DEVICE_FAMILY="Arria V" ENABLE_BUS_HOLD="FALSE" NUMBER_OF_CHANNELS=1 OPEN_DRAIN_OUTPUT="FALSE" USE_DIFFERENTIAL_MODE="TRUE" USE_DYNAMIC_TERMINATION_CONTROL="FALSE" USE_TERMINATION_CONTROL="FALSE" datain dataio dataio_b dataout oe oe_b
//VERSION_BEGIN 12.1 cbx_altiobuf_bidir 2012:11:07:18:03:59:SJ cbx_mgl 2012:11:07:18:06:30:SJ cbx_stratixiii 2012:11:07:18:03:59:SJ cbx_stratixv 2012:11:07:18:03:59:SJ  VERSION_END
// synthesis VERILOG_INPUT_VERSION VERILOG_2001
// altera message_off 10463


//synthesis_resources = arriav_io_ibuf 1 arriav_io_obuf 2 arriav_pseudo_diff_out 1 
//synopsys translate_off
`timescale 1 ps / 1 ps
//synopsys translate_on
module  av_aux_buffer_iobuf_bidir_knp
	( 
	datain,
	dataio,
	dataio_b,
	dataout,
	oe,
	oe_b) ;
	input   [0:0]  datain;
	inout   [0:0]  dataio;
	inout   [0:0]  dataio_b;
	output   [0:0]  dataout;
	input   [0:0]  oe;
	input   [0:0]  oe_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_off
`endif
	tri1   [0:0]  oe_b;
`ifndef ALTERA_RESERVED_QIS
// synopsys translate_on
`endif

	wire  [0:0]   wire_ibufa_o;
	wire  [0:0]   wire_obuf_ba_o;
	wire  [0:0]   wire_obufa_o;
	wire  [0:0]   wire_pseudo_diffa_o;
	wire  [0:0]   wire_pseudo_diffa_obar;
	wire  [0:0]   wire_pseudo_diffa_oebout;
	wire  [0:0]   wire_pseudo_diffa_oeout;

	arriav_io_ibuf   ibufa_0
	( 
	.i(dataio),
	.ibar(dataio_b),
	.o(wire_ibufa_o[0:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	defparam
		ibufa_0.bus_hold = "false",
		ibufa_0.differential_mode = "true",
		ibufa_0.lpm_type = "arriav_io_ibuf";
	arriav_io_obuf   obuf_ba_0
	( 
	.i(wire_pseudo_diffa_obar),
	.o(wire_obuf_ba_o[0:0]),
	.obar(),
	.oe((~ wire_pseudo_diffa_oebout))
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obuf_ba_0.bus_hold = "false",
		obuf_ba_0.open_drain_output = "false",
		obuf_ba_0.lpm_type = "arriav_io_obuf";
	arriav_io_obuf   obufa_0
	( 
	.i(wire_pseudo_diffa_o),
	.o(wire_obufa_o[0:0]),
	.obar(),
	.oe((~ wire_pseudo_diffa_oeout))
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dynamicterminationcontrol(1'b0),
	.parallelterminationcontrol({16{1'b0}}),
	.seriesterminationcontrol({16{1'b0}})
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	// synopsys translate_off
	,
	.devoe(1'b1)
	// synopsys translate_on
	);
	defparam
		obufa_0.bus_hold = "false",
		obufa_0.open_drain_output = "false",
		obufa_0.lpm_type = "arriav_io_obuf";
	arriav_pseudo_diff_out   pseudo_diffa_0
	( 
	.dtc(),
	.dtcbar(),
	.i(datain),
	.o(wire_pseudo_diffa_o[0:0]),
	.obar(wire_pseudo_diffa_obar[0:0]),
	.oebout(wire_pseudo_diffa_oebout[0:0]),
	.oein((~ oe)),
	.oeout(wire_pseudo_diffa_oeout[0:0])
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_off
	`endif
	,
	.dtcin(1'b0)
	`ifndef FORMAL_VERIFICATION
	// synopsys translate_on
	`endif
	);
	assign
		dataio = wire_obufa_o,
		dataio_b = wire_obuf_ba_o,
		dataout = wire_ibufa_o;
endmodule //av_aux_buffer_iobuf_bidir_knp
//VALID FILE


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module av_aux_buffer (
	datain,
	oe,
	oe_b,
	dataio,
	dataio_b,
	dataout);

	input	[0:0]  datain;
	input	[0:0]  oe;
	input	[0:0]  oe_b;
	inout	[0:0]  dataio;
	inout	[0:0]  dataio_b;
	output	[0:0]  dataout;

	wire [0:0] sub_wire0;
	wire [0:0] dataout = sub_wire0[0:0];

	av_aux_buffer_iobuf_bidir_knp	av_aux_buffer_iobuf_bidir_knp_component (
				.dataio (dataio),
				.dataio_b (dataio_b),
				.oe (oe),
				.datain (datain),
				.oe_b (oe_b),
				.dataout (sub_wire0));

endmodule

// ============================================================
// CNX file retrieval info
// ============================================================
// Retrieval info: PRIVATE: INTENDED_DEVICE_FAMILY STRING "Arria V"
// Retrieval info: PRIVATE: SYNTH_WRAPPER_GEN_POSTFIX STRING "0"
// Retrieval info: LIBRARY: altera_mf altera_mf.altera_mf_components.all
// Retrieval info: CONSTANT: INTENDED_DEVICE_FAMILY STRING "Arria V"
// Retrieval info: CONSTANT: enable_bus_hold STRING "FALSE"
// Retrieval info: CONSTANT: left_shift_series_termination_control STRING "FALSE"
// Retrieval info: CONSTANT: number_of_channels NUMERIC "1"
// Retrieval info: CONSTANT: open_drain_output STRING "FALSE"
// Retrieval info: CONSTANT: use_differential_mode STRING "TRUE"
// Retrieval info: CONSTANT: use_dynamic_termination_control STRING "FALSE"
// Retrieval info: CONSTANT: use_termination_control STRING "FALSE"
// Retrieval info: USED_PORT: datain 0 0 1 0 INPUT NODEFVAL "datain[0..0]"
// Retrieval info: USED_PORT: dataio 0 0 1 0 BIDIR NODEFVAL "dataio[0..0]"
// Retrieval info: USED_PORT: dataio_b 0 0 1 0 BIDIR NODEFVAL "dataio_b[0..0]"
// Retrieval info: USED_PORT: dataout 0 0 1 0 OUTPUT NODEFVAL "dataout[0..0]"
// Retrieval info: USED_PORT: oe 0 0 1 0 INPUT NODEFVAL "oe[0..0]"
// Retrieval info: USED_PORT: oe_b 0 0 1 0 INPUT NODEFVAL "oe_b[0..0]"
// Retrieval info: CONNECT: @datain 0 0 1 0 datain 0 0 1 0
// Retrieval info: CONNECT: @oe 0 0 1 0 oe 0 0 1 0
// Retrieval info: CONNECT: @oe_b 0 0 1 0 oe_b 0 0 1 0
// Retrieval info: CONNECT: dataio 0 0 1 0 @dataio 0 0 1 0
// Retrieval info: CONNECT: dataio_b 0 0 1 0 @dataio_b 0 0 1 0
// Retrieval info: CONNECT: dataout 0 0 1 0 @dataout 0 0 1 0
// Retrieval info: GEN_FILE: TYPE_NORMAL av_aux_buffer.v TRUE
// Retrieval info: GEN_FILE: TYPE_NORMAL av_aux_buffer.inc FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL av_aux_buffer.cmp FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL av_aux_buffer.bsf FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL av_aux_buffer_inst.v FALSE
// Retrieval info: GEN_FILE: TYPE_NORMAL av_aux_buffer_bb.v FALSE
// Retrieval info: LIB_FILE: arriav
