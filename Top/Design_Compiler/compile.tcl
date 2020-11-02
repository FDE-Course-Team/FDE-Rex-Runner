#====================================================================
# Project 		: Design Compiler script for FPGA Software Group
# File Name 	: Run_dc.tcl 
# Author	 		: 310 laboratory
# Function		: DC scripts
#====================================================================

set SRC_HOME			"/mnt/hgfs/FDE_Rex_Runner/v_src"
set LIB_HOME			"/home/allenwalker/project/lib"
set LIBRARY_NAME	"fde_dc"
set FILE_LIST			"FDE_Rex_Runner Driver Decider Texture"
set RESULT_HOME		"/mnt/hgfs/FDE_Rex_Runner/result"

#set WIRELOAD_NAME "ForQA"

#===================================================================
# Source file definition
#===================================================================

set DesignName FDE_Rex_Runner

#===================================================================
# Library Define
#===================================================================

set search_path " . \
								$LIB_HOME \
								$SRC_HOME"
								
set target_library " $LIB_HOME/$LIBRARY_NAME.db"

set link_library " * $LIB_HOME/$LIBRARY_NAME.db"

#===================================================================
# Read source file
#===================================================================
define_design_lib WORK -path "work"

foreach src $FILE_LIST {
	analyze -format verilog -lib WORK $SRC_HOME/$src.v
	elaborate $src -arch "verilog" -lib WORK -update
}

current_design $DesignName
uniquify -dont_skip_empty_designs
current_design $DesignName
link

#==================================================================
# Set Compile Option
#==================================================================


ungroup -flatten -all
compile -map_effort medium -ungroup_all
ungroup -flatten -all

#==================================================================
# Compile
#==================================================================

compile_ultra -inc

#=================================================================
# Save Database
#=================================================================

write -f verilog -hier -output $RESULT_HOME/${DesignName}_gate.v
