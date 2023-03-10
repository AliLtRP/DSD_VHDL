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


#######################################################
#
# Top-level Tcl script for running the DisplayPort
# MegaCore Hardware Demo
# 
# #####################################################

# Load required packages
load_package flow
load_package misc

# Regenerate the IP 
qexec "qmegawiz -silent sv_video_pll.v"
qexec "qmegawiz -silent sv_xcvr_pll.v"
qexec "qmegawiz -silent sv_aux_buffer.v"
qexec "qmegawiz -silent sv_xcvr_reconfig.v"

# Regenerate the Qsys system
qexec "ip-generate --project-directory=./  \
--output-directory=./sv_control/synthesis/ \
--file-set=QUARTUS_SYNTH \
--report-file=sopcinfo:./sv_control.sopcinfo \
--report-file=html:./sv_control.html \
--report-file=qip:./sv_control/synthesis/sv_control.qip \
--component-file=./sv_control.qsys"

# Create the project overwriting any previous settings files
project_new sv_dp_demo -overwrite

# add the assignments to the project
source assignments.tcl

# run quartus_map to generate a netlist for the DDR pin assignments
# script
execute_module -tool map 

# Close the project before running the pin assignment script
project_close

# run the DDR pin assignments script generated by Qsys
qexec "quartus_sta -t ./sv_control/synthesis/submodules/sv_control_ddr_p0_pin_assignments.tcl sv_dp_demo"

# re-open the project and do a full compile
project_open sv_dp_demo

# Compile the project
execute_flow -compile

# Clean up by closing the project
project_close
