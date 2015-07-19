module or1200_sys(
    input clk_i, //48 MHz
    input rst_n,

    // buttons
    input [15:0] SW,
    // uart interface
    //input uartA_rxd,
    //output uartA_txd,
    
    // segments
    output [31:0] LEDR,
	
	input openRISC_STALL,
	
	output [31:0]openRISC_pc,
	
	//For ram top module
	input			RAM_WE,
	input	[15:0] 	RAM_ADDR,
	input	[31:0]	RAM_DATA_I,
	output	[31:0]	RAM_DATA_O,
	//////////////////////////////
	//UART signals	
	output [7:0] print_data_o,
	output tf_push_o,
	//GPIO signals
	output [7:0] GPIO_o,
	input  [1:0] GPIO_i,
	//inout GPIO_IO
	inout [31:0]GPIO_IO_PORTA,
	inout [31:0]GPIO_IO_PORTB,
	inout [31:0]GPIO_IO_PORTC,
	inout [31:0]GPIO_IO_PORTD

);
   wire [15:0]uartA_rxd;
   wire [15:0]uartA_txd;
	
	wire [15:0]uartB_rxd;
   wire [15:0]uartB_txd;
	
	wire [15:0]uartC_rxd;
   wire [15:0]uartC_txd;
	
	wire [15:0]uartD_rxd;
   wire [15:0]uartD_txd;
	
	
	
    

wire [31:0]openRISC_pc;
wire rst = ~rst_n;

	// **************************************************
	// Wires from OR1200 Inst Master to Conmax m0
	// **************************************************
	wire wire_iwb_ack_i;
	wire wire_iwb_cyc_o;
	wire wire_iwb_stb_o;
	wire [31:0] wire_iwb_data_i;
	wire [31:0] wire_iwb_data_o;
	wire [31:0] wire_iwb_addr_o;
	wire [3:0] wire_iwb_sel_o;
	wire wire_iwb_we_o;
	wire wire_iwb_err_i;
	wire wire_iwb_rty_i;
	
	// **************************************************
	// Wires from OR1200 Data Master to Conmax m1
	// **************************************************
	wire wire_dwb_ack_i;
	wire wire_dwb_cyc_o;
	wire wire_dwb_stb_o;
	wire [31:0] wire_dwb_data_i;
	wire [31:0] wire_dwb_data_o;
	wire [31:0] wire_dwb_addr_o;
	wire [3:0] wire_dwb_sel_o;
	wire wire_dwb_we_o;
	wire wire_dwb_err_i;
	wire wire_dwb_rty_i;
	
	// **************************************************
	// Wires from Conmax s0 to onchip_ram0
	// **************************************************
	wire wire_ram0_ack_o;
	wire wire_ram0_cyc_i;
	wire wire_ram0_stb_i;
	wire [31:0] wire_ram0_data_i;
	wire [31:0] wire_ram0_data_o;
	wire [31:0] wire_ram0_addr_i;
	wire [3:0] wire_ram0_sel_i;
	wire wire_ram0_we_i;

	
	
	 // Wires from Conmax s1 to Timer
	// **************************************************
	wire wire_Timer_ack_o;
	wire wire_Timer_cyc_i;
	wire wire_Timer_stb_i;
	wire [31:0] wire_Timer_data_i;
	wire [31:0] wire_Timer_data_o;
	wire [31:0] wire_Timer_addr_i;
	wire [3:0] wire_Timer_sel_i;
	wire wire_Timer_we_i;	
	wire [31:0]pwm_gen_A;
	wire [31:0]pwm_gen_B;
	wire [31:0]pwm_gen_C;
	wire [31:0]pwm_gen_D;
	
	wire [31:0]tone_gen_A;
	wire [31:0]tone_gen_B;
	wire [31:0]tone_gen_C;
	wire [31:0]tone_gen_D;
	
	
 
 
 // Wires from Conmax s2 to portA
	// **************************************************
	wire wire_portA_ack_o;
	wire wire_portA_cyc_i;
	wire wire_portA_stb_i;
	wire [31:0] wire_portA_data_i;
	wire [31:0] wire_portA_data_o;
	wire [31:0] wire_portA_addr_i;
	wire [3:0] wire_portA_sel_i;
	wire wire_portA_we_i;
	wire wire_external_interrupt_A;
	
	// Wires from Conmax s3 to portB
	// **************************************************
	wire wire_portB_ack_o;
	wire wire_portB_cyc_i;
	wire wire_portB_stb_i;
	wire [31:0] wire_portB_data_i;
	wire [31:0] wire_portB_data_o;
	wire [31:0] wire_portB_addr_i;
	wire [3:0] wire_portB_sel_i;
	wire wire_portB_we_i;
	wire wire_external_interrupt_B;
  // **************************************************
// Wires from Conmax s4 to portC
	// **************************************************
	wire wire_portC_ack_o;
	wire wire_portC_cyc_i;
	wire wire_portC_stb_i;
	wire [31:0] wire_portC_data_i;
	wire [31:0] wire_portC_data_o;
	wire [31:0] wire_portC_addr_i;
	wire [3:0] wire_portC_sel_i;
	wire wire_portC_we_i;
	wire wire_external_interrupt_C;
  // **************************************************
 
// Wires from Conmax s5 to portD
	// **************************************************
	wire wire_portD_ack_o;
	wire wire_portD_cyc_i;
	wire wire_portD_stb_i;
	wire [31:0] wire_portD_data_i;
	wire [31:0] wire_portD_data_o;
	wire [31:0] wire_portD_addr_i;
	wire [3:0] wire_portD_sel_i;
	wire wire_portD_we_i;
	wire wire_external_interrupt_D;
  // **************************************************
   
		// Wires from Conmax 6 uartCON
	// **************************************************
	wire wire_uart_control_ack_o;
	wire wire_uart_control_cyc_i;
	wire wire_uart_control_stb_i;
	wire [31:0] wire_uart_control_data_i;
	wire [31:0] wire_uart_control_data_o;
	wire [31:0] wire_uart_control_addr_i;
	wire [3:0] wire_uart_control_sel_i;
	wire wire_uart_control_we_i;
	wire wire_uart_control_interrupt;

 
	

wire int_pending;
assign wire_external_interrupt=wire_external_interrupt_A|wire_external_interrupt_B|wire_external_interrupt_C|wire_external_interrupt_D;
or1200_top u_or1200(
  // System
  
 .int_pending(int_pending),
  .clk_i(clk_i), 
  .rst_i(rst), 
  .pic_ints_i({wire_external_interrupt,17'b0,wire_uart_interrupt,wire_gpio_interrupt}), 
  .clmode_i(2'b00),
  //added
  //pc of each core
  .openRISC_pc(openRISC_pc),
  // Instruction WISHBONE INTERFACE
  .iwb_clk_i(clk_i), 
  .iwb_rst_i(rst), 
  .iwb_ack_i(wire_iwb_ack_i), 
  .iwb_err_i(wire_iwb_err_i), 
  .iwb_rty_i(wire_iwb_rty_i), 
  .iwb_dat_i(wire_iwb_data_i),
  .iwb_cyc_o(wire_iwb_cyc_o), 
  .iwb_adr_o(wire_iwb_addr_o), 
  .iwb_stb_o(wire_iwb_stb_o), 
  .iwb_we_o(wire_iwb_we_o), 
  .iwb_sel_o(wire_iwb_sel_o), 
  .iwb_dat_o(wire_iwb_data_o),
`ifdef OR1200_WB_CAB
  .iwb_cab_o(),
`endif
//`ifdef OR1200_WB_B3
//  iwb_cti_o(), 
//  iwb_bte_o(),
//`endif
  // Data WISHBONE INTERFACE
  .dwb_clk_i(clk_i), 
  .dwb_rst_i(rst), 
  .dwb_ack_i(wire_dwb_ack_i), 
  .dwb_err_i(wire_dwb_err_i), 
  .dwb_rty_i(wire_dwb_rty_i), 
  .dwb_dat_i(wire_dwb_data_i),
  .dwb_cyc_o(wire_dwb_cyc_o), 
  .dwb_adr_o(wire_dwb_addr_o), 
  .dwb_stb_o(wire_dwb_stb_o), 
  .dwb_we_o(wire_dwb_we_o), 
  .dwb_sel_o(wire_dwb_sel_o), 
  .dwb_dat_o(wire_dwb_data_o),
`ifdef OR1200_WB_CAB
  .dwb_cab_o(),
`endif
//`ifdef OR1200_WB_B3
//  dwb_cti_o(), 
//  dwb_bte_o(),
//`endif

  // External Debug Interface
  .dbg_stall_i(openRISC_STALL), 
  .dbg_ewt_i(1'b0),  
  .dbg_lss_o(), 
  .dbg_is_o(), 
  .dbg_wp_o(), 
  .dbg_bp_o(),
  .dbg_stb_i(1'b0), 
  .dbg_we_i(1'b0),
  .dbg_adr_i(0), 
  .dbg_dat_i(0), 
  .dbg_dat_o(), 
  .dbg_ack_o(),
  
//`ifdef OR1200_BIST
//  // RAM BIST
//  mbist_si_i(), 
//  mbist_so_o(), 
//  mbist_ctrl_i(),
//`endif
  // Power Management
  .pm_cpustall_i(0),
  .pm_clksd_o(), 
  .pm_dc_gate_o(), 
  .pm_ic_gate_o(), 
  .pm_dmmu_gate_o(), 
  .pm_immu_gate_o(), 
  .pm_tt_gate_o(), 
  .pm_cpu_gate_o(), 
  .pm_wakeup_o(), 
  .pm_lvolt_o()
);

wb_conmax_top u_wb(
  .clk_i(clk_i), 
  .rst_i(rst),

  // Master 0 Interface
  .m0_data_i(wire_iwb_data_o), 
  .m0_data_o(wire_iwb_data_i), 
  .m0_addr_i(wire_iwb_addr_o), 
  .m0_sel_i(wire_iwb_sel_o), 
  .m0_we_i(wire_iwb_we_o), 
  .m0_cyc_i(wire_iwb_cyc_o),
  .m0_stb_i(wire_iwb_stb_o), 
  .m0_ack_o(wire_iwb_ack_i), 
  .m0_err_o(wire_iwb_err_i), 
  .m0_rty_o(wire_iwb_rty_i), 
//  .m0_cab_i(),

  // Master 1 Interface
  .m1_data_i(wire_dwb_data_o), 
  .m1_data_o(wire_dwb_data_i), 
  .m1_addr_i(wire_dwb_addr_o), 
  .m1_sel_i(wire_dwb_sel_o), 
  .m1_we_i(wire_dwb_we_o), 
  .m1_cyc_i(wire_dwb_cyc_o),
  .m1_stb_i(wire_dwb_stb_o), 
  .m1_ack_o(wire_dwb_ack_i), 
  .m1_err_o(wire_dwb_err_i), 
  .m1_rty_o(wire_dwb_rty_i), 
//  .m0_cab_i(),

  // Slave 0 Interface
  .s0_data_i(wire_ram0_data_o), 
  .s0_data_o(wire_ram0_data_i), 
  .s0_addr_o(wire_ram0_addr_i), 
  .s0_sel_o(wire_ram0_sel_i), 
  .s0_we_o(wire_ram0_we_i), 
  .s0_cyc_o(wire_ram0_cyc_i),
  .s0_stb_o(wire_ram0_stb_i), 
  .s0_ack_i(wire_ram0_ack_o), 
  .s0_err_i(0), 
  .s0_rty_i(0), 
  //.s0_cab_o(),

// Slave 1 Interface
  
	.s5_data_i(wire_Timer_data_o), 
  .s5_data_o(wire_Timer_data_i), 
  .s5_addr_o(wire_Timer_addr_i), 
  .s5_sel_o(wire_Timer_sel_i), 
  .s5_we_o(wire_Timer_we_i), 
  .s5_cyc_o(wire_Timer_cyc_i),
  .s5_stb_o(wire_Timer_stb_i), 
  .s5_ack_i(wire_Timer_ack_o), 
  .s5_err_i(0), 
  .s5_rty_i(0),
  // Slave 2 Interface
  
  .s1_data_i(wire_portA_data_o), 
  .s1_data_o(wire_portA_data_i), 
  .s1_addr_o(wire_portA_addr_i), 
  .s1_sel_o(wire_portA_sel_i), 
  .s1_we_o(wire_portA_we_i), 
  .s1_cyc_o(wire_portA_cyc_i),
  .s1_stb_o(wire_portA_stb_i), 
  .s1_ack_i(wire_portA_ack_o), 
  .s1_err_i(0), 
  .s1_rty_i(0),
 
  
  
 
 // Slave 3Interface
  .s2_data_i(wire_portB_data_o), 
  .s2_data_o(wire_portB_data_i), 
  .s2_addr_o(wire_portB_addr_i), 
  .s2_sel_o(wire_portB_sel_i), 
  .s2_we_o(wire_portB_we_i), 
  .s2_cyc_o(wire_portB_cyc_i),
  .s2_stb_o(wire_portB_stb_i), 
  .s2_ack_i(wire_portB_ack_o), 
  .s2_err_i(0), 
  .s2_rty_i(0),
  
   // Slave 3Interface
  .s3_data_i(wire_portC_data_o), 
  .s3_data_o(wire_portC_data_i), 
  .s3_addr_o(wire_portC_addr_i), 
  .s3_sel_o(wire_portC_sel_i), 
  .s3_we_o(wire_portC_we_i), 
  .s3_cyc_o(wire_portC_cyc_i),
  .s3_stb_o(wire_portC_stb_i), 
  .s3_ack_i(wire_portC_ack_o), 
  .s3_err_i(0), 
  .s3_rty_i(0),
  
   // Slave 3Interface
  .s4_data_i(wire_portD_data_o), 
  .s4_data_o(wire_portD_data_i), 
  .s4_addr_o(wire_portD_addr_i), 
  .s4_sel_o(wire_portD_sel_i), 
  .s4_we_o(wire_portD_we_i), 
  .s4_cyc_o(wire_portD_cyc_i),
  .s4_stb_o(wire_portD_stb_i), 
  .s4_ack_i(wire_portD_ack_o), 
  .s4_err_i(0), 
  .s4_rty_i(0),
 
  
  // Slave10 Interface
  .s6_data_i(wire_uart_control_data_o), 
  .s6_data_o(wire_uart_control_data_i), 
  .s6_addr_o(wire_uart_control_addr_i), 
  .s6_sel_o(wire_uart_control_sel_i), 
  .s6_we_o(wire_uart_control_we_i), 
  .s6_cyc_o(wire_uart_control_cyc_i),
  .s6_stb_o(wire_uart_control_stb_i), 
  .s6_ack_i(wire_uart_control_ack_o), 
  .s6_err_i(0), 
  .s6_rty_i(0)
  
  
  
  
  );
  
ram0_top u_ram0(
    .clk_i(clk_i),
    .rst_i(rst),
    
    .wb_stb_i(wire_ram0_stb_i),
    .wb_cyc_i(wire_ram0_cyc_i),
    .wb_ack_o(wire_ram0_ack_o),
    .wb_addr_i(wire_ram0_addr_i),
    .wb_sel_i(wire_ram0_sel_i),
    .wb_we_i(wire_ram0_we_i),
    .wb_data_i(wire_ram0_data_i),
    .wb_data_o(wire_ram0_data_o),
	
	//For controlling
	.openRISC_STALL(openRISC_STALL),	
	.RAM_WE(RAM_WE),
	.RAM_ADDR(RAM_ADDR),
	.RAM_DATA_I(RAM_DATA_I),
	.RAM_DATA_O(RAM_DATA_O),
	//GPIO signals
	.GPIO_o(GPIO_o),
	.GPIO_i(GPIO_i)
  );


Timer Timer(
    .clk_i(clk_i),
    .rst_i(rst),
    
    .wb_stb_i(wire_Timer_stb_i),
    .wb_cyc_i(wire_Timer_cyc_i),
    .wb_ack_o(wire_Timer_ack_o),
    .wb_addr_i(wire_Timer_addr_i),
    .wb_sel_i(wire_Timer_sel_i),
    .wb_we_i(wire_Timer_we_i),
    .wb_data_i(wire_Timer_data_i),
    .wb_data_o(wire_Timer_data_o),
	 .pwm_gen_A(pwm_gen_A),
	 .pwm_gen_B(pwm_gen_B),
	 .pwm_gen_C(pwm_gen_C),
	 .pwm_gen_D(pwm_gen_D),
	 
	 .tone_gen_A(tone_gen_A),
	.tone_gen_B(tone_gen_B),
	  .tone_gen_C(tone_gen_C),
	 .tone_gen_D(tone_gen_D)
	 
	
	
	
	 
);

port portA(
    .clk_i(clk_i),
    .rst_i(rst),
    
    .wb_stb_i(wire_portA_stb_i),
    .wb_cyc_i(wire_portA_cyc_i),
    .wb_ack_o(wire_portA_ack_o),
    .wb_addr_i(wire_portA_addr_i),
    .wb_sel_i(wire_portA_sel_i),
    .wb_we_i(wire_portA_we_i),
    .wb_data_i(wire_portA_data_i),
    .wb_data_o(wire_portA_data_o),
	 .GPIO_IO(GPIO_IO_PORTA),
	 .OUT_INT(wire_external_interrupt_A),
	 .int_pending(int_pending),
	 .openRISC_pc(openRISC_pc),
	 .pwm_gen(pwm_gen_A),
	 .tone_gen(tone_gen_A),
	 
	 .uart_txd(uartA_txd),
	 .uart_rxd(uartA_rxd)
);

port portB(
    .clk_i(clk_i),
    .rst_i(rst),
    
    .wb_stb_i(wire_portB_stb_i),
    .wb_cyc_i(wire_portB_cyc_i),
    .wb_ack_o(wire_portB_ack_o),
    .wb_addr_i(wire_portB_addr_i),
    .wb_sel_i(wire_portB_sel_i),
    .wb_we_i(wire_portB_we_i),
    .wb_data_i(wire_portB_data_i),
    .wb_data_o(wire_portB_data_o),
	 .GPIO_IO(GPIO_IO_PORTB),
	 .OUT_INT(wire_external_interrupt_B),
	 .int_pending(int_pending),
	 .openRISC_pc(openRISC_pc),
	 .pwm_gen(pwm_gen_B),
	 
	 .tone_gen(tone_gen_B),
	.uart_txd(uartB_txd),
	 .uart_rxd(uartB_rxd)
	 
);

port portC(
    .clk_i(clk_i),
    .rst_i(rst),
    
    .wb_stb_i(wire_portC_stb_i),
    .wb_cyc_i(wire_portC_cyc_i),
    .wb_ack_o(wire_portC_ack_o),
    .wb_addr_i(wire_portC_addr_i),
    .wb_sel_i(wire_portC_sel_i),
    .wb_we_i(wire_portC_we_i),
    .wb_data_i(wire_portC_data_i),
    .wb_data_o(wire_portC_data_o),
	 .GPIO_IO(GPIO_IO_PORTC),
	 .OUT_INT(wire_external_interrupt_C),
	 .int_pending(int_pending),
	 .openRISC_pc(openRISC_pc),
	 .pwm_gen(pwm_gen_C),
	 
	 .tone_gen(tone_gen_C),
	.uart_txd(uartC_txd),
	 .uart_rxd(uartC_rxd)
	 
);

port portD(
    .clk_i(clk_i),
    .rst_i(rst),
    
    .wb_stb_i(wire_portD_stb_i),
    .wb_cyc_i(wire_portD_cyc_i),
    .wb_ack_o(wire_portD_ack_o),
    .wb_addr_i(wire_portD_addr_i),
    .wb_sel_i(wire_portD_sel_i),
    .wb_we_i(wire_portD_we_i),
    .wb_data_i(wire_portD_data_i),
    .wb_data_o(wire_portD_data_o),
	 .GPIO_IO(GPIO_IO_PORTD),
	 .OUT_INT(wire_external_interrupt_D),
	 .int_pending(int_pending),
	 .openRISC_pc(openRISC_pc),
	 .pwm_gen(pwm_gen_D),
	
	 .tone_gen(tone_gen_D),
	 .uart_txd(uartD_txd),
	 .uart_rxd(uartD_rxd)
	
);

uart_control uart_control(
	//UART signals
  //.print_data_o(print_data_o),
  //.tf_push_o(tf_push_o),
  ///////////////////////////////////////
  .wb_clk_i(clk_i), 
  
  // Wishbone signals
  .wb_rst_i(rst), 
  .wb_adr_i(wire_uart_control_addr_i[31:0]), 
  .wb_dat_i(wire_uart_control_data_i), 
  .wb_dat_o(wire_uart_control_data_o), 
  .wb_we_i(wire_uart_control_we_i), 
  .wb_stb_i(wire_uart_control_stb_i), 
  .wb_cyc_i(wire_uart_control_cyc_i), 
  .wb_ack_o(wire_uart_control_ack_o), 
  .wb_sel_i(wire_uart_control_sel_i),
  .int_o(wire_uart_control_interrupt), // interrupt request

.uartA_txd(uartA_txd),
.uartA_rxd(uartA_rxd),

.uartB_txd(uartB_txd),
.uartB_rxd(uartB_rxd),

.uartC_txd(uartC_txd),
.uartC_rxd(uartC_rxd),

.uartD_txd(uartD_txd),
.uartD_rxd(uartD_rxd)


  // UART  signals
  // serial input/output
  
  
//`ifdef UART_HAS_BAUDRATE_OUTPUT
//  .baud_o()
//`endif
  );

/*
uart uartA(
	//UART signals
 // .print_data_o(print_data_o),
 // .tf_push_o(tf_push_o),
  ///////////////////////////////////////
  .wb_clk_i(clk_i), 
  
  // Wishbone signals
  .wb_rst_i(rst), 
  .wb_adr_i(wire_uartA_addr_i[5:0]), 
  .wb_dat_i(wire_uartA_data_i), 
  .wb_dat_o(wire_uartA_data_o), 
  .wb_we_i(wire_uartA_we_i), 
  .wb_stb_i(wire_uartA_stb_i), 
  .wb_cyc_i(wire_uartA_cyc_i), 
  .wb_ack_o(wire_uartA_ack_o), 
  .wb_sel_i(wire_uartA_sel_i),
  .int_o(wire_uartA_interrupt), // interrupt request

  // UART  signals
  // serial input/output
  .stx_pad_o(uartA_txd), 
  .srx_pad_i(uartA_rxd),

  // modem signals
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,
//`ifdef UART_HAS_BAUDRATE_OUTPUT
//  .baud_o()
//`endif
  );
*/
/*
uart uartB(
	//UART signals
  //.print_data_o(print_data_o),
  //.tf_push_o(tf_push_o),
  ///////////////////////////////////////
  .wb_clk_i(clk_i), 
  
  // Wishbone signals
  .wb_rst_i(rst), 
  .wb_adr_i(wire_uartB_addr_i[5:0]), 
  .wb_dat_i(wire_uartB_data_i), 
  .wb_dat_o(wire_uartB_data_o), 
  .wb_we_i(wire_uartB_we_i), 
  .wb_stb_i(wire_uartB_stb_i), 
  .wb_cyc_i(wire_uartB_cyc_i), 
  .wb_ack_o(wire_uartB_ack_o), 
  .wb_sel_i(wire_uartB_sel_i),
  .int_o(wire_uartB_interrupt), // interrupt request

  // UART  signals
  // serial input/output
  .stx_pad_o(uartB_txd), 
  .srx_pad_i(uartB_rxd),

  // modem signals
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,
//`ifdef UART_HAS_BAUDRATE_OUTPUT
//  .baud_o()
//`endif
  );
  */
  /*
  uart uartC(
	//UART signals
  //.print_data_o(print_data_o),
  //.tf_push_o(tf_push_o),
  ///////////////////////////////////////
  .wb_clk_i(clk_i), 
  
  // Wishbone signals
  .wb_rst_i(rst), 
  .wb_adr_i(wire_uartC_addr_i[5:0]), 
  .wb_dat_i(wire_uartC_data_i), 
  .wb_dat_o(wire_uartC_data_o), 
  .wb_we_i(wire_uartC_we_i), 
  .wb_stb_i(wire_uartC_stb_i), 
  .wb_cyc_i(wire_uartC_cyc_i), 
  .wb_ack_o(wire_uartC_ack_o), 
  .wb_sel_i(wire_uartC_sel_i),
  .int_o(wire_uartC_interrupt), // interrupt request

  // UART  signals
  // serial input/output
  .stx_pad_o(uartC_txd), 
  .srx_pad_i(uartC_rxd),

  // modem signals
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,
//`ifdef UART_HAS_BAUDRATE_OUTPUT
//  .baud_o()
//`endif
  );
  
  uart uartD(
	//UART signals
  //.print_data_o(print_data_o),
  //.tf_push_o(tf_push_o),
  ///////////////////////////////////////
  .wb_clk_i(clk_i), 
  
  // Wishbone signals
  .wb_rst_i(rst), 
  .wb_adr_i(wire_uartD_addr_i[5:0]), 
  .wb_dat_i(wire_uartD_data_i), 
  .wb_dat_o(wire_uartD_data_o), 
  .wb_we_i(wire_uartD_we_i), 
  .wb_stb_i(wire_uartD_stb_i), 
  .wb_cyc_i(wire_uartD_cyc_i), 
  .wb_ack_o(wire_uartD_ack_o), 
  .wb_sel_i(wire_uartD_sel_i),
  .int_o(wire_uartD_interrupt), // interrupt request

  // UART  signals
  // serial input/output
  .stx_pad_o(uartD_txd), 
  .srx_pad_i(uartD_rxd),

  // modem signals
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,
//`ifdef UART_HAS_BAUDRATE_OUTPUT
//  .baud_o()
//`endif
  );
  
  
  uart uartE(
	//UART signals
  //.print_data_o(print_data_o),
  //.tf_push_o(tf_push_o),
  ///////////////////////////////////////
  .wb_clk_i(clk_i), 
  
  // Wishbone signals
  .wb_rst_i(rst), 
  .wb_adr_i(wire_uartE_addr_i[5:0]), 
  .wb_dat_i(wire_uartE_data_i), 
  .wb_dat_o(wire_uartE_data_o), 
  .wb_we_i(wire_uartE_we_i), 
  .wb_stb_i(wire_uartE_stb_i), 
  .wb_cyc_i(wire_uartE_cyc_i), 
  .wb_ack_o(wire_uartE_ack_o), 
  .wb_sel_i(wire_uartE_sel_i),
  .int_o(wire_uartE_interrupt), // interrupt request

  // UART  signals
  // serial input/output
  .stx_pad_o(uartE_txd), 
  .srx_pad_i(uartE_rxd),

  // modem signals
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,
//`ifdef UART_HAS_BAUDRATE_OUTPUT
//  .baud_o()
//`endif
  );
  
  uart uartF(
	//UART signals
  //.print_data_o(print_data_o),
  //.tf_push_o(tf_push_o),
  ///////////////////////////////////////
  .wb_clk_i(clk_i), 
  
  // Wishbone signals
  .wb_rst_i(rst), 
  .wb_adr_i(wire_uartF_addr_i[5:0]), 
  .wb_dat_i(wire_uartF_data_i), 
  .wb_dat_o(wire_uartF_data_o), 
  .wb_we_i(wire_uartF_we_i), 
  .wb_stb_i(wire_uartF_stb_i), 
  .wb_cyc_i(wire_uartF_cyc_i), 
  .wb_ack_o(wire_uartF_ack_o), 
  .wb_sel_i(wire_uartF_sel_i),
  .int_o(wire_uartF_interrupt), // interrupt request

  // UART  signals
  // serial input/output
  .stx_pad_o(uartF_txd), 
  .srx_pad_i(uartF_rxd),

  // modem signals
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,
//`ifdef UART_HAS_BAUDRATE_OUTPUT
//  .baud_o()
//`endif
  );
  
  uart uartG(
	//UART signals
  //.print_data_o(print_data_o),
  //.tf_push_o(tf_push_o),
  ///////////////////////////////////////
  .wb_clk_i(clk_i), 
  
  // Wishbone signals
  .wb_rst_i(rst), 
  .wb_adr_i(wire_uartG_addr_i[5:0]), 
  .wb_dat_i(wire_uartG_data_i), 
  .wb_dat_o(wire_uartG_data_o), 
  .wb_we_i(wire_uartG_we_i), 
  .wb_stb_i(wire_uartG_stb_i), 
  .wb_cyc_i(wire_uartG_cyc_i), 
  .wb_ack_o(wire_uartG_ack_o), 
  .wb_sel_i(wire_uartG_sel_i),
  .int_o(wire_uartG_interrupt), // interrupt request

  // UART  signals
  // serial input/output
  .stx_pad_o(uartG_txd), 
  .srx_pad_i(uartG_rxd),

  // modem signals
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,
//`ifdef UART_HAS_BAUDRATE_OUTPUT
//  .baud_o()
//`endif
  );
  


  uart uartH(
	//UART signals
  //.print_data_o(print_data_o),
  //.tf_push_o(tf_push_o),
  ///////////////////////////////////////
  .wb_clk_i(clk_i), 
  
  // Wishbone signals
  .wb_rst_i(rst), 
  .wb_adr_i(wire_uartH_addr_i[5:0]), 
  .wb_dat_i(wire_uartH_data_i), 
  .wb_dat_o(wire_uartH_data_o), 
  .wb_we_i(wire_uartH_we_i), 
  .wb_stb_i(wire_uartH_stb_i), 
  .wb_cyc_i(wire_uartH_cyc_i), 
  .wb_ack_o(wire_uartH_ack_o), 
  .wb_sel_i(wire_uartH_sel_i),
  .int_o(wire_uartH_interrupt), // interrupt request

  // UART  signals
  // serial input/output
  .stx_pad_o(uartH_txd), 
  .srx_pad_i(uartH_rxd),

  // modem signals
  .rts_pad_o(), 
  .cts_pad_i(1'b0), 
  .dtr_pad_o(), 
  .dsr_pad_i(1'b0), 
  .ri_pad_i(1'b0), 
  .dcd_pad_i(1'b0)//,
//`ifdef UART_HAS_BAUDRATE_OUTPUT
//  .baud_o()
//`endif
  );
  */


endmodule
