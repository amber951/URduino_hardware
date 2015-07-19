`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:41:00 04/14/2015 
// Design Name: 
// Module Name:    uart_control 
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
module uart_control(
print_data_o,		//data signal
	tf_push_o,			//control sinnal
	/////////////////////////////////////////////////
	wb_clk_i, 
	
	// Wishbone signals
	wb_rst_i, wb_adr_i, wb_dat_i, wb_dat_o, wb_we_i, wb_stb_i, wb_cyc_i, wb_ack_o, wb_sel_i,
	int_o, // interrupt request

	// UART	signals
	// serial input/output
	uartA_txd, uartA_rxd,	uartB_txd, uartB_rxd,	uartC_txd, uartC_rxd,	uartD_txd, uartD_rxd
//	uart2_txd, uart2_rxd	
`ifdef UART_HAS_BAUDRATE_OUTPUT
	, baud_o
`endif
    );
	 input [15:0]uartA_rxd;
	 output [15:0]uartA_txd;
	 
	 input [15:0]uartB_rxd;
	 output [15:0]uartB_txd;
	 
	 input [15:0]uartC_rxd;
	 output [15:0]uartC_txd;
	 
	 input [15:0]uartD_rxd;
	 output [15:0]uartD_txd;
	 
	 
	  //assign uartA_txd[15:0]={uart16_txd,uart15_txd,uart14_txd,uart13_txd,uart12_txd,uart11_txd,uart10_txd,uart9_txd,uart8_txd,uart7_txd,uart6_txd,uart5_txd,uart4_txd,uart3_txd,uart2_txd,uart1_txd};
	 // assign uartB_txd[15:0]={uart16_txd,uart15_txd,uart14_txd,uart13_txd,uart12_txd,uart11_txd,uart10_txd,uart9_txd,uart8_txd,uart7_txd,uart6_txd,uart5_txd,uart4_txd,uart3_txd,uart2_txd,uart1_txd};
	  
	//	assign uartC_txd[15:0]={uart16_txd,uart15_txd,uart14_txd,uart13_txd,uart12_txd,uart11_txd,uart10_txd,uart9_txd,uart8_txd,uart7_txd,uart6_txd,uart5_txd,uart4_txd,uart3_txd,uart2_txd,uart1_txd};
	 // assign uartD_txd[15:0]={uart16_txd,uart15_txd,uart14_txd,uart13_txd,uart12_txd,uart11_txd,uart10_txd,uart9_txd,uart8_txd,uart7_txd,uart6_txd,uart5_txd,uart4_txd,uart3_txd,uart2_txd,uart1_txd};
	  
//	  input uart1_rxd;

	  
	 output								[7:0] print_data_o;
	 
output								tf_push_o;

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
	
	wire wire_uartA_ack_o;
	wire [31:0] wire_uartA_data_o;
	wire wire_uartA_interrupt;
	
	wire wire_uartB_ack_o;
	wire [31:0] wire_uartB_data_o;
	wire wire_uartB_interrupt;
	
	wire wire_uartC_ack_o;
	wire [31:0] wire_uartC_data_o;
	wire wire_uartC_interrupt;
	
	wire wire_uartD_ack_o;
	wire [31:0] wire_uartD_data_o;
	wire wire_uartD_interrupt;
	
	
	
	reg ack_o;
	reg [31:0]data_o;
	reg int_oo;

	
	assign int_o=int_oo;
	assign wb_dat_o=data_o;
	assign wb_ack_o=ack_o;
	
	always@*
	//(posedge wb_clk_i)
	begin
		if (wb_adr_i[31:24]==8'h60)
			begin
			ack_o=wire_uartA_ack_o;
			data_o=wire_uartA_data_o;
			int_oo=wire_uartA_interrupt;
			end
		else if (wb_adr_i[31:24]==8'h61)
			begin
			ack_o=wire_uartB_ack_o;
			data_o=wire_uartB_data_o;
			int_oo=wire_uartB_interrupt;
			end
		else if (wb_adr_i[31:24]==8'h62)
			begin
			ack_o=wire_uartC_ack_o;
			data_o=wire_uartC_data_o;
			int_oo=wire_uartC_interrupt;
			end
		else if (wb_adr_i[31:24]==8'h63)
			begin
			ack_o=wire_uartD_ack_o;
			data_o=wire_uartD_data_o;
			int_oo=wire_uartD_interrupt;
			end
			
		else
			begin
			ack_o=0;
			data_o=32'b0;
			int_oo=0;
			end
		
	end
	
uart_group uart_groupA(
   .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[31:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uartA_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[31:24]==8'h60) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:24]==8'h60) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uartA_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uartA_interrupt), 
  .uart_txd(uartA_txd), 
  .uart_rxd(uartA_rxd)
  
);

uart_group uart_groupB(
.wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[31:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uartB_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[31:24]==8'h61) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:24]==8'h61) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uartB_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uartB_interrupt), 
  .uart_txd(uartB_txd), 
  .uart_rxd(uartB_rxd)
  
);
/*
uart_group uart_groupC(.wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[31:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uartC_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[31:24]==8'h62) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:24]==8'h62) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uartC_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uartC_interrupt), 
  .uart_txd(uartC_txd), 
  .uart_rxd(uartC_rxd)
);

uart_group uart_groupD(.wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[31:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uartD_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[31:24]==8'h63) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:24]==8'h63) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uartD_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uartD_interrupt), 
  .uart_txd(uartD_txd), 
  .uart_rxd(uartD_rxd)
 
);


uart uart1(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart1_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[31:20]==12'h601) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:20]==12'h601) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart1_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart1_interrupt), 
  .stx_pad_o(uart1_txd), 
  .srx_pad_i(uartA_rxd[0]),
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
  .wb_stb_i( (wb_adr_i[31:20]==12'h602) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:20]==12'h602) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart2_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart2_interrupt), 
  .stx_pad_o(uart2_txd), 
  .srx_pad_i(uartA_rxd[1]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)
  );

  uart uart3(
  .wb_clk_i(wb_clk_i), 
  .wb_rst_i(wb_rst_i), 
  .wb_adr_i(wb_adr_i[5:0]), 
  .wb_dat_i(wb_dat_i), 
  .wb_dat_o(wire_uart3_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[31:20]==12'h603) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:20]==12'h603) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart3_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart3_interrupt), // interrupt request
  .stx_pad_o(uart3_txd), 
  .srx_pad_i(uartA_rxd[2]),
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
  .wb_stb_i( (wb_adr_i[31:20]==12'h604) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:20]==12'h604) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart4_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart4_interrupt), // interrupt request
  .stx_pad_o(uart4_txd), 
  .srx_pad_i(uartA_rxd[3]),
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
  .wb_stb_i( (wb_adr_i[31:20]==12'h605) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:20]==12'h605) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart5_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart5_interrupt), // interrupt request
  .stx_pad_o(uart5_txd), 
  .srx_pad_i(uartA_rxd[4]),
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
  .wb_stb_i( (wb_adr_i[31:20]==12'h606) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:20]==12'h606) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart6_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart6_interrupt), // interrupt request
  .stx_pad_o(uart6_txd), 
  .srx_pad_i(uartA_rxd[5]),
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
  .wb_stb_i( (wb_adr_i[31:20]==12'h607) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:20]==12'h607) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart7_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart7_interrupt), // interrupt request
  .stx_pad_o(uart7_txd), 
  .srx_pad_i(uartA_rxd[6]),
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
  .wb_stb_i( (wb_adr_i[31:20]==12'h608) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:20]==12'h608) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart8_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart8_interrupt), // interrupt request
  .stx_pad_o(uart8_txd), 
  .srx_pad_i(uartA_rxd[7]),
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
  .wb_dat_o(wire_uart1_data_o), 
  .wb_we_i(wb_we_i), 
  .wb_stb_i( (wb_adr_i[31:20]==12'h609) ?wb_stb_i:1'b0), 
  .wb_cyc_i( (wb_adr_i[31:20]==12'h609) ?wb_cyc_i:1'b0), 
  .wb_ack_o(wire_uart1_ack_o), 
  .wb_sel_i(wb_sel_i),
  .int_o(wire_uart1_interrupt), 
  .stx_pad_o(uart9_txd), 
  .srx_pad_i(uartA_rxd[8]),
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,

  );
  
*/

endmodule
