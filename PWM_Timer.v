`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:41:14 03/18/2015 
// Design Name: 
// Module Name:     PWM_Timer 
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
module PWM_Timer(input clk_i,input rst_i,input [31:0]pwm_comp1,input [31:0]pwm_comp2,
						input [31:0]pwm_comp3,input [31:0]pwm_comp4,input [31:0]pwm_comp5,
						input [31:0]pwm_comp6,input [31:0]pwm_comp7,input [31:0]pwm_comp8,
						output [31:0]pwm_gen_o);
reg [7:0]timer;
reg [13:0]timer_c;
reg [31:0]pwm_gen;

assign pwm_gen_o=pwm_gen;
always@(posedge clk_i,posedge rst_i)begin
	if(rst_i)
	begin
		timer<=8'b0;
		timer_c<=14'b0;
	end
	else
	begin
		if(timer_c==14'd3750)//FOR SERVO
		begin
			timer_c<=14'b0;
			timer<=timer+1;
		end
		else
			timer_c<=timer_c+1;
		end
	end


always@(posedge clk_i,posedge rst_i)begin
if(rst_i)
begin

pwm_gen<=32'b0;
end
else begin
	
	
	
	if(pwm_comp1[7:0]==timer)
	pwm_gen[0]<=1'b0;
	else if(&timer)
	pwm_gen[0]<=1'b1;
	
	
	
	
	
	if(pwm_comp1[15:8]==timer)
	pwm_gen[1]<=1'b0;
	else if(&timer)
	pwm_gen[1]<=1'b1;
	
	


		if(pwm_comp1[23:16]==timer)
		pwm_gen[2]<=1'b0;
		else if(&timer)
		pwm_gen[2]<=1'b1;

	

	if(pwm_comp1[31:24]==timer)
	pwm_gen[3]<=1'b0;
	else if(&timer)
	pwm_gen[3]<=1'b1;


	if(pwm_comp2[7:0]==timer)
	pwm_gen[4]<=1'b0;
	else if(&timer)
	pwm_gen[4]<=1'b1;

	

	if(pwm_comp2[15:8]==timer)
	pwm_gen[5]<=1'b0;
	else if(&timer)
	pwm_gen[5]<=1'b1;

	
	
	if(pwm_comp2[23:16]==timer)
	pwm_gen[6]<=1'b0;
	else if(&timer)
	pwm_gen[6]<=1'b1;
	
		
	
	
	if(pwm_comp2[31:24]==timer)
	pwm_gen[7]<=1'b0;
	else if(&timer)
	pwm_gen[7]<=1'b1;
	
	
	
	if(pwm_comp3[7:0]==timer)
	pwm_gen[8]<=1'b0;
	else if(&timer)
	pwm_gen[8]<=1'b1;
	
	
	
	if(pwm_comp3[15:8]==timer)
	pwm_gen[9]<=1'b0;
	else if(&timer)
	pwm_gen[9]<=1'b1;
	
	
	
	if(pwm_comp3[23:16]==timer)
	pwm_gen[10]<=1'b0;
	else if(&timer)
	pwm_gen[10]<=1'b1;
		
	
	
	if(pwm_comp3[31:24]==timer)
	pwm_gen[11]<=1'b0;
	else if(&timer)
	pwm_gen[11]<=1'b1;

	

	if(pwm_comp4[7:0]==timer)
	pwm_gen[12]<=1'b0;
	else if(&timer)
	pwm_gen[12]<=1'b1;
	
	
	
	
	if(pwm_comp4[15:8]==timer)
	pwm_gen[13]<=1'b0;
	else if(&timer)
	pwm_gen[13]<=1'b1;
	
	
	
	if(pwm_comp4[23:16]==timer)
	pwm_gen[14]<=1'b0;
	else if(&timer)
	pwm_gen[14]<=1'b1;
		
	
	
	if(pwm_comp4[31:24]==timer)
	pwm_gen[15]<=1'b0;
	else if(&timer)
	pwm_gen[15]<=1'b1;

	

	if(pwm_comp5[7:0]==timer)
	pwm_gen[16]<=1'b0;
	else if(&timer)
	pwm_gen[16]<=1'b1;

	
	
	if(pwm_comp5[15:8]==timer)
	pwm_gen[17]<=1'b0;
	else if(&timer)
	pwm_gen[17]<=1'b1;
	
	
	
	if(pwm_comp5[23:16]==timer)
	pwm_gen[18]<=1'b0;
	else if(&timer)
	pwm_gen[18]<=1'b1;
	
	
	
	if(pwm_comp5[31:24]==timer)
	pwm_gen[19]<=1'b0;
	else if(&timer)
	pwm_gen[19]<=1'b1;
	
	
	
	if(pwm_comp6[7:0]==timer)
	pwm_gen[20]<=1'b0;
	else if(&timer)
	pwm_gen[20]<=1'b1;
	
	
	
	if(pwm_comp6[15:8]==timer)
	pwm_gen[21]<=1'b0;
	else if(&timer)
	pwm_gen[21]<=1'b1;
	
	
	
	if(pwm_comp6[23:16]==timer)
	pwm_gen[22]<=1'b0;
	else if(&timer)
	pwm_gen[22]<=1'b1;
	
	
	
	if(pwm_comp6[31:24]==timer)
	pwm_gen[23]<=1'b0;
	else if(&timer)
	pwm_gen[23]<=1'b1;
	
	
	
	if(pwm_comp7[7:0]==timer)
	pwm_gen[24]<=1'b0;
	else if(&timer)
	pwm_gen[24]<=1'b1;
	
	
	
	if(pwm_comp7[15:8]==timer)
	pwm_gen[25]<=1'b0;
	else if(&timer)
	pwm_gen[25]<=1'b1;

	

	if(pwm_comp7[23:16]==timer)
	pwm_gen[26]<=1'b0;
	else if(&timer)
	pwm_gen[26]<=1'b1;

	
	

	if(pwm_comp7[31:24]==timer)
	pwm_gen[27]<=1'b0;
	else if(&timer)
	pwm_gen[27]<=1'b1;

	
	if(pwm_comp8[7:0]==timer)
	pwm_gen[28]<=1'b0;
	else if(&timer)
	pwm_gen[28]<=1'b1;

	

	if(pwm_comp8[15:8]==timer)
	pwm_gen[29]<=1'b0;
	else if(&timer)
	pwm_gen[29]<=1'b1;
	
	
	
	if(pwm_comp8[23:16]==timer)
	pwm_gen[30]<=1'b0;
	else if(&timer)
	pwm_gen[30]<=1'b1;
		
	
	if(pwm_comp8[31:24]==timer)
	pwm_gen[31]<=1'b0;
	else if(&timer)
	pwm_gen[31]<=1'b1;
	
	end
end
endmodule
