`timescale 1ns / 1ps

module tb_adder();

	reg [13:0] in0;
	reg [13:0] in1;
	reg [13:0] in2;
	reg [13:0] in3;
	reg clk;
	reg rst_n;
	wire [16:0] out;

	adder DUT (
	.in0(in0),
	.in1(in1),
	.in2(in2),
	.in3(in3),
	.clk(clk),
	.rst_n(rst_n),
	.out(out)
	);

	always
	#5 clk = ~clk;   //10ns T

	initial 
	begin		// T = 0ns
	in0 = 14'b0; in1 = 14'b0; in2 = 14'b0; in3 = 14'b0; clk = 1'b0; rst_n = 1'b0;
	
	#10		// T = 10ns
	rst_n = 1'b1;

	#30 		// T = 40ns
	in0 = 14'd1111; in1 = 14'd1111; in2 = 14'd1111; in3 = 14'd1111;
	
	#10		// T = 50ns
	in0 = 14'd3333; in1 = 14'd3333; in2 = 14'd3333; in3 = 14'd3333;
	
	#10		// T = 60ns	
	in0 = 14'd5555; in1 = 14'd5555; in2 = 14'd5555; in3 = 14'd5555;

	#140		// T = 200ns
	rst_n = 1'b0;

	#100
	$finish;
	end

endmodule

