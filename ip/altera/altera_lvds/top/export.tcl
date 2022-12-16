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


package provide altera_lvds::top::export 0.1

package require altera_lvds::top::main

namespace eval ::altera_lvds::top::export:: {
   

}


proc ::altera_lvds::top::export::inherit_top_level_parameter_defs {} {
      
   ::altera_lvds::top::main::create_parameters
   
   foreach param_name [get_parameters] {
      set_parameter_property $param_name DERIVED false
      set_parameter_property $param_name SYSTEM_INFO ""
      
      set_parameter_property $param_name ALLOWED_RANGES ""
      
      set_parameter_property $param_name HDL_PARAMETER false
   }
   return 1
}


proc ::altera_lvds::top::export::_init {} {
}

::altera_lvds::top::export::_init
