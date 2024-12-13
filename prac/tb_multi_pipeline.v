`timescale 1ns / 1ps

module tb_multi_pipeline ();
	
	reg [9:0] a0;
	reg [9:0] b0;
	reg [9:0] a1;
	reg [9:0] b1;
	reg clk;
	reg rst_n;
	wire [11:0] out;

//connect tb - module


	multi_pipeline DUT(
	.a0(a0),
	.b0(b0),
	.a1(a1),
	.b1(b1),
	.clk(clk),
	.rst_n(rst_n),
	.out(out)
	);
	
	always
	#5 clk = ~clk ;

	// test bench
	initial
	begin
	clk = 1'b0;
	a0 = 10'd0; b0 = 10'd0; a1 = 10'd0; b1 = 10'd0; rst_n = 1'b0;
	#10
	rst_n = 1'b1; 
	#20
	a0 = 10'd3; b0 = 10'd2; a1 = 10'd1; b1 = 10'd5;
	#30	
	a0 = 10'd5; b0 = 10'd5; a1 = 10'd3; b1 = 10'd3;
	#10
	rst_n = 1'b0;
	#20
	a0 = 10'd4; b0 = 10'd4; a1 = 10'd4; b1 = 10'd4;
	#30
	$finish;
	end
endmodule
	


