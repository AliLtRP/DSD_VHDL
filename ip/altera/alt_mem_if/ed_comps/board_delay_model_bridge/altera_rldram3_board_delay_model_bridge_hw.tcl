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


set alt_mem_if_tcl_libs_dir "$env(QUARTUS_ROOTDIR)/../ip/altera/alt_mem_if/alt_mem_if_tcl_packages"
if {[lsearch -exact $auto_path $alt_mem_if_tcl_libs_dir] == -1} {
	lappend auto_path $alt_mem_if_tcl_libs_dir
}


package require -exact qsys 12.0

package require alt_mem_if::util::messaging
package require alt_mem_if::util::profiling
package require alt_mem_if::gui::system_info
package require alt_mem_if::gen::uniphy_interfaces
package require alt_mem_if::util::hwtcl_utils
package require alt_mem_if::gui::common_rldram_mem_model
package require alt_mem_if::gui::afi
package require alt_mem_if::util::iptclgen

namespace import ::alt_mem_if::util::messaging::*



set_module_property DESCRIPTION "Altera RLDRAM3 Board Delay Model Bridge"
set_module_property NAME altera_rldram3_board_delay_model_bridge
set_module_property VERSION 13.1
::alt_mem_if::util::hwtcl_utils::set_module_internal_mode
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property GROUP [::alt_mem_if::util::hwtcl_utils::memory_phys_group_name]
set_module_property AUTHOR "Altera Corporation"
set_module_property DISPLAY_NAME "Altera RLDRAM3 Board Delay Model Bridge"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property ANALYZE_HDL TRUE
set_module_property HIDE_FROM_SOPC true

add_display_item "" "Block Diagram" GROUP


add_fileset sim_verilog SIM_VERILOG generate_verilog_sim

proc solve_core_params {} {
        set supported_ifdefs_list [list \
                "RLDRAM3" \
                "MEM_IF_DM_PINS_EN"\
        ]
		

		if {[string compare -nocase [get_parameter_value MEM_IF_DM_PINS_EN] "true"] == 0} {
			lappend core_params_list "MEM_IF_DM_PINS_EN"
		}

        
        return $core_params_list

}


proc generate_verilog_sim {name} {
        _iprint "Preparing to generate verilog simulation fileset for $name"

        set generated_file [alt_mem_if::util::iptclgen::generate_outfile_name "altera_rldram3_board_delay_model_bridge_top.sv" [solve_core_params]]
        _dprint 1 "Preparing to deploy file $generated_file"
        add_fileset_file $generated_file SYSTEM_VERILOG PATH $generated_file

}


proc create_hdl_parameters {} {

    _dprint 1 "Defining HDL parameters for altera_rldram3_board_delay_model_bridge"

	set_parameter_property MEM_IF_WRITE_DQS_WIDTH HDL_PARAMETER true
	set_parameter_property MEM_IF_DM_WIDTH HDL_PARAMETER true
	set_parameter_property MEM_IF_DQ_WIDTH HDL_PARAMETER true
	set_parameter_property MEM_IF_READ_DQS_WIDTH HDL_PARAMETER true
	set_parameter_property MEM_IF_BANKADDR_WIDTH HDL_PARAMETER true
	set_parameter_property MEM_IF_ADDR_WIDTH HDL_PARAMETER true
	set_parameter_property MEM_IF_CS_WIDTH HDL_PARAMETER true
	
	return 1

}





alt_mem_if::gui::afi::set_protocol "RLDRAM3"
alt_mem_if::gui::common_rldram_mem_model::set_rldram_mode "RLDRAM3"
alt_mem_if::gui::common_rldram_mem_model::create_parameters
alt_mem_if::gui::afi::create_parameters
alt_mem_if::gui::system_info::create_parameters

create_hdl_parameters

alt_mem_if::gui::system_info::create_gui
alt_mem_if::gui::afi::create_gui
alt_mem_if::gui::common_rldram_mem_model::create_gui
set_parameter_property RATE VISIBLE false
set_parameter_property MEM_CLK_FREQ VISIBLE false
set_parameter_property SPEED_GRADE VISIBLE false




if {[string compare -nocase [::alt_mem_if::util::hwtcl_utils::combined_callbacks] "false"] == 0} {
	set_module_property Validation_Callback ip_validate
	set_module_property elaboration_Callback ip_elaborate
} else {
	set_module_property elaboration_Callback combined_callback
}

proc combined_callback {} {
	ip_validate
	ip_elaborate
}

proc ip_validate {} {
	_dprint 1 "Running IP Validation for [get_module_property NAME]"

        alt_mem_if::gui::system_info::validate_component
        alt_mem_if::gui::common_rldram_mem_model::validate_component
        alt_mem_if::gui::afi::validate_component
}

proc create_memory_interface {type {suffix {}}} {
    
        add_interface memory_${suffix} conduit end
        set_interface_property memory_${suffix} ENABLED true
		
		set denom  1
        if {[string compare -nocase $type "output"] == 0} {
            set denom [expr [get_parameter_value MEM_IF_CS_WIDTH]]
        }
		
        add_interface_port memory_${suffix} memory_${suffix}_mem_a mem_a $type [get_parameter_value MEM_IF_ADDR_WIDTH]
        add_interface_port memory_${suffix} memory_${suffix}_mem_ba mem_ba $type [get_parameter_value MEM_IF_BANKADDR_WIDTH]
        add_interface_port memory_${suffix} memory_${suffix}_mem_ck mem_ck $type 1
        add_interface_port memory_${suffix} memory_${suffix}_mem_ck_n mem_ck_n $type 1
        add_interface_port memory_${suffix} memory_${suffix}_mem_cs_n mem_cs_n $type [expr [get_parameter_value MEM_IF_CS_WIDTH] / $denom]
		
		add_interface_port memory_${suffix} memory_${suffix}_mem_dk mem_dk $type [get_parameter_value MEM_IF_WRITE_DQS_WIDTH]
		add_interface_port memory_${suffix} memory_${suffix}_mem_dk_n mem_dk_n $type [get_parameter_value MEM_IF_WRITE_DQS_WIDTH]
		add_interface_port memory_${suffix} memory_${suffix}_mem_dm mem_dm $type [get_parameter_value MEM_IF_DM_WIDTH]
		add_interface_port memory_${suffix} memory_${suffix}_mem_dq mem_dq Bidir [get_parameter_value MEM_IF_DQ_WIDTH]
		add_interface_port memory_${suffix} memory_${suffix}_mem_ref_n mem_ref_n $type 1
		add_interface_port memory_${suffix} memory_${suffix}_mem_we_n mem_we_n $type 1
		add_interface_port memory_${suffix} memory_${suffix}_mem_reset_n mem_reset_n $type 1
}


proc ip_elaborate {} {
	_dprint 1 "Running IP Elaboration for [get_module_property NAME]"

        alt_mem_if::gui::system_info::elaborate_component
        alt_mem_if::gui::common_rldram_mem_model::elaborate_component
        alt_mem_if::gui::afi::elaborate_component


	create_memory_interface "Input" "in"
	add_interface_port memory_in memory_out_mem_qk mem_qk Output [get_parameter_value MEM_IF_READ_DQS_WIDTH]
	add_interface_port memory_in memory_out_mem_qk_n mem_qk_n Output [get_parameter_value MEM_IF_READ_DQS_WIDTH]
	set num_rank  [expr [get_parameter_value MEM_IF_CS_WIDTH]]

	for {set ii 0} {$ii < $num_rank} {incr ii} {
		create_memory_interface "Output" $ii
		add_interface_port memory_$ii memory_${ii}_mem_qk mem_qk Input [get_parameter_value MEM_IF_READ_DQS_WIDTH]
		add_interface_port memory_$ii memory_${ii}_mem_qk_n mem_qk_n Input [get_parameter_value MEM_IF_READ_DQS_WIDTH]
	}

        set_fileset_property [string tolower SIM_VERILOG] TOP_LEVEL \
            [alt_mem_if::util::iptclgen::generate_outfile_name "altera_rldram3_board_delay_model_bridge_top.sv" [solve_core_params] 1]

}
