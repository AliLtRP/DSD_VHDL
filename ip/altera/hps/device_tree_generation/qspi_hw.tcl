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


package require -exact qsys 12.0
source hps_utils.tcl

#
# module qspi
#
hps_utils_add_component_boiler_plate qspi {Cadence QSPI}
#
# file sets
#
#
# parameters
#

set_module_assignment embeddedsw.dts.compatible cadence,qspi
set_module_assignment embeddedsw.dts.group flash
set_module_assignment embeddedsw.dts.params.bus-num 2
set_module_assignment embeddedsw.dts.params.num-chipselect 4
set_module_assignment embeddedsw.dts.name qspi
set_module_assignment embeddedsw.dts.params.fifo-depth 128
set_module_assignment embeddedsw.dts.vendor cadence
# 
# display items
# 


hps_utils_add_clock_reset

#
# Interrupt sender
#
hps_utils_add_irq_sender interrupt_sender

# 
# connection point altera_axi_slave
# 
hps_utils_add_axi_slave axi_slave0 axi_sig0 12
hps_utils_add_axi_slave axi_slave1 axi_sig1 12
