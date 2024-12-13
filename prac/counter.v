`timescale 1ns / 1ps

module counter(
	cnt,
	rst_n,
	clk
);

	//port declaration

	input wire clk;
	input wire rst_n;
	input  reg [6:0]temp_cnt;
	output reg [6:0]cnt;
	
	

	
	always @(posedge clk, negedge rst_n)
		if(~rst_n)
	begin
		begin
		temp_cnt <= 7'b0;
		end

		else if(cnt < 50)
		begin
		cnt = cnt +1
		end

		else if(cnt == 50)
		begin
		temp_cnt <= cnt;
		end
		
		else
		begin
		$display("Error!!");
		end
	end
	
	always @(posedge clk, negedge rst_n)
	begin
		if(~rst_n)
		out <= 7'b0;
		
		else if(temp_cnt < 100)
		temp_cnt = temp_cnt + 1;
		
		else
		$display("Error!!");
	end

endmodule
		

		 
