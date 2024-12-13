`timescale 1ns / 1ps 

module tb_MUX4X1_pipe();

	reg in0;
	reg in1;
	reg in2;
	reg in3;
	reg s0 ;
	reg s1 ;
	reg clk;
	reg rst_n;
	wire out;

MUX4X1_pipe DUT(
	.in0(in0),
	.in1(in1),
	.in2(in2),
	.in3(in3),
	.s0(s0)  ,
	.s1(s1)  ,
	.clk(clk),
	.rst_n(rst_n),
	.out(out)
	);

	// test bench
	
	always 
	#5 clk = ~clk;


	initial 
	begin
	clk = 1'b0;
	in0 = 1'b0; in1 = 1'b0; in2 = 1'b0; in3 = 1'b0; s0 = 1'b0; s1 = 1'b0; rst_n = 1'b0;
	#20
	rst_n = 1'b1;
	#20
	in0 = 1'b1; in1 = 1'b0; in2 = 1'b1; in3 = 1'b1; s0 = 1'b0; s1 = 1'b0;
	#40
	in0 = 1'b0; in1 = 1'b1; in2 = 1'b0; in3 = 1'b1; s0 = 1'b1; s1 = 1'b1;
	#10
	rst_n = 1'b0;
	$finish;
	end

endmodule

	
