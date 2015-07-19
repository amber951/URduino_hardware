module port(
		input clk_i,
		input rst_i,
		input wb_stb_i,
		input wb_cyc_i,
		output reg wb_ack_o,
		input [31:0] wb_addr_i,
		input [3:0] wb_sel_i,
		input wb_we_i,
		input [31:0] wb_data_i,
		output [31:0] wb_data_o,
		inout [31:0]GPIO_IO,
		output OUT_INT,
		input int_pending,
		input [31:0]openRISC_pc,
		input [31:0]pwm_gen,
		
		input [31:0]tone_gen,
	
		input [15:0]uart_txd,
		output [15:0]uart_rxd
		
		
		
		
	);
	reg [31:0]out_data_reg;

	
	wire request;
    reg request_delay;
    wire request_rising_edge;
    reg ram_ack;
    
	 
    reg [31:0]out_8;
	 reg [31:0]out_16;
	 reg [31:0]out_24;
	 reg [31:0]out_32;
    
	 reg [31:0]gpio_data;
	 reg [31:0]EICRA;
	 reg [31:0]EICRB;
	 reg [31:0]EIMSK;
	 reg [31:0]INT_flag;
	 reg out_q,out_d;

	 wire [31:0]in;
	 wire [31:0]INT;
	
		reg [31:0]PC;
		reg int_enable;
		
	assign OUT_INT=out_q;
	
assign request = wb_stb_i & wb_cyc_i;


assign wb_data_o[31:0]=out_data_reg[31:0];

	
	
	
	
	always@* begin
  if(int_pending) begin //at reset.s
    out_d = 0;
 end
  else if(|INT && ~int_enable) begin
    out_d =1;

	 end
  else begin
    out_d = out_q;	 
  end
end


always@(posedge clk_i, posedge rst_i) begin
  if(rst_i) begin
    out_q <= 0;
  end
  else begin
    out_q <= out_d;
  end
end
	
	
	always@(posedge clk_i,posedge rst_i)
	begin
	if(rst_i)
	PC<=0;
	else
	PC<=openRISC_pc;
	end
	
	always@(posedge clk_i,posedge rst_i)
	begin
	if(rst_i)begin
	int_enable<=0;
	end
	else if(PC==32'h0000082c)
	 int_enable<=0;
	 else if(out_q)
	int_enable<=1;
	end
	
	// get the rising edge of request signal
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
			
			gpio_data<=0;
			EICRA<=0;
			EICRB<=0;
			EIMSK<=0;
			out_data_reg<=0;		//and this
			
			out_8<=0;
			out_16<=0;
			out_24<=0;
			out_32<=0;
			INT_flag<=0;
	end
		  /*
		else if(wb_addr_i[31:0]==32'h2000_0010 && wb_we_i==1)
			 gpio_enable<= wb_data_i[31:0];
		else if(wb_addr_i[31:0]==32'h2000_0020 && wb_we_i==1)
		    gpio_data<=wb_data_i[31:0];
		else if(wb_addr_i[31:0]==32'h2000_0030&& wb_we_i==1)
			 EICRA<=wb_data_i[31:0];
		else if(wb_addr_i[31:0]==32'h2000_0040&& wb_we_i==1)
			 EICRB<=wb_data_i[31:0];
		else if(wb_addr_i[31:0]==32'h2000_0050&& wb_we_i==1)
			 EIMSK<=wb_data_i[31:0];
			 
			 
   	 else if(wb_addr_i[31:0]==32'h2000_0010&& wb_we_i==0)
			out_data_reg[31:0]<=gpio_enable[31:0];
		else if(wb_addr_i[31:0]==32'h2000_0020&& wb_we_i==0)
		    out_data_reg[31:0]<=gpio_data[31:0];
		else if(wb_addr_i[31:0]==32'h2000_0030&& wb_we_i==0)
			out_data_reg[31:0]<= EICRA[31:0];
		else if(wb_addr_i[31:0]==32'h2000_0040&& wb_we_i==0)
			outag[31:0]<= EICRB[31:0];
		else if(wb_addr_i[31:0]==32'h2000_0050&& wb_we_i==0)
			 out_data_reg[31:0]<=EIMSK[31:0];
		else if(wb_addr_i[31:0]==32'h2000_0060&& wb_we_i==0)
			out_data_reg[31:0]<=in[31:0];*/
			else if(wb_addr_i[27:0]==28'h000_0010 && wb_we_i==1 &&request)
			 out_8[31:0]<= wb_data_i[31:0];
			 else if(wb_addr_i[27:0]==28'h000_0020 && wb_we_i==1 &&request)
			 out_16[31:0]<= wb_data_i[31:0];
			 else if(wb_addr_i[27:0]==28'h000_0030 && wb_we_i==1 &&request)
			 out_24[31:0]<= wb_data_i[31:0];
			 else if(wb_addr_i[27:0]==28'h000_0040 && wb_we_i==1 &&request)
			 out_32[31:0]<= wb_data_i[31:0];
	
			else if(wb_addr_i[27:0]==28'h000_0050 && wb_we_i==1&&request)
		    gpio_data<=wb_data_i[31:0];
			else if(wb_addr_i[27:0]==28'h000_0070&& wb_we_i==1&&request)
			 EICRA<=wb_data_i[31:0];
			else if(wb_addr_i[27:0]==28'h000_0080&& wb_we_i==1&&request)
			 EICRB<=wb_data_i[31:0];
			else if(wb_addr_i[27:0]==28'h000_0090&& wb_we_i==1&&request)
			 EIMSK<=wb_data_i[31:0];
		//else if(wb_addr_i[27:0]==28'h000_0090&& wb_we_i==1&&request)
			// uart_enable[31:0]<=wb_data_i[31:0];
			else if(wb_addr_i[27:0]==28'h000_00A0&& wb_we_i==1&&request)
			 INT_flag<=wb_data_i[31:0];
			 
			 
			 
   	 else if(wb_addr_i[27:0]==28'h000_0010&& wb_we_i==0 &&request)
			out_data_reg[31:0]<=out_8[31:0];
		 else if(wb_addr_i[27:0]==28'h000_0020&& wb_we_i==0 &&request)
			out_data_reg[31:0]<=out_16[31:0];
		else if(wb_addr_i[27:0]==28'h000_0030&& wb_we_i==0 &&request)
			out_data_reg[31:0]<=out_24[31:0];
		else if(wb_addr_i[27:0]==28'h000_0040&& wb_we_i==0 &&request)
			out_data_reg[31:0]<=out_32[31:0];
		
		
		else if(wb_addr_i[27:0]==28'h000_0050&& wb_we_i==0 &&request)
		    out_data_reg[31:0]<=gpio_data[31:0];
			 else if(wb_addr_i[27:0]==28'h000_0060&& wb_we_i==0 &&request)
			out_data_reg[31:0]<=in[31:0];
		else if(wb_addr_i[27:0]==28'h000_0070&& wb_we_i==0 &&request)
			out_data_reg[31:0]<= EICRA[31:0];
		else if(wb_addr_i[27:0]==28'h000_0080&& wb_we_i==0 &&request)
			out_data_reg[31:0]<= EICRB[31:0];
		else if(wb_addr_i[27:0]==28'h000_0090&& wb_we_i==0 &&request)
			 out_data_reg[31:0]<=EIMSK[31:0];
		else if(wb_addr_i[27:0]==28'h000_00A0&& wb_we_i==0 &&request)
			 out_data_reg[31:0]<=INT_flag[31:0];
		else if(|INT)
		INT_flag[31:0]<=INT;
			//else if(wb_addr_i[27:0]==28'h000_0070&& wb_we_i==0 &&request)
			//out_data_reg[31:0]<= uart_enable[31:0];
	end 	
	
	
	GPIO_imp IO1(clk_i,rst_i,out_8[3:0],gpio_data[0],pwm_gen[0],tone_gen[0],GPIO_IO[0],in[0],EICRA[1:0],EIMSK[0],INT[0],,uart_txd[0]);
	GPIO_imp IO2(clk_i,rst_i,out_8[7:4],gpio_data[1],pwm_gen[1],tone_gen[1],GPIO_IO[1],in[1],EICRA[3:2],EIMSK[1],INT[1],uart_rxd[0],);
	GPIO_imp IO3(clk_i,rst_i,out_8[11:8],gpio_data[2],pwm_gen[2],tone_gen[2],GPIO_IO[2],in[2],EICRA[5:4],EIMSK[2],INT[2],,uart_txd[1]);
	GPIO_imp IO4(clk_i,rst_i,out_8[15:12],gpio_data[3],pwm_gen[3],tone_gen[3],GPIO_IO[3],in[3],EICRA[7:6],EIMSK[3],INT[3],uart_rxd[1],);
	GPIO_imp IO5(clk_i,rst_i,out_8[19:16],gpio_data[4],pwm_gen[4],tone_gen[4],GPIO_IO[4],in[4],EICRA[9:8],EIMSK[4],INT[4],,uart_txd[2]);
	GPIO_imp IO6(clk_i,rst_i,out_8[23:20],gpio_data[5],pwm_gen[5],tone_gen[5],GPIO_IO[5],in[5],EICRA[11:10],EIMSK[5],INT[5],uart_rxd[2],);
	GPIO_imp IO7(clk_i,rst_i,out_8[27:24],gpio_data[6],pwm_gen[6],tone_gen[6],GPIO_IO[6],in[6],EICRA[13:12],EIMSK[6],INT[6],,uart_txd[3]);
	GPIO_imp IO8(clk_i,rst_i,out_8[31:28],gpio_data[7],pwm_gen[7],tone_gen[7],GPIO_IO[7],in[7],EICRA[15:14],EIMSK[7],INT[7],uart_rxd[3],);
	GPIO_imp IO9(clk_i,rst_i,out_16[3:0],gpio_data[8],pwm_gen[8],tone_gen[8],GPIO_IO[8],in[8],EICRA[17:16],EIMSK[8],INT[8],,uart_txd[4]);
	GPIO_imp IO10(clk_i,rst_i,out_16[7:4],gpio_data[9],pwm_gen[9],tone_gen[9],GPIO_IO[9],in[9],EICRA[19:18],EIMSK[9],INT[9],uart_rxd[4],);
	GPIO_imp IO11(clk_i,rst_i,out_16[11:8],gpio_data[10],pwm_gen[10],tone_gen[10],GPIO_IO[10],in[10],EICRA[21:20],EIMSK[10],INT[10],,uart_txd[5]);
	GPIO_imp IO12(clk_i,rst_i,out_16[15:12],gpio_data[11],pwm_gen[11],tone_gen[11],GPIO_IO[11],in[11],EICRA[23:22],EIMSK[11],INT[11],uart_rxd[5],);
	GPIO_imp IO13(clk_i,rst_i,out_16[19:16],gpio_data[12],pwm_gen[12],tone_gen[12],GPIO_IO[12],in[12],EICRA[25:24],EIMSK[12],INT[12],,uart_txd[6]);
	GPIO_imp IO14(clk_i,rst_i,out_16[23:20],gpio_data[13],pwm_gen[13],tone_gen[13],GPIO_IO[13],in[13],EICRA[27:26],EIMSK[13],INT[13],uart_rxd[6],);
	GPIO_imp IO15(clk_i,rst_i,out_16[27:24],gpio_data[14],pwm_gen[14],tone_gen[14],GPIO_IO[14],in[14],EICRA[29:28],EIMSK[14],INT[14],,uart_txd[7]);
	GPIO_imp IO16(clk_i,rst_i,out_16[31:28],gpio_data[15],pwm_gen[15],tone_gen[15],GPIO_IO[15],in[15],EICRA[31:30],EIMSK[15],INT[15],uart_rxd[7],);
	GPIO_imp IO17(clk_i,rst_i,out_24[3:0],gpio_data[16],pwm_gen[16],tone_gen[16],GPIO_IO[16],in[16],EICRB[1:0],EIMSK[16],INT[16],,uart_txd[8]);
	GPIO_imp IO18(clk_i,rst_i,out_24[7:4],gpio_data[17],pwm_gen[17],tone_gen[17],GPIO_IO[17],in[17],EICRB[3:2],EIMSK[17],INT[17],uart_rxd[8],);
	GPIO_imp IO19(clk_i,rst_i,out_24[11:8],gpio_data[18],pwm_gen[18],tone_gen[18],GPIO_IO[18],in[18],EICRB[5:4],EIMSK[18],INT[18],,uart_txd[9]);
	GPIO_imp IO20(clk_i,rst_i,out_24[15:12],gpio_data[19],pwm_gen[19],tone_gen[19],GPIO_IO[19],in[19],EICRB[7:6],EIMSK[19],INT[19],uart_rxd[9],);
	GPIO_imp IO21(clk_i,rst_i,out_24[19:16],gpio_data[20],pwm_gen[20],tone_gen[20],GPIO_IO[20],in[20],EICRB[9:8],EIMSK[20],INT[20],,uart_txd[10]);
	GPIO_imp IO22(clk_i,rst_i,out_24[23:20],gpio_data[21],pwm_gen[21],tone_gen[21],GPIO_IO[21],in[21],EICRB[11:10],EIMSK[21],INT[21],uart_rxd[10],);
	GPIO_imp IO23(clk_i,rst_i,out_24[27:24],gpio_data[22],pwm_gen[22],tone_gen[22],GPIO_IO[22],in[22],EICRB[13:12],EIMSK[22],INT[22],,uart_txd[11]);
	GPIO_imp IO24(clk_i,rst_i,out_24[31:28],gpio_data[23],pwm_gen[23],tone_gen[23],GPIO_IO[23],in[23],EICRB[15:14],EIMSK[23],INT[23],uart_rxd[11],);
	GPIO_imp IO25(clk_i,rst_i,out_32[3:0],gpio_data[24],pwm_gen[24],tone_gen[24],GPIO_IO[24],in[24],EICRB[17:16],EIMSK[24],INT[24],,uart_txd[12]);
	GPIO_imp IO26(clk_i,rst_i,out_32[7:4],gpio_data[25],pwm_gen[25],tone_gen[25],GPIO_IO[25],in[25],EICRB[19:18],EIMSK[25],INT[25],uart_rxd[12],);
	GPIO_imp IO27(clk_i,rst_i,out_32[11:8],gpio_data[26],pwm_gen[26],tone_gen[26],GPIO_IO[26],in[26],EICRB[21:20],EIMSK[26],INT[26],,uart_txd[13]);
	GPIO_imp IO28(clk_i,rst_i,out_32[15:12],gpio_data[27],pwm_gen[27],tone_gen[27],GPIO_IO[27],in[27],EICRB[23:22],EIMSK[27],INT[27],uart_rxd[13],);
	GPIO_imp IO29(clk_i,rst_i,out_32[19:16],gpio_data[28],pwm_gen[28],tone_gen[28],GPIO_IO[28],in[28],EICRB[25:24],EIMSK[28],INT[28],,uart_txd[14]);
	GPIO_imp IO30(clk_i,rst_i,out_32[23:20],gpio_data[29],pwm_gen[29],tone_gen[29],GPIO_IO[29],in[29],EICRB[27:26],EIMSK[29],INT[29],uart_rxd[14],);
	GPIO_imp IO31(clk_i,rst_i,out_32[27:24],gpio_data[30],pwm_gen[30],tone_gen[30],GPIO_IO[30],in[30],EICRB[29:28],EIMSK[30],INT[30],,uart_txd[15]);
	GPIO_imp IO32(clk_i,rst_i,out_32[31:28],gpio_data[31],pwm_gen[31],tone_gen[31],GPIO_IO[31],in[31],EICRB[31:30],EIMSK[31],INT[31],uart_rxd[15],);



endmodule

