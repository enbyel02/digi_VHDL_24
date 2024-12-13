set:
	mkdir ./worklib
	touch ./cds.lib
	touch ./hdl.var
	echo "define work_lib ./worklib" >> ./cds.lib
	echo "define WORK work_lib" >> ./hdl.var

com:
	xmvlog -MESS -linedebug ../src/*.v

elab:
	xmelab -MESS -access +rwc tb_adder
sim:
	xmsim -MESS tb_adder -gui

clean:
	rm -rf cds.lib hdl.var *.sim *.log worklib *.shm *.key

all: clean set com elab sim
