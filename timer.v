`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:07:27 04/06/2015 
// Design Name: 
// Module Name:    Timer 
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
module Timer(input clk_i,
		input rst_i,
		input wb_stb_i,
		input wb_cyc_i,
		output reg wb_ack_o,
		input [31:0] wb_addr_i,
		input [3:0] wb_sel_i,
		input wb_we_i,
		input [31:0] wb_data_i,
		output [31:0] wb_data_o,
		
		output [31:0]pwm_gen_A,
		output [31:0]pwm_gen_B,
		output [31:0]pwm_gen_C,
		output [31:0]pwm_gen_D,
		
		output [31:0]tone_gen_A,
		output [31:0]tone_gen_B,
		output [31:0]tone_gen_C,
		output [31:0]tone_gen_D
		
		
    );
	 wire request;
    wire request_rising_edge;
	 reg request_delay;
    reg ram_ack;
	 
	 reg [31:0]out_data_reg;

	 wire [31:0] t_ms_out;
	 wire [31:0] t_us_out;
		
		reg [31:0]pwm_comg1_A;
		reg [31:0]pwm_comg2_A;
		reg [31:0]pwm_comg3_A;
		reg [31:0]pwm_comg4_A;
	   reg [31:0]pwm_comg5_A;
		reg [31:0]pwm_comg6_A;
		reg [31:0]pwm_comg7_A;
		reg [31:0]pwm_comg8_A;
		
		
		reg [31:0]pwm_comg1_B;
		reg [31:0]pwm_comg2_B;
		reg [31:0]pwm_comg3_B;
		reg [31:0]pwm_comg4_B;
	   reg [31:0]pwm_comg5_B;
		reg [31:0]pwm_comg6_B;
		reg [31:0]pwm_comg7_B;
		reg [31:0]pwm_comg8_B;
		
		
		reg [31:0]pwm_comg1_C;
		reg [31:0]pwm_comg2_C;
		reg [31:0]pwm_comg3_C;
		reg [31:0]pwm_comg4_C;
	   reg [31:0]pwm_comg5_C;
		reg [31:0]pwm_comg6_C;
		reg [31:0]pwm_comg7_C;
		reg [31:0]pwm_comg8_C;
		
		
		reg [31:0]pwm_comg1_D;
		reg [31:0]pwm_comg2_D;
		reg [31:0]pwm_comg3_D;
		reg [31:0]pwm_comg4_D;
	   reg [31:0]pwm_comg5_D;
		reg [31:0]pwm_comg6_D;
		reg [31:0]pwm_comg7_D;
		reg [31:0]pwm_comg8_D;
		
		
		
		
	
		reg [31:0]tone_cp_A;
	
		reg [31:0]tone_cp_B;
	
		reg [31:0]tone_cp_C;
	
		reg [31:0]tone_cp_D;
		
		  
assign request = wb_stb_i & wb_cyc_i;
assign wb_data_o[31:0]=out_data_reg[31:0];

	always @ (posedge clk_i)
	begin
		if(rst_i == 1) 
			request_delay <= 0;
		else 
			request_delay <= request;
	end 

assign request_rising_edge = (request_delay ^ request) & request;

	// generate a 1 cycle acknowledgement for each request rising edge
	always @ (posedge clk_i)
	begin
		if (rst_i == 1)
			ram_ack <= 0;
		else if (request_rising_edge == 1)
			ram_ack <= 1;
		else
			ram_ack <= 0;
	end 

	// register wb_ack output, because onchip ram0 uses registered output
	always @ (posedge clk_i)
	begin
		if (rst_i == 1)
			wb_ack_o <= 0;
		else 
			wb_ack_o <= ram_ack;
	end 	

always @ (posedge clk_i)
	begin
		if (rst_i == 1)
		  begin
			out_data_reg<=0;		//and this
			pwm_comg1_A<=0;
			pwm_comg2_A<=0;
			pwm_comg3_A<=0;
			pwm_comg4_A<=0;
			pwm_comg5_A<=0;
			pwm_comg6_A<=0;
			pwm_comg7_A<=0;
			pwm_comg8_A<=0;
			
			pwm_comg1_B<=0;
			pwm_comg2_B<=0;
			pwm_comg3_B<=0;
			pwm_comg4_B<=0;
			pwm_comg5_B<=0;
			pwm_comg6_B<=0;
			pwm_comg7_B<=0;
			pwm_comg8_B<=0;
			
			pwm_comg1_C<=0;
			pwm_comg2_C<=0;
			pwm_comg3_C<=0;
			pwm_comg4_C<=0;
			pwm_comg5_C<=0;
			pwm_comg6_C<=0;
			pwm_comg7_C<=0;
			pwm_comg8_C<=0;
			
			pwm_comg1_D<=0;
			pwm_comg2_D<=0;
			pwm_comg3_D<=0;
			pwm_comg4_D<=0;
			pwm_comg5_D<=0;
			pwm_comg6_D<=0;
			pwm_comg7_D<=0;
			pwm_comg8_D<=0;
						
			tone_cp_A<=0;
			tone_cp_B<=0;
			tone_cp_C<=0;
			tone_cp_D<=0;
					  end
			
				else if(wb_addr_i[27:0]==28'h000_0010&& wb_we_i==1 &&request )
				 pwm_comg1_A[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0020&& wb_we_i==1 &&request )
				 pwm_comg2_A[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0030&& wb_we_i==1 &&request )
			    pwm_comg3_A[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0040&& wb_we_i==1 &&request )
			    pwm_comg4_A[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0050&& wb_we_i==1 &&request)
			    pwm_comg5_A[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0060&& wb_we_i==1 &&request)
			    pwm_comg6_A[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0070&& wb_we_i==1 &&request)
			    pwm_comg7_A[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0080&& wb_we_i==1 &&request)
			    pwm_comg8_A[31:0]<=wb_data_i[31:0];
			
				else if(wb_addr_i[27:0]==28'h000_0110&& wb_we_i==1 &&request)
				 pwm_comg1_B[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0120&& wb_we_i==1 &&request)
				 pwm_comg2_B[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0130&& wb_we_i==1 &&request)
			    pwm_comg3_B[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0140&& wb_we_i==1 &&request)
			    pwm_comg4_B[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0150&& wb_we_i==1 &&request)
			    pwm_comg5_B[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0160&& wb_we_i==1 &&request)
			    pwm_comg6_B[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0170&& wb_we_i==1 &&request)
			    pwm_comg7_B[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0180&& wb_we_i==1 &&request)
			    pwm_comg8_B[31:0]<=wb_data_i[31:0];
			
				else if(wb_addr_i[27:0]==28'h000_0210&& wb_we_i==1 &&request)
				 pwm_comg1_C[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0220&& wb_we_i==1 &&request)
				 pwm_comg2_C[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0230&& wb_we_i==1 &&request)
			    pwm_comg3_C[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0240&& wb_we_i==1 &&request)
			    pwm_comg4_C[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0250&& wb_we_i==1 &&request)
			    pwm_comg5_C[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0260&& wb_we_i==1 &&request)
			    pwm_comg6_C[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0270&& wb_we_i==1 &&request)
			    pwm_comg7_C[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0280&& wb_we_i==1 &&request)
			    pwm_comg8_C[31:0]<=wb_data_i[31:0];
			
			
				else if(wb_addr_i[27:0]==28'h000_0310&& wb_we_i==1 &&request)
				 pwm_comg1_D[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0320&& wb_we_i==1 &&request)
				 pwm_comg2_D[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0330&& wb_we_i==1 &&request)
			    pwm_comg3_D[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0340&& wb_we_i==1 &&request)
			    pwm_comg4_D[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0350&& wb_we_i==1 &&request)
			    pwm_comg5_D[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0360&& wb_we_i==1 &&request)
			    pwm_comg6_D[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0370&& wb_we_i==1 &&request)
			    pwm_comg7_D[31:0]<=wb_data_i[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0380&& wb_we_i==1 &&request)
			    pwm_comg8_D[31:0]<=wb_data_i[31:0];
			
				
				else if(wb_addr_i[27:0]==28'h000_1000&& wb_we_i==1 &&request)
					tone_cp_A[31:0]<=wb_data_i[31:0];
				else if(wb_addr_i[27:0]==28'h000_1100&& wb_we_i==1 &&request)
					tone_cp_B[31:0]<=wb_data_i[31:0];
				else if(wb_addr_i[27:0]==28'h000_1200&& wb_we_i==1 &&request)
					tone_cp_C[31:0]<=wb_data_i[31:0];
				else if(wb_addr_i[27:0]==28'h000_1300&& wb_we_i==1 &&request)
					tone_cp_D[31:0]<=wb_data_i[31:0];
				
				
			//MS US TIMER
				else if(wb_addr_i[27:0]==28'h000_2000 &&wb_we_i==0 &&request )
					out_data_reg[31:0]<=t_ms_out[31:0];
				else if(wb_addr_i[27:0]==28'h000_3000 &&wb_we_i==0 &&request  )
					out_data_reg[31:0]<=t_us_out[31:0];
				
				//COMP
				else if(wb_addr_i[27:0]==28'h000_0010&& wb_we_i==0 &&request )
					out_data_reg[31:0]<=pwm_comg1_A[31:0];
				else if(wb_addr_i[27:0]==28'h000_0020&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg2_A[31:0];
				else if(wb_addr_i[27:0]==28'h000_0030&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg3_A[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0040&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg4_A[31:0];
				else if(wb_addr_i[27:0]==28'h000_0050&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg5_A[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0060&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg6_A[31:0];
				else if(wb_addr_i[27:0]==28'h000_0070&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg7_A[31:0];
				else if(wb_addr_i[27:0]==28'h000_0080&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg8_A[31:0];
					
					else if(wb_addr_i[27:0]==28'h000_0110&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg1_B[31:0];
				else if(wb_addr_i[27:0]==28'h000_0120&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg2_B[31:0];
				else if(wb_addr_i[27:0]==28'h000_0130&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg3_B[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0140&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg4_B[31:0];
				else if(wb_addr_i[27:0]==28'h000_0150&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg5_B[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0160&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg6_B[31:0];
				else if(wb_addr_i[27:0]==28'h000_0170&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg7_B[31:0];
				else if(wb_addr_i[27:0]==28'h000_0180&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg8_B[31:0];
					
					else if(wb_addr_i[27:0]==28'h000_0210&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg1_C[31:0];
				else if(wb_addr_i[27:0]==28'h000_0220&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg2_C[31:0];
				else if(wb_addr_i[27:0]==28'h000_0230&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg3_C[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0240&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg4_C[31:0];
				else if(wb_addr_i[27:0]==28'h000_0250&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg5_C[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0260&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg6_C[31:0];
				else if(wb_addr_i[27:0]==28'h000_0270&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg7_C[31:0];
				else if(wb_addr_i[27:0]==28'h000_0280&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg8_C[31:0];
					
					else if(wb_addr_i[27:0]==28'h000_0310&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg1_D[31:0];
				else if(wb_addr_i[27:0]==28'h000_0320&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg2_D[31:0];
				else if(wb_addr_i[27:0]==28'h000_0330&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg3_D[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0340&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg4_D[31:0];
				else if(wb_addr_i[27:0]==28'h000_0350&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg5_D[31:0];
			   else if(wb_addr_i[27:0]==28'h000_0360&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg6_D[31:0];
				else if(wb_addr_i[27:0]==28'h000_0370&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg7_D[31:0];
				else if(wb_addr_i[27:0]==28'h000_0380&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=pwm_comg8_D[31:0];
			 		
			 
				else if(wb_addr_i[27:0]==28'h000_1000&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=tone_cp_A[31:0];
					else if(wb_addr_i[27:0]==28'h000_1100&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=tone_cp_B[31:0];
				else if(wb_addr_i[27:0]==28'h000_1200&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=tone_cp_C[31:0];
				else if(wb_addr_i[27:0]==28'h000_1300&& wb_we_i==0 &&request)
					out_data_reg[31:0]<=tone_cp_D[31:0];
				
				
end

timer_ms T_m(clk_i,rst_i,t_ms_out[31:0]);
timer_us T_u(clk_i,rst_i,t_us_out[31:0]);
PWM_Timer pwm_t1(clk_i,rst_i,pwm_comg1_A[31:0],pwm_comg2_A[31:0],pwm_comg3_A[31:0],pwm_comg4_A[31:0],pwm_comg5_A[31:0],pwm_comg6_A[31:0],pwm_comg7_A[31:0],pwm_comg8_A[31:0],pwm_gen_A[31:0]);
PWM_Timer pwm_t2(clk_i,rst_i,pwm_comg1_B[31:0],pwm_comg2_B[31:0],pwm_comg3_B[31:0],pwm_comg4_B[31:0],pwm_comg5_B[31:0],pwm_comg6_B[31:0],pwm_comg7_B[31:0],pwm_comg8_B[31:0],pwm_gen_B[31:0]);
PWM_Timer pwm_t3(clk_i,rst_i,pwm_comg1_C[31:0],pwm_comg2_C[31:0],pwm_comg3_C[31:0],pwm_comg4_C[31:0],pwm_comg5_C[31:0],pwm_comg6_C[31:0],pwm_comg7_C[31:0],pwm_comg8_C[31:0],pwm_gen_C[31:0]);
PWM_Timer pwm_t4(clk_i,rst_i,pwm_comg1_D[31:0],pwm_comg2_D[31:0],pwm_comg3_D[31:0],pwm_comg4_D[31:0],pwm_comg5_D[31:0],pwm_comg6_D[31:0],pwm_comg7_D[31:0],pwm_comg8_D[31:0],pwm_gen_D[31:0]);

tone_Timer tone_t1(clk_i,rst_i,tone_cp_A[31:0],tone_gen_A[31:0]);
tone_Timer tone_t2(clk_i,rst_i,tone_cp_B[31:0],tone_gen_B[31:0]);
tone_Timer tone_t3(clk_i,rst_i,tone_cp_C[31:0],tone_gen_C[31:0]);
tone_Timer tone_t4(clk_i,rst_i,tone_cp_D[31:0],tone_gen_D[31:0]);

endmodule

