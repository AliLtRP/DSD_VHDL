# (C) 2001-2013 Altera Corporation. All rights reserved.
# Your use of Altera Corporation's design tools, logic functions and other 
# software and tools, and its AMPP partner logic functions, and any output 
# files any of the foregoing (including device programming or simulation 
# files), and any associated documentation or information are expressly subject 
# to the terms and conditions of the Altera Program License Subscription 
# Agreement, Altera MegaCore Function License Agreement, or other applicable 
# license agreement, including, without limitation, that your use is for the 
# sole purpose of programming logic devices manufactured by Altera and sold by 
# Altera or its authorized distributors.  Please refer to the applicable 
# agreement for further details.


# TCL File Generated by Component Editor 11.0
# Mon Jun 06 16:54:58 PDT 2011
# DO NOT MODIFY


# +-----------------------------------
# | 
# | alt_xcvr_reconfig_cpu_ram_if "alt_xcvr_reconfig_cpu_ram_if" v11.0
# | Jakob Jones 2011.06.06.16:54:58
# | Interface to external memory for alt_xcvr_reconfig_cpu
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 11.0
# | 
package require -exact sopc 11.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module alt_xcvr_reconfig_cpu_ram_if
# | 
set_module_property DESCRIPTION "Interface to external memory for alt_xcvr_reconfig_cpu"
set_module_property NAME alt_xcvr_reconfig_cpu_ram_if
set_module_property VERSION 11.0
set_module_property INTERNAL true
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP "Transceiver Reconfiguration Components"
set_module_property AUTHOR "Altera Corporation"
set_module_property DISPLAY_NAME alt_xcvr_reconfig_cpu_ram_if
set_module_property TOP_LEVEL_HDL_MODULE ""
set_module_property INSTANTIATE_IN_SYSTEM_MODULE false
set_module_property EDITABLE true
set_module_property ANALYZE_HDL AUTO
set_module_property STATIC_TOP_LEVEL_MODULE_NAME ""
set_module_property FIX_110_VIP_PATH false
# | 
# +-----------------------------------

# +-----------------------------------
# | files
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | parameters
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | display items
# | 
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point mem
# | 
add_interface mem avalon end
set_interface_property mem addressUnits WORDS
set_interface_property mem associatedClock clock
set_interface_property mem associatedReset reset
set_interface_property mem bitsPerSymbol 8
set_interface_property mem burstOnBurstBoundariesOnly false
set_interface_property mem burstcountUnits WORDS
set_interface_property mem explicitAddressSpan 0
set_interface_property mem holdTime 0
set_interface_property mem linewrapBursts false
set_interface_property mem maximumPendingReadTransactions 0
set_interface_property mem readLatency 1
set_interface_property mem readWaitStates 0
set_interface_property mem readWaitTime 0
set_interface_property mem setupTime 0
set_interface_property mem timingUnits Cycles
set_interface_property mem writeWaitTime 0

set_interface_assignment mem embeddedsw.configuration.isMemoryDevice 1
#set_interface_assignment mem embeddedsw.CMacro.ALLOW_MRAM_SIM_CONTENTS_ONLY_FILE 0
#set_interface_assignment mem embeddedsw.CMacro.INIT_CONTENTS_FILE "alt_xcvr_reconfig_cpu_ram"
#set_interface_assignment mem embeddedsw.CMacro.NON_DEFAULT_INIT_FILE_ENABLED 0
#set_interface_assignment mem embeddedsw.CMacro.RAM_BLOCK_TYPE "Auto"
set_module_assignment embeddedsw.memoryInfo.MEM_INIT_DATA_WIDTH 32
set_module_assignment embeddedsw.memoryInfo.HAS_BYTE_LANE 0
set_module_assignment embeddedsw.memoryInfo.GENERATE_HEX 1 
set_module_assignment embeddedsw.memoryInfo.HEX_INSTALL_DIR QPF_DIR
set_module_assignment embeddedsw.memoryInfo.GENERATE_DAT_SYM 1 
set_module_assignment embeddedsw.memoryInfo.DAT_SYM_INSTALL_DIR SIM_DIR
set_module_assignment embeddedsw.memoryInfo.MEM_INIT_FILENAME alt_xcvr_reconfig_cpu_ram

set_interface_property mem ENABLED true

add_interface_port mem cpu_mem_address address Input 10
add_interface_port mem cpu_mem_read read Input 1
add_interface_port mem cpu_mem_readdata readdata Output 32
add_interface_port mem cpu_mem_write write Input 1
add_interface_port mem cpu_mem_writedata writedata Input 32
add_interface_port mem cpu_mem_byteenable byteenable Input 4
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point clock
# | 
add_interface clock clock end
set_interface_property clock clockRate 0

set_interface_property clock ENABLED true

add_interface_port clock clk clk Input 1
# | 
# +-----------------------------------

# +-----------------------------------
# | connection point reset
# | 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT

set_interface_property reset ENABLED true

add_interface_port reset reset reset Input 1
# adding reset_req port to the reset interface
add_interface_port reset reset_req reset_req Input 1
# | 
# +-----------------------------------