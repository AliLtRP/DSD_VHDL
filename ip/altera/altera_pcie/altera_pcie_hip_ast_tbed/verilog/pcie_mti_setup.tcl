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


#+-----------------------------------------------------------
#| Script for MTI for Stratix V HIP for PCI Express
#+-----------------------------------------------------------
global env
set QUARTUS_ROOTDIR $env(QUARTUS_ROOTDIR)
set MSIM_AE ""

set DEBUG_MODE 0

set NOIMMEDCA ""

if [regexp {ModelSim ALTERA} [vsim -version]] {
   # Using Altera OEM Version need to add one more library mapping
   set altgxb_path $env(MODEL_TECH)\/../altera/verilog/altgxb ;
   set alt2gxb_path $env(MODEL_TECH)\/../altera/verilog/stratixiigx_hssi ;
   vmap altgxb_ver $altgxb_path ;
   vmap stratixiigx_hssi_ver $alt2gxb_path ;
   set MSIM_AE "-L altera_lnsim_ver -L altera_ver"
} else {
   # Using non-OEM Version, compile all of the libraries
   set NOIMMEDCA "-noimmedca"
   vlib lpm_ver
   vmap lpm_ver lpm_ver
   vlog -work lpm_ver $QUARTUS_ROOTDIR/eda/sim_lib/220model.v

   vlib altera_mf_ver
   vmap altera_mf_ver altera_mf_ver
   vlog -work altera_mf_ver $QUARTUS_ROOTDIR/eda/sim_lib/altera_mf.v

   vlib sgate_ver
   vmap sgate_ver sgate_ver
   vlog -work sgate_ver $QUARTUS_ROOTDIR/eda/sim_lib/sgate.v

   vlib stratixiigx_hssi_ver
   vmap stratixiigx_hssi_ver stratixiigx_hssi_ver
   vlog -work stratixiigx_hssi_ver $QUARTUS_ROOTDIR/eda/sim_lib/stratixiigx_hssi_atoms.v
   vlog -work stratixiigx_hssi_ver $QUARTUS_ROOTDIR/libraries/megafunctions/alt2gxb.v

   if [ file exists $QUARTUS_ROOTDIR/eda/sim_lib/stratixiv_hssi_atoms.v ] {

      vlib stratixiv_hssi_ver
      vmap stratixiv_hssi_ver stratixiv_hssi_ver
      vmap stratixiv_hssi stratixiv_hssi_ver
      vlog -work stratixiv_hssi $QUARTUS_ROOTDIR/eda/sim_lib/stratixiv_hssi_atoms.v

      vlib stratixiv_pcie_hip_ver
      vmap stratixiv_pcie_hip_ver stratixiv_pcie_hip_ver
      vmap stratixiv_pcie_hip stratixiv_pcie_hip_ver
      vlog -work stratixiv_pcie_hip $QUARTUS_ROOTDIR/eda/sim_lib/stratixiv_pcie_hip_atoms.v

      vlib stratixv_hssi_ver
      vmap stratixv_hssi_ver stratixv_hssi_ver
      vmap stratixv_hssi stratixv_hssi_ver
      vlog     -work stratixv_hssi $QUARTUS_ROOTDIR/eda/sim_lib/altera_primitives.v
      vlog -sv -work stratixv_hssi $QUARTUS_ROOTDIR/eda/sim_lib/stratixv_hssi_atoms.v
      vlog -sv -work stratixv_hssi $QUARTUS_ROOTDIR/eda/sim_lib/mentor/stratixv_hssi_atoms_ncrypt.v
      vlog -sv -work stratixv_hssi $QUARTUS_ROOTDIR/eda/sim_lib/altera_lnsim.sv

      vlib stratixv_pcie_hip_ver
      vmap stratixv_pcie_hip_ver stratixv_pcie_hip_ver
      vmap stratixv_pcie_hip stratixv_pcie_hip_ver
      vlog -sv -work stratixv_pcie_hip $QUARTUS_ROOTDIR/eda/sim_lib/stratixv_pcie_hip_atoms.v
      vlog -work stratixv_pcie_hip $QUARTUS_ROOTDIR/eda/sim_lib/mentor/stratixv_pcie_hip_atoms_ncrypt.v
   }
}

# Create the work library
vlib work


#+-----------------------------------------------------------
#| proc get_ver_file_list
#|
#| Reads tcl file _tb.spd generated by QSYS testbench
#| creates :
#|              - sim_file_v  : List of verilog files
#|              - sim_file_sv : List of System Verilog files
#|
#| returns name of the testbench module
#|
#+-----------------------------------------------------------
proc get_ver_file_list {} {
   set tb "TBD"

   set fp [ open [ glob  "*_tb.spd" ]  r ]
   set spd_file [ read $fp ]
   close $fp
   set spd_data [split $spd_file "\n"]
   set parse 0
   set filepath "TBD"

   # Extracting Verilog files
   set fp  [ open sim_filelist_v w ]
   set fpsv  [ open sim_filelist_sv w ]
   set sv_list [list]
   foreach line $spd_data {
      if { $parse == 1 } {
         if { [ regexp "path=" $line ]  } {
            set p [ split $line "="]
            set pp [ lindex $p [expr [ llength $p ] -1 ] ]
            set filepath [ string trim $pp \" ]
         }
         if { [ regexp "type=" $line ]  } {
            if { [ regexp "SYSTEM_VERILOG" $line ]  } {
               puts $fpsv $filepath
            } elseif {[ regexp "VERILOG" $line ]  } {
               puts $fp $filepath
            }
         }
      }
      if { [ regexp "/>" $line ] } {
         set parse 0
         set filepath "TBD"
      }
      if { [ regexp "<file" $line ]  } {
         set parse 1
      }

      if { [ regexp "<file" $line ] && [ regexp "/>" $line ] && [ regexp "VERILOG" $line ] } {
         set p [ split $line "="]
         set pp [ lindex $p 1 ]
         set p [ split $pp " "]
         set pp [ lindex $p 0 ]
         set ftb [ string trim $pp \" ]
         puts $fp $ftb
      }

      if { [ regexp "<topLevel" $line ] && [ regexp "/>" $line ]} {
         set p [ split $line "="]
         set pp [ lindex $p [expr [ llength $p ] -1 ] ]
         set p [ split $pp " "]
         set pp [ lindex $p 0 ]
         set tb [ string trim $pp \" ]
      }
   }
   close $fp
   close $fpsv

   return $tb
}

set pcie_testbench [ get_ver_file_list ]
puts "Simulating testbench $pcie_testbench"

# Now compile the Verilog files one by one
alias _comp {

set simlist [open sim_filelist_sv r]
while {[gets $simlist vfile] >= 0} {
    vlog -sv -work work $vfile
}
close $simlist

set simlist [open sim_filelist_v r]
while {[gets $simlist vfile] >= 0} {
    vlog -work work $vfile
}
close $simlist
}

_comp
# Now run the simulation
alias _vsim  {
   set NOVOPT "-novopt"
   # To enable debug
   if { $DEBUG_MODE > 0 } {
      set NOVOPT "-novopt"
   }
   eval vsim $NOIMMEDCA $NOVOPT -t ps $MSIM_AE -L altera_mf_ver -L lpm_ver -L sgate_ver -L stratixiigx_hssi_ver -L stratixiv_hssi_ver -L stratixiv_pcie_hip_ver -L stratixv_hssi_ver -L stratixv_pcie_hip_ver $pcie_testbench
}

_vsim
set NumericStdNoWarnings 1
set StdArithNoWarnings 1
onbreak { resume }

if { $DEBUG_MODE > 0 } {
# Log all nets
   log -r /*
}

run -all

