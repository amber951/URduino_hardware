`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:35:21 03/19/2015 
// Design Name: 
// Module Name:    tone_Timer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module tone_Timer(input clk_i,input rst_i,input [31:0]tone_cp,output [31:0]tone_gen_o
    );
	 
	 reg [31:0]timer;
	 reg tone_gen;
	 
	 assign tone_gen_o[31:0]={tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,
								tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,
								tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,
								tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen,tone_gen};
	 
	 always@(posedge clk_i or posedge rst_i)
	 begin
	 if(rst_i)begin
		timer<=31'b0;
		end
	else if(timer>=tone_cp/2)
	timer<=0;
	 else if(tone_cp>0)
	 timer<=timer+1;
	 end

always@(posedge clk_i or posedge rst_i)begin
	if(rst_i)begin
	tone_gen<=1'b0;
		end
	else if(timer==tone_cp/2)
	tone_gen<=tone_gen+1'b1;
	
end


endmodule
