`timescale 1ns / 1ps

module pipeline(
	in1,
	in2,
	in3,
	out,
	clk,
	rst_n
);

	//port declaration

	input wire [9:0] in1	;
	input wire [9:0] in2	;
	input wire [9:0] in3	;
	input wire clk		;
	input wire rst_n	;
	output reg [11:0] out	;


	//data flow modeling 

	reg [10:0] temp_add1	;
	always @(posedge clk, negedge rst_n)
		begin	
		if (~rst_n)
		temp_add1 <= 11'b0;
		else
		temp_add1 <= (in1 + in2);
		end
	reg [9:0] temp_in3	;
	always @(posedge clk, negedge rst_n)
		begin
		if (~rst_n)
		temp_in3 <= 10'b0;
		else
		temp_in3 <= in3;
		end
	always @(posedge clk, negedge rst_n)
		begin
		if (~rst_n)
		out <= 12'b0;
		else
		out <= {1'b0, temp_add1} + {2'b0, temp_in3};
		end	
endmodule		
	
