`timescale 1ns / 1ps

module adder(
	in0,
	in1,
	in2,
	in3,
	clk,
	rst_n,
	out
);

	//port declaration
	input wire [13:0] in0;
	input wire [13:0] in1;
	input wire [13:0] in2;
	input wire [13:0] in3;
	input wire clk;
	input wire rst_n;
	output reg [16:0] out;
	
	
	reg [14:0] temp_add1;
	reg [14:0] temp_add2;
	

	always @(posedge clk, negedge rst_n)
	begin
	if(~rst_n)
	temp_add1 <= 15'b0;
	else
	temp_add1 <= (in0 + in1);
	end

	always @(posedge clk, negedge rst_n)
	begin
	if(~rst_n)
	temp_add2 <= 15'b0;
	else
	temp_add2 <= (in2 + in3);
	end
	
	always @(posedge clk, negedge rst_n)
	begin
	if(~rst_n)
	out <= 17'b0;
	else
	out <= (temp_add1 + temp_add2);
	end

endmodule

