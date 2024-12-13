`timescale 1ns / 1ps

	module MUX4X1_pipe( //port list
		in0,
		in1,
		in2,
		in3,
		s0,
		s1,
		out,
		clk,
		rst_n
	);
	
	//port declaration
	
	input wire in0;
	input wire in1;
	input wire in2;
	input wire in3;
	input wire s0 ;
	input wire s1 ;
	input wire clk;
	input wire rst_n;
	output reg out;


	// data flow 
	reg temp_s0 ;
	reg temp_s1 ;
	reg temp_out;

	always @(posedge clk, negedge rst_n)
		if(~rst_n)
		temp_out <= 1'b0;
		else
	begin
		temp_s0  <= s0 ;
		temp_s1  <= s1 ;
	end

	always @(posedge clk, negedge rst_n)
		if(~rst_n)
	begin
		temp_s0 <= 1'b0;
		temp_s1 <= 1'b0;
	end
		else
	begin
		case ({temp_s0,temp_s1})
		2'b00: temp_out <= in0;
		2'b01: temp_out <= in1;
		2'b10: temp_out <= in2;
		2'b11: temp_out <= in3;
		default: $display ("Error!!");
	
		endcase
	end
		out <= temp_out;
	end
endmodule

		
