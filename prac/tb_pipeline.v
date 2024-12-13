`timescale 1ns / 1ps

module tb_pipeline ();
	reg [9:0] i1;	
	reg [9:0] i2;
	reg [9:0] i3;
	reg  clock;
	reg  reset_n;
	wire [11:0]  out_1;
	
	// load module

	pipeline DUT(
		.in1(i1),
		.in2(i2),
		.in3(i3),
		.clk(clock),
		.rst_n(reset_n),
		.out(out_1)
		);
	//clock set
	
	always
	#5 clock = ~clock;

	// signal setting

initial
	begin
	clock = 1'b0; i1 = 10'd0; i2 = 10'd0; i3 = 10'd0; reset_n = 1'b0;
	 #10
	reset_n = 1'b1;
	 #10
	i1 = 10'd3; i2 = 10'd8; i3 = 10'd2;
	 #50
	reset_n = 1'b0;
	i1 = 10'd5; i2 = 10'd1; i3 = 10'd5;
	 #20
	i1 = 10'd8; i2 = 10'd5; i3 = 10'd5; 
	 #20
	i1 = 10'd8; i2 = 10'd5; i3 = 10'd2;
	 #20 
	$finish;
	end

endmodule	
