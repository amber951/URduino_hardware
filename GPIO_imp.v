`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    03:13:28 01/30/2015 
// Design Name: 
// Module Name:    GPIO_imp 
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
module GPIO_imp(
	input clk,input rst,input [3:0]output_control,input gpio_data,input pwm_gen,
	input tone_gen,inout GPIO_IO,output reg in,
	input [1:0]EICRA,input EIMSK,output reg INT,output uartA_rxd,input uartA_txd
    );

reg GPIO_IO_reg;
 reg out;
 reg in_delay;
 //reg EICRA[1:0];
 assign GPIO_IO=GPIO_IO_reg;
 always@(posedge clk or  posedge rst)
 begin
 if(rst)
 begin
 GPIO_IO_reg<=0;
 end
 else
 begin
	case(output_control)
	4'b0000:GPIO_IO_reg<=1'bz;
	4'b0001:GPIO_IO_reg<=out;
	4'b0010:GPIO_IO_reg<=pwm_gen;
	4'b0011:GPIO_IO_reg<=tone_gen;
	4'b0100:GPIO_IO_reg<=uartA_txd;
	4'b0101:GPIO_IO_reg<=1'bz;
	default:GPIO_IO_reg<=0;
	endcase
end
 end
 
  //assign GPIO_IO= gpio_enable ? (pwm_enable?pwm_gen:(tone_enable?tone_gen:(uart_enable?uartA_txd:out)))     :    1'bZ; 
	assign uartA_rxd=( output_control==4'b0101) ?GPIO_IO    :1'bz; 
  always@(posedge clk)
  begin
	if(rst)
		in_delay<=0;
	else
		in_delay<=in;
	end

	always@(posedge clk ,posedge rst)
	begin
	if (rst)
	begin
	INT<=0;
	end
	else
	begin
		case(EICRA[1:0])
		2'b00: INT<= (~in)&&(~in_delay)&&EIMSK;
		2'b01: INT<= ((~in)&&(in_delay)&&EIMSK)||((in )&&(~in_delay)&&EIMSK);
		2'b10: INT<= ((in)&&(~in_delay)&&EIMSK);
		2'b11: INT<= ((~in )&&(in_delay)&&EIMSK);
		endcase
	end
	end
	
//assign GPIO=out;
 always@(posedge clk or  posedge rst)
 begin
      if(rst)
				begin
				in<=0;
				out<=0;
				
				end
      else if(output_control==4'b0001)
              begin
              out<=gpio_data;
              end
		 else
				  begin
				  in<=GPIO_IO;
			   	end   
      
 end



endmodule
