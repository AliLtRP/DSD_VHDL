// megafunction wizard: %PCI Compiler v7.1%
// GENERATION: XML

// ============================================================
// Megafunction Name(s):
// 			pci_mt32
// ============================================================
// Generated by PCI Compiler 7.1 [Altera, IP Toolbench v1.3.0 build70]
// ************************************************************
// THIS IS A WIZARD-GENERATED FILE. DO NOT EDIT THIS FILE!
// ************************************************************
// Copyright (C) 1991-2007 Altera Corporation
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


module pci_top /* synthesis altera_attribute="suppress_da_rule_internal=z100" */ (
	clk,
	rstn,
	gntn,
	idsel,
	l_adi,
	l_cbeni,
	lm_req32n,
	lm_lastn,
	lm_rdyn,
	lt_rdyn,
	lt_abortn,
	lt_discn,
	lirqn,
	framen,
	irdyn,
	devseln,
	trdyn,
	stopn,
	intan,
	reqn,
	serrn,
	l_adro,
	l_dato,
	l_beno,
	l_cmdo,
	lm_adr_ackn,
	lm_ackn,
	lm_dxfrn,
	lm_tsr,
	lt_framen,
	lt_ackn,
	lt_dxfrn,
	lt_tsr,
	cmd_reg,
	stat_reg,
	cache,
	ad,
	cben,
	par,
	perrn);


	input		clk;
	input		rstn;
	input		gntn;
	input		idsel;
	input	[31:0]	l_adi;
	input	[3:0]	l_cbeni;
	input		lm_req32n;
	input		lm_lastn;
	input		lm_rdyn;
	input		lt_rdyn;
	input		lt_abortn;
	input		lt_discn;
	input		lirqn;
	inout		framen;
	inout		irdyn;
	inout		devseln;
	inout		trdyn;
	inout		stopn;
	output		intan;
	output		reqn;
	output		serrn;
	output	[31:0]	l_adro;
	output	[31:0]	l_dato;
	output	[3:0]	l_beno;
	output	[3:0]	l_cmdo;
	output		lm_adr_ackn;
	output		lm_ackn;
	output		lm_dxfrn;
	output	[9:0]	lm_tsr;
	output		lt_framen;
	output		lt_ackn;
	output		lt_dxfrn;
	output	[11:0]	lt_tsr;
	output	[6:0]	cmd_reg;
	output	[6:0]	stat_reg;
	output	[7:0]	cache;
	inout	[31:0]	ad;
	inout	[3:0]	cben;
	inout		par;
	inout		perrn;


	pci_mt32	pci_mt32_inst(
		.clk(clk),
		.rstn(rstn),
		.gntn(gntn),
		.idsel(idsel),
		.l_adi(l_adi),
		.l_cbeni(l_cbeni),
		.lm_req32n(lm_req32n),
		.lm_lastn(lm_lastn),
		.lm_rdyn(lm_rdyn),
		.lt_rdyn(lt_rdyn),
		.lt_abortn(lt_abortn),
		.lt_discn(lt_discn),
		.lirqn(lirqn),
		.framen_in(framen),
		.irdyn_in(irdyn),
		.devseln_in(devseln),
		.trdyn_in(trdyn),
		.stopn_in(stopn),
		.intan(intan),
		.reqn(reqn),
		.serrn(serrn),
		.l_adro(l_adro),
		.l_dato(l_dato),
		.l_beno(l_beno),
		.l_cmdo(l_cmdo),
		.lm_adr_ackn(lm_adr_ackn),
		.lm_ackn(lm_ackn),
		.lm_dxfrn(lm_dxfrn),
		.lm_tsr(lm_tsr),
		.lt_framen(lt_framen),
		.lt_ackn(lt_ackn),
		.lt_dxfrn(lt_dxfrn),
		.lt_tsr(lt_tsr),
		.cmd_reg(cmd_reg),
		.stat_reg(stat_reg),
		.cache(cache),
		.framen_out(framen),
		.irdyn_out(irdyn),
		.devseln_out(devseln),
		.trdyn_out(trdyn),
		.stopn_out(stopn),
		.ad(ad),
		.cben(cben),
		.par(par),
		.perrn(perrn));

	defparam
		pci_mt32_inst.CLASS_CODE = 24'hff0000,
		pci_mt32_inst.DEVICE_ID = 16'h0004,
		pci_mt32_inst.REVISION_ID = 8'h01,
		pci_mt32_inst.SUBSYSTEM_ID = 16'h0000,
		pci_mt32_inst.SUBSYSTEM_VENDOR_ID = 16'h0000,
		pci_mt32_inst.TARGET_DEVICE = "NEW",
		pci_mt32_inst.VENDOR_ID = 16'h1172,
		pci_mt32_inst.MIN_GRANT = 8'h00,
		pci_mt32_inst.MAX_LATENCY = 8'h00,
		pci_mt32_inst.CAP_PTR = 8'h40,
		pci_mt32_inst.CIS_PTR = 32'h00000000,
		pci_mt32_inst.BAR0 = 32'hfffffc00,
		pci_mt32_inst.BAR1 = 32'hfffffff1,
		pci_mt32_inst.BAR2 = 32'hfffffc00,
		pci_mt32_inst.BAR3 = 32'hfff00000,
		pci_mt32_inst.BAR4 = 32'hfff00000,
		pci_mt32_inst.BAR5 = 32'hfff00000,
		pci_mt32_inst.NUMBER_OF_BARS = 32'h00000003,
		pci_mt32_inst.HARDWIRE_BAR0 = 32'h00000000,
		pci_mt32_inst.HARDWIRE_BAR1 = 32'h00000000,
		pci_mt32_inst.HARDWIRE_BAR2 = 32'h00000000,
		pci_mt32_inst.HARDWIRE_BAR3 = 32'h00000000,
		pci_mt32_inst.HARDWIRE_BAR4 = 32'h00000000,
		pci_mt32_inst.HARDWIRE_BAR5 = 32'h00000000,
		pci_mt32_inst.HARDWIRE_EXP_ROM = 32'h00000001,
		pci_mt32_inst.EXP_ROM_BAR = 32'hfff00000,
		pci_mt32_inst.PCI_66MHZ_CAPABLE = "YES",
		pci_mt32_inst.INTERRUPT_PIN_REG = 8'h01,
		pci_mt32_inst.ENABLE_BITS = 32'h00000000;
endmodule

// =========================================================
// PCI Compiler Wizard Data
// ===============================
// DO NOT EDIT FOLLOWING DATA
// @Altera, IP Toolbench@
// Warning: If you modify this section, PCI Compiler Wizard may not be able to reproduce your chosen configuration.
// 
// Retrieval info: <?xml version="1.0"?>
// Retrieval info: <MEGACORE title="PCI Compiler"  version="7.1"  build="IB001"  iptb_version="v1.3.0 build70"  format_version="120" >
// Retrieval info:  <NETLIST_SECTION active_core="pci_mt32" >
// Retrieval info:   <STATIC_SECTION>
// Retrieval info:    <PRIVATES>
// Retrieval info:     <NAMESPACE name = "simgen_enable">
// Retrieval info:      <PRIVATE name = "enabled" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "language" value="Verilog HDL"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "parameterization">
// Retrieval info:      <PRIVATE name = "MEGA_CORE_VAL" value="PCI_MT32"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "devicefamily" value="Stratix"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "TECHNOLOGY_VAL" value="PCI"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "PCIMHZ" value="1"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "VENDOR" value="0x1172"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "DEVICE" value="0x0004"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "REVISION" value="0x01"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "SUBSYSTEM_VENDOR" value="0x0000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "SUBSYSTEM" value="0x0000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "MINIMUM_GRANT" value="0x00"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "MAXIMUM_LATENCY" value="0x00"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "CLASS_CODE_1" value="0xFF"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "CLASS_CODE_2" value="0x00"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "CLASS_CODE_3" value="0x00"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "NUMBER_OF_32_BIT_BARS" value="3"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "MAX_64_BAR_RW_BITS" value="8"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR0AND1_TYPE" value="MEMORY"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR1AND2_TYPE" value="MEMORY"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR0AND1_RESERVED" value="32"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR1AND2_RESERVED" value="32"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR0_TYPE" value="MEMORY"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR0_RESERVED" value="10"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR1_TYPE" value="IO"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR1_RESERVED" value="4"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR2_TYPE" value="MEMORY"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR2_RESERVED" value="10"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR3_TYPE" value="MEMORY"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR3_RESERVED" value="20"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR4_TYPE" value="MEMORY"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR4_RESERVED" value="20"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR5_TYPE" value="MEMORY"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR5_RESERVED" value="20"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "EXP_BAR_RESERVED" value="20"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR0_BYTES" value="1 KBytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR1_BYTES" value="16 Bytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR2_BYTES" value="1 KBytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR3_BYTES" value="1 MBytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR4_BYTES" value="1 MBytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR5_BYTES" value="1 MBytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "EXP_BYTES" value="1MBytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR0BAR1_BYTES" value="4 GBytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR1BAR2_BYTES" value="4 GBytes"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR0_ENA" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR0" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR1_ENA" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR1" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR2_ENA" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR2" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR3_ENA" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR3" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR4_ENA" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR4" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR5_ENA" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_BAR5" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "EXP_ROM" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "HWIRE_ROM" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "HW_ROM_BAR" value="0x00000001"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "HAS_64_BIT_BAR" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "BAR2_64_BIT_BAR" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "CAP_LIST" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "CAP_POINTER" value="0x40"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "ARBITER" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "INTERRUPT" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "INTERRUPT_REGISTER" value="1"  type="INTEGER"  enable="1" />
// Retrieval info:      <PRIVATE name = "CIS_LIST" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "CIS_POINTER" value="0x00000000"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "MSTR_ENA_ON_POWERUP" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "DISABLE_MLT" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "BIT_64_ONLY_SYSTEM" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:      <PRIVATE name = "MSTR_BYTE_ENA" value="0"  type="BOOLEAN"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "simgen">
// Retrieval info:      <PRIVATE name = "filename" value="pci_top.vo"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "settings">
// Retrieval info:      <PRIVATE name = "DEVICE" value="EP2SGX60EF1152C3"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "FAMILY" value="Stratix II GX"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "quartus_settings">
// Retrieval info:      <PRIVATE name = "DEVICE" value="EP2SGX60EF1152C3"  type="STRING"  enable="1" />
// Retrieval info:      <PRIVATE name = "FAMILY" value="Stratix II GX"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:     <NAMESPACE name = "serializer"/>
// Retrieval info:     <NAMESPACE name = "alterppf">
// Retrieval info:      <PRIVATE name = "specify_username" value="1"  type="STRING"  enable="1" />
// Retrieval info:     </NAMESPACE>
// Retrieval info:    </PRIVATES>
// Retrieval info:    <FILES/>
// Retrieval info:    <CONSTANTS>
// Retrieval info:     <CONSTANT name = "CLASS_CODE" value="FF0000"  type="HDL_VECTOR"  radix="HEX"  width="24"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "DEVICE_ID" value="0004"  type="HDL_VECTOR"  radix="HEX"  width="16"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "REVISION_ID" value="01"  type="HDL_VECTOR"  radix="HEX"  width="8"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SUBSYSTEM_ID" value="0000"  type="HDL_VECTOR"  radix="HEX"  width="16"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "SUBSYSTEM_VENDOR_ID" value="0000"  type="HDL_VECTOR"  radix="HEX"  width="16"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "TARGET_DEVICE" value="NEW"  type="STRING" />
// Retrieval info:     <CONSTANT name = "VENDOR_ID" value="1172"  type="HDL_VECTOR"  radix="HEX"  width="16"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "MIN_GRANT" value="00"  type="HDL_VECTOR"  radix="HEX"  width="8"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "MAX_LATENCY" value="00"  type="HDL_VECTOR"  radix="HEX"  width="8"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "CAP_PTR" value="40"  type="HDL_VECTOR"  radix="HEX"  width="8"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "CIS_PTR" value="00000000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "BAR0" value="FFFFFC00"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "BAR1" value="FFFFFFF1"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "BAR2" value="FFFFFC00"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "BAR3" value="FFF00000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "BAR4" value="FFF00000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "BAR5" value="FFF00000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "NUMBER_OF_BARS" value="3"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "HARDWIRE_BAR0" value="00000000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "HARDWIRE_BAR1" value="00000000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "HARDWIRE_BAR2" value="00000000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "HARDWIRE_BAR3" value="00000000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "HARDWIRE_BAR4" value="00000000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "HARDWIRE_BAR5" value="00000000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "HARDWIRE_EXP_ROM" value="00000001"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "EXP_ROM_BAR" value="FFF00000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "PCI_66MHZ_CAPABLE" value="YES"  type="STRING" />
// Retrieval info:     <CONSTANT name = "INTERRUPT_PIN_REG" value="1"  type="HDL_VECTOR"  radix="HEX"  width="8"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:     <CONSTANT name = "ENABLE_BITS" value="00000000"  type="HDL_VECTOR"  radix="HEX"  width="32"  vhdl_type="STD_LOGIC_VECTOR" />
// Retrieval info:    </CONSTANTS>
// Retrieval info:    <PORTS>
// Retrieval info:     <PORT name = "clk" direction="INPUT"  connect_to="clk"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "rstn" direction="INPUT"  connect_to="rstn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "gntn" direction="INPUT"  connect_to="gntn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "idsel" direction="INPUT"  connect_to="idsel"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "l_adi" direction="INPUT"  connect_to="l_adi"  default="NODEFVAL"  high_width="31"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "l_cbeni" direction="INPUT"  connect_to="l_cbeni"  default="NODEFVAL"  high_width="3"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "lm_req32n" direction="INPUT"  connect_to="lm_req32n"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lm_lastn" direction="INPUT"  connect_to="lm_lastn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lm_rdyn" direction="INPUT"  connect_to="lm_rdyn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lt_rdyn" direction="INPUT"  connect_to="lt_rdyn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lt_abortn" direction="INPUT"  connect_to="lt_abortn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lt_discn" direction="INPUT"  connect_to="lt_discn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lirqn" direction="INPUT"  connect_to="lirqn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "intan" direction="OUTPUT"  connect_to="intan"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "reqn" direction="OUTPUT"  connect_to="reqn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "serrn" direction="OUTPUT"  connect_to="serrn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "l_adro" direction="OUTPUT"  connect_to="l_adro"  default="NODEFVAL"  high_width="31"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "l_dato" direction="OUTPUT"  connect_to="l_dato"  default="NODEFVAL"  high_width="31"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "l_beno" direction="OUTPUT"  connect_to="l_beno"  default="NODEFVAL"  high_width="3"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "l_cmdo" direction="OUTPUT"  connect_to="l_cmdo"  default="NODEFVAL"  high_width="3"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "lm_adr_ackn" direction="OUTPUT"  connect_to="lm_adr_ackn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lm_ackn" direction="OUTPUT"  connect_to="lm_ackn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lm_dxfrn" direction="OUTPUT"  connect_to="lm_dxfrn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lm_tsr" direction="OUTPUT"  connect_to="lm_tsr"  default="NODEFVAL"  high_width="9"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "lt_framen" direction="OUTPUT"  connect_to="lt_framen"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lt_ackn" direction="OUTPUT"  connect_to="lt_ackn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lt_dxfrn" direction="OUTPUT"  connect_to="lt_dxfrn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "lt_tsr" direction="OUTPUT"  connect_to="lt_tsr"  default="NODEFVAL"  high_width="11"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "cmd_reg" direction="OUTPUT"  connect_to="cmd_reg"  default="NODEFVAL"  high_width="6"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "stat_reg" direction="OUTPUT"  connect_to="stat_reg"  default="NODEFVAL"  high_width="6"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "cache" direction="OUTPUT"  connect_to="cache"  default="NODEFVAL"  high_width="7"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "ad" direction="BIDIR"  connect_to="ad"  default="NODEFVAL"  high_width="31"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "cben" direction="BIDIR"  connect_to="cben"  default="NODEFVAL"  high_width="3"  low_width="0"  description="" />
// Retrieval info:     <PORT name = "par" direction="BIDIR"  connect_to="par"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "perrn" direction="BIDIR"  connect_to="perrn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "framen_in" direction="INPUT"  connect_to="framen"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "irdyn_in" direction="INPUT"  connect_to="irdyn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "devseln_in" direction="INPUT"  connect_to="devseln"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "trdyn_in" direction="INPUT"  connect_to="trdyn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "stopn_in" direction="INPUT"  connect_to="stopn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "framen_out" direction="OUTPUT"  connect_to="framen"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "irdyn_out" direction="OUTPUT"  connect_to="irdyn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "devseln_out" direction="OUTPUT"  connect_to="devseln"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "trdyn_out" direction="OUTPUT"  connect_to="trdyn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:     <PORT name = "stopn_out" direction="OUTPUT"  connect_to="stopn"  default="NODEFVAL"  width="1"  description="" />
// Retrieval info:    </PORTS>
// Retrieval info:    <LIBRARIES/>
// Retrieval info:   </STATIC_SECTION>
// Retrieval info:  </NETLIST_SECTION>
// Retrieval info: </MEGACORE>
// =========================================================
