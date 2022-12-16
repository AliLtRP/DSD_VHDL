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


#!/bin/bash
if [ -e $QUARTUS_ROOTDIR ]
then
   QUARTUS_ROOTDIR=$QUARTUS_ROOTDIR
else
   echo "ERROR: the env variable QUARTUS_ROOTDIR is not set"
   return -1
fi

SPD_FILE=`ls *_tb.spd`
[ -f $SPD_FILE ] || echo "Unable to locate _tb.spd file"
[ -f $SPD_FILE ] || return -1

SIMFILE_LIST='simfile_list.f'
[ -f $SIMFILE_LIST ] && rm $SIMFILE_LIST

#Adding libraries files
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/220model.v"                                >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/altera_mf.v"                               >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/sgate.v"                                   >> $SIMFILE_LIST
echo "+sv -sv $QUARTUS_ROOTDIR/eda/sim_lib/altera_lnsim.sv"                       >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/stratixiigx_hssi_atoms.v"                  >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/libraries/megafunctions/alt2gxb.v"                     >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/stratixiv_hssi_atoms.v"                    >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/stratixiv_pcie_hip_atoms.v"                >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/altera_primitives.v"                       >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/stratixv_hssi_atoms.v"                     >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/stratixv_pcie_hip_atoms.v"                 >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/cadence/stratixv_hssi_atoms_ncrypt.v"     >> $SIMFILE_LIST
echo "-v $QUARTUS_ROOTDIR/eda/sim_lib/cadence/stratixv_pcie_hip_atoms_ncrypt.v" >> $SIMFILE_LIST

# Parsing SPD file
LINES=`cat $SPD_FILE`
PARSE_TB_TOP_LEVEL=0
TB_TOP_LEVEL='TB_TOP_LEVEL'
PARSE_FILE=0
TYPE_FILE=''
PATH_FILE=''
echo "Creating $SIMFILE_LIST, parsing $SPD_FILE"
for i in $LINES
do
   # Extracting testbench
   if [ $PARSE_TB_TOP_LEVEL == 1 ]
   then
      PARSE_TB_TOP_LEVEL=0
      TB_TOP_LEVEL=`echo $i |sed "s/name=//"|sed "s/\"//g"`
   fi
   if [ `echo $i | grep -c "\<topLevel"` == 1 ]
   then
      PARSE_TB_TOP_LEVEL=1
   fi

   # Parsing Files
   if [ $PARSE_FILE == 1 ]
   then
      if [ `echo $i | grep -c "type\="` == 1 ]
      then
         TYPE_FILE=`echo $i |sed "s/type=//"|sed "s/\"//g"`
      fi
      if [ `echo $i | grep -c "path\="` == 1 ]
      then
         PATH_FILE=`echo $i |sed "s/path=//"|sed "s/\"//g"`
      fi
      if [ `echo $i | grep -c "\/>"` == 1 ] && [ `cat $SIMFILE_LIST | grep -c $PATH_FILE` == 0 ]
      then
         PARSE_FILE=0
         LIB_FILE=''
         if [ `echo $PATH_FILE | grep -c "altpcietb_"` == 1 ]
         then
            LIB_FILE='-v '
         elif [ `echo $PATH_FILE | grep -c "_bfm_"` == 1 ]
         then
            LIB_FILE='-v '
         elif [ `echo $PATH_FILE | grep -c "_atoms"` == 1 ]
         then
            LIB_FILE='-v '
         elif [ `echo $PATH_FILE | grep -c "altera_wait_generate"` == 1 ]
         then
            LIB_FILE='-v '
         fi
         if [ "$TYPE_FILE" == "VERILOG" ]
         then
            echo "$LIB_FILE$PATH_FILE" >> $SIMFILE_LIST
         fi
         if [ "$TYPE_FILE" == "SYSTEM_VERILOG" ]
         then
            echo "+sv -sv $PATH_FILE" >> $SIMFILE_LIST
         fi
      fi
   fi
   if [ `echo $i | grep -c "\<file"` == 1 ]
   then
      PARSE_FILE=1
   fi
done

# Run VCS
NCSIM_RUN="ncverilog -ALLOWREDEFINITION +DEFINE+VCS -f $SIMFILE_LIST -l transcript"
echo $NCSIM_RUN
echo $NCSIM_RUN > rerun_pcie_ncsim.sh
chmod +x rerun_pcie_ncsim.sh
$NCSIM_RUN


