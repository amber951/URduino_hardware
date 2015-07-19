`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:51:13 03/15/2015 
// Design Name: 
// Module Name:    timer_us 
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
module timer_us(input clk_i,input rst_i,output [31:0]t_out);
reg [31:0]timer;
reg [17:0]count;
parameter comp=48;

assign t_out=timer;
always@(posedge clk_i or posedge rst_i) begin
	if (rst_i) begin
		timer<=32'b0;
		count<=18'b0;
	end
	else begin
		
		count<=count+1;
		if(count==comp)
		begin
		count<=0;
		timer<=timer+1;
		end
		
	end
end


endmodule
