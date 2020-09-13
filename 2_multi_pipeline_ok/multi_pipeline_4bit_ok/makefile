clean:
	@rm -rf *.v~ *.syn *.mr *.pvl  *tcl~ *.log *makefile~ *.ddc *.SDF *Netlist* *.swp *.svf *.un~ .makefile.swp .swp .makefile.un~ .script_for_dc.tcl.un~ *.un~ vcslist~ *.swp .vcslist.un~ *.sdf .Testbench.v.un~ .TOP.v.un~ backward_rtl.saif .*.v.un~ .*.v.swp  
	@rm -rf ./Myfolder
	@rm -rf simv ucli.key *.vpd
	@rm -rf ./DVEfiles 
	@rm -rf ./csrc
	@rm -rf ./simv.daidir
cleanvcs:
	@rm -rf simv ucli.key *.vpd
	@rm -rf ./DVEfiles 
	@rm -rf ./csrc
	@rm -rf ./simv.daidir
cleandc:
	@rm -rf *.v~ *.syn *.mr *.pvl  *tcl~ *.log *makefile~ *.ddc *.SDF *Netlist* *.swp *.svf *.un~ .makefile.swp .swp .makefile.un~ .script_for_dc.tcl.un~ 
	@rm -rf ./Myfolder 
####################################################################################################################################################################################### 
#for unknown reason -f has to be appent a specific file which contain "./"
####################################################################################################################################################################################### 
vcs:
	vcs \
	-sverilog \
	-full64 \
	-debug_all \
	-l vcslog.log \
	-f vcslist
	./simv -gui &
dc:
	dc_shell -f script_for_dc.tcl

