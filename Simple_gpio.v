`include "or1200_defines.v"

module simple_gpio(
	input clk,
	input rst,
	input wea,
	input [15:0] addr,
	input [31:0] din,
	output [31:0] dout,
	output [15:0] GPIO_o,
	input  [15:0] GPIO_i
);	
reg [31:0]timer;
reg [17:0]count;
parameter comp=48000;
assign dout = timer[31:0];
assign GPIO_o = GPIO[15:0];

reg [31:0] GPIO;

always@(posedge clk or `OR1200_RST_EVENT rst) begin
	if (rst == `OR1200_RST_VALUE) begin
		GPIO <= 32'b0;
		timer<=32'b0;
		count<=32'b0;
	end
	else begin
		GPIO[15:0] <= ((addr == 16'hffff) && wea) ? din[15:0] : GPIO[15:0];
		GPIO[31:16] <= GPIO_i;
		
		timer<= ((addr == 16'hffff) && wea) ? din : timer;
		
		count<=count+1;
		if(count==comp)
		begin
		count<=0;
		timer<=timer+1;
		end
		
	end
end
endmodule