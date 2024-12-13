set:
	mkdir worklib
	touch cds.lib
	touch hdl.var
	echo "define work_lib worklib" >> cds.lib
	echo "define WORK work_lib" >> hdl.var

com:
	xmvlog -MESS -linedebug *.v

elab:
	xmelab -MESS -access +rwc tb_MUX4X1_pipe
sim:
	xmsim -MESS tb_MUX4X1_pipe -gui

clean:
	rm -rf cds.lib hdl.var *.sim *.log worklib *.shm *.key
