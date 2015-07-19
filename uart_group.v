`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:33:25 04/14/2015 
// Design Name: 
// Module Name:    uart_group 
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
module uart_group(wb_clk_i, 
	
	
	wb_rst_i, wb_adr_i, wb_dat_i, wb_dat_o, wb_we_i, wb_stb_i, wb_cyc_i, wb_ack_o, wb_sel_i,
	int_o, 
uart_txd,uart_rxd


    );
	 
	  

	 // WISHBONE interface
	 input 								 wb_clk_i;

input 								 wb_rst_i;
input  							[31:0] wb_adr_i;
input  						[31:0]	 wb_dat_i;
output 							[31:0] 	 wb_dat_o;
input 								 wb_we_i;
input 								 wb_stb_i;
input 								 wb_cyc_i;
input [3:0]							 wb_sel_i;
output 								 wb_ack_o;
output 								 int_o;



 input [15:0]uart_rxd;
	 output [15:0]uart_txd;

	wire wire_uart1_ack_o;
	wire [31:0] wire_uart1_data_o;
	wire wire_uart1_interrupt;
	
	wire wire_uart2_ack_o;
	wire [31:0] wire_uart2_data_o;
	wire wire_uart2_interrupt;
	
	wire wire_uart3_ack_o;
	wire [31:0] wire_uart3_data_o;
	wire wire_uart3_interrupt;
	
	wire wire_uart4_ack_o;
	wire [31:0] wire_uart4_data_o;
	wire wire_uart4_interrupt;
	
	wire wire_uart5_ack_o;
	wire [31:0] wire_uart5_data_o;
	wire wire_uart5_interrupt;
	
	wire wire_uart6_ack_o;
	wire [31:0] wire_uart6_data_o;
	wire wire_uart6_interrupt;
	
	wire wire_uart7_ack_o;
	wire [31:0] wire_uart7_data_o;
	wire wire_uart7_interrupt;
	
	wire wire_uart8_ack_o;
	wire [31:0] wire_uart8_data_o;
	wire wire_uart8_interrupt;
	
	wire wire_uart9_ack_o;
	wire [31:0] wire_uart9_data_o;
	wire wire_uart9_interrupt;
	
	wire wire_uart10_ack_o;
	wire [31:0] wire_uart10_data_o;
	wire wire_uart10_interrupt;
	
	wire wire_uart11_ack_o;
	wire [31:0] wire_uart11_data_o;
	wire wire_uart11_interrupt;
	
	wire wire_uart12_ack_o;
	wire [31:0] wire_uart12_data_o;
	wire wire_uart12_interrupt;
	
	wire wire_uart13_ack_o;
	wire [31:0] wire_uart13_data_o;
	wire wire_uart13_interrupt;
	
	wire wire_uart14_ack_o;
	wire [31:0] wire_uart14_data_o;
	wire wire_uart14_interrupt;
	
	wire wire_uart15_ack_o;
	wire [31:0] wire_uart15_data_o;
	wire wire_uart15_interrupt;
	
	wire wire_uart16_ack_o;
	wire [31:0] wire_uart16_data_o;
	wire wire_uart16_interrupt;
	
	reg ack_o;
	reg [31:0]data_o;
	reg int_oo;

	
	assign int_o=int_oo;
	assign wb_dat_o=data_o;
	assign wb_ack_o=ack_o;
	
	always@*
	//(posedge wb_clk_i)
	begin
		if (wb_adr_i[23:20]==4'h0)
			begin
			ack_o=wire_uart1_ack_o;
			data_o=wire_uart1_data_o;
			int_oo=wire_uart1_interrupt;
			end
		else if (wb_adr_i[23:20]==4'h1)
			begin
			ack_o=wire_uart2_ack_o;
			data_o=wire_uart2_data_o;
			int_oo=wire_uart2_interrupt;
			end
		else if (wb_adr_i[23:20]==4'h2)
			begin
			ack_o=wire_uart3_ack_o;
			data_o=wire_uart3_data_o;
			int_oo=wire_uart3_interrupt;
			end
		else if (wb_adr_i[23:20]==4'h3)
			begin
			ack_o=wire_uart4_ack_o;
			data_o=wire_uart4_data_o;
			int_oo=wire_uart4_interrupt;
			end
		else if (wb_adr_i[23:20]==4'h4)
			begin
			ack_o=wire_uart5_ack_o;
			data_o=wire_uart5_data_o;
			int_oo=wire_uart5_interrupt;
			end
		else if (wb_adr_i[23:20]==4'h5)
			begin
			ack_o=wire_uart6_ack_o;
			data_o=wire_uart6_data_o;
			int_oo=wire_uart6_interrupt;
			end
		else if (wb_adr_i[23:20]==4'h6)
			begin
			ack_o=wire_uart7_ack_o;
			data_o=wire_uart7_data_o;
			int_oo=wire_uart7_interrupt;
			end
		else if (wb_adr_i[23:20]==4'h7)
			begin
			ack_o=wire_uart8_ack_o;
			data_o=wire_uart8_data_o;
			int_oo=wire_uart8_interrupt;
			end
		else if (wb_adr_i[23:20]==4'h8)
			begin
			ack_o=wire_uart9_ack_o;
			data_o=wire_uart9_data_o;
			int_oo=wire_uart9_interrupt;
			end
		else if (wb_adr_i[23:20]==4'h9)
			begin
			ack_o=wire_uart10_ack_o;
			data_o=wire_uart10_data_o;
			int_oo=wire_uart10_interrupt;
			end
		else if (wb_adr_i[23:20]==4'ha)
			begin
			ack_o=wire_uart11_ack_o;
			data_o=wire_uart11_data_o;
			int_oo=wire_uart11_interrupt;
			end
		else if (wb_adr_i[23:20]==4'hb)
			begin
			ack_o=wire_uart12_ack_o;
			data_o=wire_uart12_data_o;
			int_oo=wire_uart12_interrupt;
			end
		else if (wb_adr_i[23:20]==4'hc)
			begin
			ack_o=wire_uart13_ack_o;
			data_o=wire_uart13_data_o;
			int_oo=wire_uart13_interrupt;
			end
		else if (wb_adr_i[23:20]==4'hd)
			begin
			ack_o=wire_uart14_ack_o;
			data_o=wire_uart14_data_o;
			int_oo=wire_uart14_interrupt;
			end
		else if (wb_adr_i[23:20]==4'he)
			begin
			ack_o=wire_uart15_ack_o;
			data_o=wire_uart15_data_o;
			int_oo=wire_uart15_interrupt;
			end
		
		else if (wb_adr_i[23:20]==4'hf)
			begin
			ack_o=wire_uart16_ack_o;
			data_o=wire_uart16_data_o;
			int_oo=wire_uart16_interrupt;
			end
		else
			begin
			ack_o=0;
			data_o=32'b0;
			int_oo=0;
			end

	end
	
	uart uart1(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart1_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h0) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h0) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart1_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart1_interrupt), 
  .stx_pad_o(uart_txd[0]), 
  .srx_pad_i(uart_rxd[0]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
	
	uart uart2(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart2_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h1) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h1) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart2_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart2_interrupt), 
  .stx_pad_o(uart_txd[1]), 
  .srx_pad_i(uart_rxd[1]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart3(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart3_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h2) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h2) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart3_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart3_interrupt), 
  .stx_pad_o(uart_txd[2]), 
  .srx_pad_i(uart_rxd[2]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart4(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart4_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h3) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h3) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart4_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart4_interrupt), 
  .stx_pad_o(uart_txd[3]), 
  .srx_pad_i(uart_rxd[3]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart5(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart5_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h4) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h4) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart5_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart5_interrupt), 
  .stx_pad_o(uart_txd[4]), 
  .srx_pad_i(uart_rxd[4]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart6(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart6_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h5) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h5) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart6_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart6_interrupt), 
  .stx_pad_o(uart_txd[5]), 
  .srx_pad_i(uart_rxd[5]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  
  uart uart7(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart7_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h6) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h6) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart7_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart7_interrupt), 
  .stx_pad_o(uart_txd[6]), 
  .srx_pad_i(uart_rxd[6]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart8(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart8_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h7) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h7) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart8_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart8_interrupt), 
  .stx_pad_o(uart_txd[7]), 
  .srx_pad_i(uart_rxd[7]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart9(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart9_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h8) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h8) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart9_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart9_interrupt), 
  .stx_pad_o(uart_txd[8]), 
  .srx_pad_i(uart_rxd[8]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart10(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart10_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'h9) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'h9) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart10_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart10_interrupt), 
  .stx_pad_o(uart_txd[9]), 
  .srx_pad_i(uart_rxd[9]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart11(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart11_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'ha) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'ha) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart11_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart11_interrupt), 
  .stx_pad_o(uart_txd[10]), 
  .srx_pad_i(uart_rxd[10]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart12(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart12_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'hb) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'hb) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart12_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart12_interrupt), 
  .stx_pad_o(uart_txd[11]), 
  .srx_pad_i(uart_rxd[11]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart13(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart13_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'hc) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'hc) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart13_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart13_interrupt), 
  .stx_pad_o(uart_txd[12]), 
  .srx_pad_i(uart_rxd[12]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart14(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart14_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'hd) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'hd) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart14_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart14_interrupt), 
  .stx_pad_o(uart_txd[13]), 
  .srx_pad_i(uart_rxd[13]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart15(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart15_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'he) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'he) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart15_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart15_interrupt), 
  .stx_pad_o(uart_txd[14]), 
  .srx_pad_i(uart_rxd[14]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
  uart uart16(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart16_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[23:20]==4'hf) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[23:20]==4'hf) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart16_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart16_interrupt), 
  .stx_pad_o(uart_txd[15]), 
  .srx_pad_i(uart_rxd[15]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
	
endmodule
