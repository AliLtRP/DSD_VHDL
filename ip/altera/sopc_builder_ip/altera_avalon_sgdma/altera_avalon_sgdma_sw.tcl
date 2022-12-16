#
# altera_avalon_sgdma_sw.tcl
#

# Create a new driver
create_driver altera_avalon_sgdma_driver

# Associate it with some hardware known as "altera_avalon_sgdma"
set_sw_property hw_class_name altera_avalon_sgdma

# The version of this driver
set_sw_property version 13.1

# This driver may be incompatible with versions of hardware less
# than specified below. Updates to hardware and device drivers
# rendering the driver incompatible with older versions of
# hardware are noted with this property assignment.
set_sw_property min_compatible_hw_version 11.0

# Initialize the driver in alt_sys_init()
set_sw_property auto_initialize true

# Location in generated BSP that above sources will be copied into
set_sw_property bsp_subdirectory drivers

# Interrupt properties: This driver supports both legacy and enhanced
# interrupt APIs, as well as ISR preemption.
set_sw_property isr_preemption_supported true
set_sw_property supported_interrupt_apis "legacy_interrupt_api enhanced_interrupt_api"

#
# Source file listings...
#

# C/C++ source files
add_sw_property c_source HAL/src/altera_avalon_sgdma.c

# Include files
add_sw_property include_source HAL/inc/altera_avalon_sgdma.h
add_sw_property include_source HAL/inc/altera_avalon_sgdma_descriptor.h
add_sw_property include_source inc/altera_avalon_sgdma_regs.h

# This driver supports HAL & UCOSII BSP (OS) types
add_sw_property supported_bsp_type HAL
add_sw_property supported_bsp_type UCOSII

# End of file
