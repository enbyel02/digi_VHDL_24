`timescale 1ns / 1ps

module multi_pipeline( //port list
	a0,
	b0,
	a1,
	b1,
	clk,
	out,
	rst_n
);

	//port declaration

	input wire [9:0] a0;
	input wire [9:0] b0;
	input wire [9:0] a1;
	input wire [9:0] b1;
	input wire clk	;
	input wire rst_n;
	output reg [11:0] out;


	// data flow modeling
	
	reg [10:0] temp_add1;
	
	always @(rst_n, clk)
		begin	
		if (~rst_n)
		temp_add1 = 11'b0;
		else
		temp_add1 = a0 + b0;
		end

	reg [10:0] temp_add2;

	always @(rst_n, clk)
		begin
		if (~rst_n)
		temp_add2 = 11'b0;
		else
		temp_add2 = a1 + b1;
		end
	
	always @(rst_n, clk)
		begin
		if (~rst_n)
		out = 12'b0;
		else
		out = temp_add1 + temp_add2;
		end
endmodule		

		
	
	
	



	
