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

module alt_e40_rx_top_siv
(
	input clk50,
	input cpu_resetn,

	// 10G IO
	input clk_ref_r,
	input [3:0] rx_serial_r,
	//output [3:0] tx_serial_r,
	
	// CFP MDIO controls
	output cfp_mdc,
	inout  cfp_mdio,
	input  cfp_glb_alrm,
	output [4:0] cfp_prtadr,	
	
	// CFP custom controls
	output cfp_mod_lopwr,
	output cfp_mod_rst,
	output cfp_tx_dis,
	input cfp_mod_abs,
	input cfp_rx_los,
	input [3:1] cfp_prg_alrm,
	output [3:1] cfp_prg_cntl,
	
	// XFP I2C
	inout xfp_scl,
	inout xfp_sda,

	// XFP custom controls	
	output xfp_mod_desel,
	output xfp_pdown_rst,
	output xfp_tx_dis
);

parameter FAST_SIMULATION = 1'b0;
parameter SIM_NO_JTAG = 1'b0;
parameter SIM_NO_TEMP_SENSE = 1'b0;
parameter TERM_STYLE_JTAG = 1'b1; // vs sys console
parameter WORDS = 2; // no override

assign xfp_mod_desel = 1'b0;
assign xfp_pdown_rst = 1'b1;
assign xfp_tx_dis = 1'b0;

/////////////////////////
// dev_clr sync-reset
/////////////////////////

wire user_mode_sync, arst;

alt_e40_user_mode_det dev_clr(
    .ref_clk(clk50),
    .user_mode_sync(user_mode_sync)
);

////////////////////////////////////////////

wire clk320;
wire sp_locked;

alt_e40_sys_pll_siv sp (
	.areset(~user_mode_sync),
	.inclk0(clk50),
	.c0(clk320),
	.locked(sp_locked)
);

assign arst = ~sp_locked | ~cpu_resetn;

////////////////////////////////////////////
// 40G E w/ 4x10 serial links
//////////////////////////////////////

wire [15:0] status_addr;
wire status_read,status_write,status_readdata_valid_e40;
wire [31:0] status_readdata_e40, status_writedata;
wire clk_status = clk50;

// input domain (from user logic toward pins)
wire clk_txmac = clk320;	 // nominal 312

// output domain (from pins toward user logic)
wire clk_rxmac = clk320;			// nominal 312
wire [WORDS*64-1:0] dout_d;		// 2 word out stream, regular left to right
wire [WORDS*8-1:0] dout_c;
wire [WORDS-1:0] dout_first_data;
wire [WORDS*8-1:0] dout_last_data;
wire [WORDS-1:0] dout_runt_last_data;
wire [WORDS-1:0] dout_payload;
wire dout_fcs_error;
wire dout_fcs_valid;
wire dout_valid;

ENET_ENTITY_QMEGA_06072013 ior (
    .mac_rx_arst_ST(arst),
    .pcs_rx_arst_ST(arst),
    .pma_arst_ST(arst),

    // serdes
    .clk_ref(clk_ref_r),  // GX PLL reference
    .rx_serial(rx_serial_r),

    // output domain (from pins toward user logic)
    .clk_rxmac(clk_rxmac),                       // nominal 312
    .dout_d(dout_d),                           // 2 word out stream, regular left to right
    .dout_c(dout_c),
    .dout_first_data(dout_first_data),         // first data byte after preamble
    .dout_last_data(dout_last_data),           // last data byte before FCS
    .dout_runt_last_data(dout_runt_last_data), // last data of a packet < 64 bytes
    .dout_payload(dout_payload),               // user data, not control
    .dout_fcs_error(dout_fcs_error),           // referring to nonzero last data
    .dout_fcs_valid(dout_fcs_valid),
    .dout_dst_addr_match(),	                   // on first word, DST matches a table entry
    .dout_valid(dout_valid),                   // bus has valid info from PCS

    // status register bus
    .clk_status(clk_status),
    .status_addr(status_addr),
    .status_read(status_read),
    .status_write(status_write),
    .status_writedata(status_writedata),
    .status_readdata(status_readdata_e40),
    .status_readdata_valid(status_readdata_valid_e40)

);
//defparam ior.gen_40_inst.phy.phy_pcs.FAST_SIMULATION = FAST_SIMULATION;
//defparam ior.gen_40_inst.phy.pma.SIM_FAST_RESET = FAST_SIMULATION;

///////////////////////////////////
// generate and check some simple data transfers
///////////////////////////////////

wire [31:0] status_readdata_pc;
wire status_readdata_valid_pc;

alt_e40_packet_client pc (
	.arst(arst),
	
	// TX to Ethernet
	.clk_tx(clk_txmac),
	.tx_ack(),
	.tx_data(),
	.tx_start(),
	.tx_end_pos(),
	
	// RX from Ethernet
	.clk_rx(clk_rxmac),
	.rx_valid(dout_valid),
	.rx_data(dout_d),
	.rx_start(dout_first_data),
	.rx_end_pos(dout_last_data),
	
	// status register bus
	.clk_status(clk_status),
	.status_addr(status_addr),
	.status_read(status_read),
	.status_write(status_write),
	.status_writedata(status_writedata),
	.status_readdata(status_readdata_pc),
	.status_readdata_valid(status_readdata_valid_pc)
);
defparam pc .SIM_NO_TEMP_SENSE  = SIM_NO_TEMP_SENSE;
defparam pc .DEVICE_FAMILY = "Stratix IV";
defparam pc .WORDS = 2;

//////////////////////////////////////
// CFP control
//////////////////////////////////////

wire [31:0] status_readdata_cfp;
wire status_readdata_valid_cfp;
wire cfp_mdio_out, cfp_mdio_oe;
assign cfp_mdio = cfp_mdio_oe ? cfp_mdio_out : 1'bz;

wire xfp_sda_out, xfp_sda_oe;
wire xfp_scl_out, xfp_scl_oe;
assign xfp_scl = xfp_scl_oe ? xfp_scl_out : 1'bz;
assign xfp_sda = xfp_sda_oe ? xfp_sda_out : 1'bz;
wire xfp_scl_in, xfp_sda_in;
assign xfp_scl_in = xfp_scl;
assign xfp_sda_in = xfp_sda;

alt_e40_optics_control cc (

	// status register bus
	.clk_status(clk_status),
	.status_addr(status_addr),
	.status_read(status_read),
	.status_write(status_write),
	.status_writedata(status_writedata),
	.status_readdata(status_readdata_cfp),
	.status_readdata_valid(status_readdata_valid_cfp),	
	
	// CFP MDIO controls
	.cfp_mdc(cfp_mdc),
	.cfp_mdio_in(cfp_mdio),
	.cfp_mdio_out(cfp_mdio_out),
	.cfp_mdio_oe(cfp_mdio_oe), // active high
	.cfp_glb_alrm(cfp_glb_alrm),
	.cfp_prtadr(cfp_prtadr),	
	
	// CFP custom controls
	.cfp_mod_lopwr(cfp_mod_lopwr),
	.cfp_mod_rst(cfp_mod_rst), // active low
	.cfp_tx_dis(cfp_tx_dis),
	.cfp_mod_abs(cfp_mod_abs),
	.cfp_rx_los(cfp_rx_los),
	.cfp_prg_alrm(cfp_prg_alrm),
	.cfp_prg_cntl(cfp_prg_cntl),
	
	// XFP I2C controls
	.xfp_sda_in(xfp_sda_in),
	.xfp_sda_out(xfp_sda_out),
	.xfp_sda_oe(xfp_sda_oe),	// active high
	.xfp_scl_in(xfp_scl_in),
	.xfp_scl_out(xfp_scl_out),
	.xfp_scl_oe(xfp_scl_oe)	// active high
);

//////////////////////////////////////
// merge status bus
//////////////////////////////////////

wire [31:0] status_readdata;
wire status_readdata_valid, status_waitrequest;

alt_e40_avalon_mm_read_combine arc (
	.clk(clk_status),
	.host_read(status_read),
	.host_readdata(status_readdata),
	.host_readdata_valid(status_readdata_valid),
	.host_waitrequest(status_waitrequest),

	.client_readdata_valid(
		{status_readdata_valid_cfp, 
		status_readdata_valid_e40,
		status_readdata_valid_pc}),
	.client_readdata(
		{status_readdata_cfp,
		status_readdata_e40,
		status_readdata_pc})		

);
defparam arc .NUM_CLIENTS = 3;
	
//////////////////////////////////////
// JTAG host port
//////////////////////////////////////
	
generate 
if (!SIM_NO_JTAG) begin

	// TODO
	// this guy doesn't support wait yet, but it is SLOOw.
	// ... so it will wait in practice.
	
	if (TERM_STYLE_JTAG) begin
		alt_e40_jtag_term_master jm (
			.clk(clk_status),
			.arst(~user_mode_sync),
			
			.mm_addr(status_addr),
			.mm_read(status_read),
			.mm_write(status_write),
			.mm_writedata(status_writedata),
			
			.mm_readdata(status_readdata),
			.mm_readdata_valid(status_readdata_valid)
		);
	end
	else begin
		wire [31:0] av_addr;
		assign status_addr = av_addr[17:2];
		jtag_sys_console_master jsm (
			.clk(clk_status),
			.arst(~user_mode_sync),
			
			.addr(av_addr),
			.read(status_read),
			.write(status_write),
			.writedata(status_writedata),
			
			.readdata(status_readdata),
			.readdata_valid(status_readdata_valid),
			.waitreq(status_waitrequest)
		);
	end	
end 
else begin : sim

    assign status_addr = 16'b0;
    assign status_read = 1'b0;
    assign status_write = 1'b0;
    assign status_writedata = 32'b0;

end
endgenerate

////////////////////////////////////////////



endmodule