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
# Mon Jul 25 14:34:07 BST 2011
# DO NOT MODIFY


# +-----------------------------------
# | 
# | altera_trace_av_st_tap "altera_trace_video_tap_bridge" v1.0
# | null 2011.07.25.14:34:07
# | 
# | 
# |    ./altera_trace_av_st_tap.v syn, sim
# | 
# +-----------------------------------

# +-----------------------------------
# | request TCL package from ACDS 11.0
# | 
package require -exact sopc 11.0
# | 
# +-----------------------------------

# +-----------------------------------
# | module altera_trace_av_st_tap
# | 
set_module_property NAME                         altera_trace_video_tap_bridge
set_module_property VERSION                      13.1
set_module_property AUTHOR                       "Altera Corporation"
set_module_property INTERNAL                     true
set_module_property OPAQUE_ADDRESS_MAP           true
set_module_property DISPLAY_NAME                 "bridge for av st tap"
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property GROUP                        "Verification/Debug & Performance/Trace"
set_module_property EDITABLE                     true
set_module_property ANALYZE_HDL                  false
set_module_property ELABORATION_CALLBACK         elaborate
set_module_property VALIDATION_CALLBACK          validate

set_module_assignment debug.isTransparent 1
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

proc proc_add_parameter {NAME TYPE DEFAULT IS_HDL VISIBLE AFFECTS_GENERATION GROUP DISP_NAME DESCRIPTION  args} {
    add_parameter           $NAME $TYPE $DEFAULT $DESCRIPTION
    if {$args != ""} then {
        set_parameter_property  $NAME "ALLOWED_RANGES" $args
    }
    set_parameter_property  $NAME "VISIBLE"            $VISIBLE
    set_parameter_property  $NAME "HDL_PARAMETER"      $IS_HDL
    set_parameter_property  $NAME "GROUP"              $GROUP
    set_parameter_property  $NAME "DISPLAY_NAME"       $DISP_NAME
    set_parameter_property  $NAME "AFFECTS_GENERATION" $AFFECTS_GENERATION
}

#                    name                      type   def_value   is_hdl   VISIBLE  Affects     group     display name             Tooltip hint                    args_range
#                                                                                   generation
proc_add_parameter  MON_SYM_WIDTH             INTEGER       8      false    true      true         ""       "Symbol Width"     ""
proc_add_parameter  MON_DATA_WIDTH            INTEGER      32      false    true      true         ""       "Data Width"       ""
proc_add_parameter  MON_CHANNEL_WIDTH         INTEGER       0      false    true      true         ""       "Channel Width"    ""
proc_add_parameter  MON_ERR_WIDTH             INTEGER       0      false    true      true         ""       "Error Width"    ""
proc_add_parameter  MON_USES_READY            boolean       true   false    true      true         ""       "uses ready"    ""
proc_add_parameter  MON_USES_PACKETS          boolean       true   false    true      true         ""       "uses packets"    ""
proc_add_parameter  MON_EMPTY_WIDTH           INTEGER       2      false    true      true         ""       "Empty Width"    "NOTE: empty is conditional on using packet signals"
# empty width could be derived but leaving it enabled

proc_add_parameter  MON_READY_LATENCY        integer       0       false    true      true         ""       "Ready latency of the monitored interface ...  this only affects the timing of ready for th RL0 tap port!"    ""
proc_add_parameter  MON_MAX_CHANNEL          integer       0       false    true      true         ""       "Max channel"    ""
# | 
# +-----------------------------------



# +-----------------------------------
# | connection point clk
# | 
add_interface          clk clock     end
set_interface_property clk clockRate 0
set_interface_property clk ENABLED   true

add_interface_port clk clk clk Input 1
# | 
# +-----------------------------------


# +-----------------------------------
# | connection point reset
# | 
add_interface          reset reset end
set_interface_property reset associatedClock  clk
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED          true

add_interface_port reset arst_n reset_n Input 1
# | 
# +-----------------------------------


# +-----------------------------------
# | connection point din
# | 
add_interface          din conduit end
set_interface_property din ENABLED true
# | 
# +-----------------------------------


# +-----------------------------------
# | connection point doutX
# | 
add_interface          dout0 conduit end
set_interface_property dout0 ENABLED true
add_interface          dout1 conduit end
set_interface_property dout1 ENABLED true
# | 
# +-----------------------------------


add_interface_port din    din_valid    valid Input  1
add_interface_port dout0  dout0_valid  valid Output 1
add_interface_port dout1  dout1_valid  valid Output 1
set_port_property         dout0_valid  DRIVEN_BY din_valid
set_port_property         dout1_valid  DRIVEN_BY din_valid

add_interface_port din    din_data    data  Input  MON_DATA_WIDTH
add_interface_port dout0  dout0_data  data  Output MON_DATA_WIDTH
add_interface_port dout1  dout1_data  data  Output MON_DATA_WIDTH
set_port_property         dout0_data  DRIVEN_BY din_data
set_port_property         dout1_data  DRIVEN_BY din_data


proc validate { } {
    set use_packets [get_parameter_value MON_USES_PACKETS]

	if {$use_packets} {
		set_parameter_property  MON_EMPTY_WIDTH ENABLED true	
	} else {
		set_parameter_property  MON_EMPTY_WIDTH ENABLED false		
	}
}


proc elaborate {} {
    set use_ready   [get_parameter_value MON_USES_READY]    
    set use_packets [get_parameter_value MON_USES_PACKETS]
    set ch_width    [get_parameter_value MON_CHANNEL_WIDTH]
    set mty_width   [get_parameter_value MON_EMPTY_WIDTH]   
    set err_width   [get_parameter_value MON_ERR_WIDTH]


    if {$use_ready} {   
        add_interface_port din   din_ready   ready Input  1
        add_interface_port dout0 dout0_ready ready Output 1
        add_interface_port dout1 dout1_ready ready Output 1
        set_port_property        dout0_ready DRIVEN_BY  din_ready
        set_port_property        dout1_ready DRIVEN_BY  din_ready
    }

    
    if {$use_packets} { 
        add_interface_port din   din_sop    startofpacket Input  1    
        add_interface_port dout0 dout0_sop  startofpacket Output 1
        add_interface_port dout1 dout1_sop  startofpacket Output 1
        set_port_property        dout0_sop  DRIVEN_BY din_sop    
        set_port_property        dout1_sop  DRIVEN_BY din_sop    

        add_interface_port din   din_eop    endofpacket   Input  1
        add_interface_port dout0 dout0_eop  endofpacket   Output 1     
        add_interface_port dout1 dout1_eop  endofpacket   Output 1     
        set_port_property        dout0_eop  DRIVEN_BY din_eop
        set_port_property        dout1_eop  DRIVEN_BY din_eop

        # NOTE: empty is conditional con packet signals
        if {$mty_width} {
            add_interface_port din   din_empty    empty Input  $mty_width
            add_interface_port dout0 dout0_empty  empty Output $mty_width 
            add_interface_port dout1 dout1_empty  empty Output $mty_width 
            set_port_property        dout0_empty  DRIVEN_BY din_empty      
            set_port_property        dout1_empty  DRIVEN_BY din_empty      
        }        
    }

    
    if {$ch_width} {    
        add_interface_port din   din_ch   channel Input  $ch_width
        add_interface_port dout0 dout0_ch  channel Output $ch_width
        add_interface_port dout1 dout1_ch  channel Output $ch_width
        set_port_property        dout0_ch  DRIVEN_BY din_ch         
        set_port_property        dout1_ch  DRIVEN_BY din_ch         
    }

    if {$err_width} {
        add_interface_port din   din_err   error Input  $err_width
        add_interface_port dout0 dout0_err  error Output $err_width
        add_interface_port dout1 dout1_err  error Output $err_width
        set_port_property        dout0_err  DRIVEN_BY din_err                
        set_port_property        dout1_err  DRIVEN_BY din_err                
    }
    
}
