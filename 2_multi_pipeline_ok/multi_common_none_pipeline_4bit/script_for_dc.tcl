############################################################################################################################################################################################
#---------------.synopsys_dc.setup configuration
####################################################################################################################################################################################### 
set hdlin_translate_off_skip_text "true"
set verilogout_no_tri             "true"
set default_schematic_options     "-size infinite"
set write_name_nets_same_as_ports "true"
#
#
#
#
#
#
#
#
#
#
#
#
#
#
##############################################################################   set three library   ##############################################################################
#------------------------------------------------------------------------------target_library:a small standard cell lib��link_library:full lib:symbol_library:merely for symbols in gui
###################################################################################################################################################################################### 
#--------1.first . indicate current directory 2.$serch_path use default directory set in .synopsys_dc.setup 3 ./library means library save in current folder
set search_path " . $search_path ./library"
####################################################################################################################################################################################### 
set target_library typical.db
set link_library   "* typical.db"
set symbol_library tsmc090.sdb
#echo $search_path
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
####################################################################################################################################################################################### 
#list_libs
######################################################################################################################################################################################## 
#=================================================================================FIRST WAY TO DO IT (RECOMMEND)
###############################################################################   precompile and link   ##############################################################################
#---------------1.precompile and link at the same time,auto delete intermediate document(NOTICE THAT:path./;append .v)
#######################################################################################################################################################################################
#set power_preserve_rtl_hier_names "true"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
read_verilog ./TOP.v 
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
list_design
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#rtl2saif -out forward_rtl.saif
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
##############################################################################   declare TOP file    ###############################################################
#---------------1.declare TOP file(NOTICE THAT:only declare module name; no path ./; dont append .v )
####################################################################################################################################################################################### 
current_design TOP
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
current_design
####################################################################################################################################################################################### 
#===============================================================================SECOND WAY TO DO IT (NOT RECOMMEND)
#--------------1. declare TOP file [define_design_lib module name of top .v file ]  -path [create a new folder to save intermediate document]
#define_design_lib  Meta_hardener -path ./intermediate_document

#--------------2. precompile and link
#(cautions: the file to be elaborated should be the TOP module,rather than the file name of the TOP file) analyze:precompile  elaborate:link
#analyze  -format verilog Meta_hardener.v
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#elaborate Meta_hardener 
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
##############################################################################   working environment    ##############################################################################
#--------------1.wire load model;2.each ports should has buffer,convinent for time delay optimazation;
####################################################################################################################################################################################### 
set_wire_load_model -name "tsmc090_wl10" [all_designs]
set_fix_multiple_port_nets -all -buffer_constants

##############################################################################   set up parameters for design    ##############################################################################
set_drive      5.0 [all_inputs]
set_load       1.0 [all_outputs]
set_max_fanout 5   [all_inputs]
set_max_area   200
set_max_delay  0.5 -to [all_outputs]
#
#
#
#
#
#
#
#
#
#
#
####################################################################################################################################################################################### 
read_saif -input backward_rtl.saif -instance_name Testbench/top_instance
#
#
#
##############################################################################   get to work    ##############################################################################
#--------------1.formally compile 2.report time 3.area
####################################################################################################################################################################################### 
compile
####################################################################################################################################################################################### 
#report_timing 
#######################################################################################################################################################################################
report_power
####################################################################################################################################################################################### 
report_area
#
#
#
#
#
#
#
#
#
#
#
##############################################################################   output files    ##############################################################################
#--------------1.ddc 2.netlist 3.SDF(standard delay file)
####################################################################################################################################################################################### 
write -hierarchy -format ddc
####################################################################################################################################################################################### 
write -hierarchy -format verilog -output MytestfileNetlist.v
####################################################################################################################################################################################### 
write_sdf mytestfile.sdf
####################################################################################################################################################################################### 
#
#
#
#
#
#
#
#
#
#
exit
####################################################################################################################################################################################### 
#/**********annotation**********
#optional command
#********************/
# re-synthesize the RTL to improve the timing
# dc_shell-t -f Intro_Top.sct
# ungroup -all -flatten
# compile -map_effort high
# change_names -rules verilog
# write -hierarchy -format verilog -output Intro_Flatten_Netlist.v
# write_sdf Intro_Top.sdf



