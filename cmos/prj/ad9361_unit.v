// ==================================================
//  ____         _                ____                      
// | __ )  _ __ (_)  __ _  _ __  / ___|  _   _  _ __    ___ 
// |  _ \ | '__|| | / _` || '_ \ \___ \ | | | || '_ \  / _ \
// | |_) || |   | || (_| || | | | ___) || |_| || | | ||  __/
// |____/ |_|   |_| \__,_||_| |_||____/  \__,_||_| |_| \___|
//                                                          
// Programed By: BrianSune
// Contact: briansune@gmail.com
// 

`timescale 1ns / 1ps

module ad9361_unit(
	// 200MHz LVDS differential clock and high-valid reset signal.
	input 					sys_clk,
	input 					sys_nrst,
	
	// AD9361 4-wire SPI interface.
	output 					ad9361_spi_cs,		// SPI_ENB
	output 					ad9361_spi_sclk,	// SPI_CLK
	output 					ad9361_spi_mosi,	// SPI_DI
	input 					ad9361_spi_miso,	// SPI_DO
	
	// AD9361 control signal.
	output 					en_agc,				// EN_AGC
	output 					enable,				// ENABLE
	output 					resetb,				// RESETB
	output 					txnrx,				// TXNRX
	output 					sync_in,			// SYNC_IN
	output 		[3 : 0]  	ctrl_in,			// CTRL_IN
	input  		[7 : 0]		ctrl_out,			// CTRL_OUT
	
	// AD9361 data interface.
	input 					data_clk_p,			// DATA_CLK		
	input 					data_clk_n,			// DATA_CLK		
	input 					rx_frame_p,			// RX_FRAME
	input 					rx_frame_n,			// RX_FRAME
	input signed [11 : 0]	p0_d,				// P1_DATA
	
	output 					fb_clk_p,				// FB_CLK
	output 					fb_clk_n,				// FB_CLK
	
	output 					tx_frame_p,			// TX_FRAME
	output 					tx_frame_n,			// TX_FRAME
	output signed [11 : 0]	p1_d,				// P0_DATA
	
	// LED status signals.
	output 		 [6 : 0]  	led,
	
	output					bufg_rx_clk,
	output signed [15 : 0]	rx_q,
	output signed [15 : 0]	rx_i
);
	
	DR1_LOGIC_BUFG BUFG_inst0(
		.o	(bufg_rx_clk),
		.i	(data_clk_p)
	);
	
	// AD9361 SPI init module inst.
	ad9361_init uut_ad9361_init (
		.sys_clk(sys_clk),
		.sys_nrst(sys_nrst),
		.ad9361_spi_cs(ad9361_spi_cs),
		.ad9361_spi_sclk(ad9361_spi_sclk),
		.ad9361_spi_mosi(ad9361_spi_mosi),
		.ad9361_spi_miso(ad9361_spi_miso),
		.en_agc(en_agc),
		.enable(enable),
		.resetb(resetb),
		.txnrx(txnrx),
		.sync_in(sync_in),
		.ctrl_in(ctrl_in),
		.ctrl_out(ctrl_out),
		.led(led)
	); 
	
	assign fb_clk_p = data_clk_p;
	assign fb_clk_n = 1'b0;
	
	assign tx_frame_p = 1'b1;
	assign tx_frame_n = 1'b0;
	assign p1_d = 12'd0;
	
	reg signed [11:0] 	i_path_r, q_path_r;
	
	wire	[11 : 0]	ad9361_bus_in_he;
	wire	[11 : 0]	ad9361_bus_in_le;
	wire				ad9361_frm_in_he;
	wire				ad9361_frm_in_le;
	
	assign rx_q = {4'd0, q_path_r};
	assign rx_i = {4'd0, i_path_r};
	
	always @(posedge bufg_rx_clk or negedge sys_nrst) begin
		if (!sys_nrst) begin
			i_path_r <= 12'd0;
			q_path_r <= 12'd0;
		end else begin
			// if (ad9361_frm_in_he & ad9361_frm_in_le)begin
				i_path_r <= ad9361_bus_in_le;
				q_path_r <= ad9361_bus_in_he;
			// end
			
			// if (!ad9361_frm_in_he & !ad9361_frm_in_le)begin
				// q_path_r2 <= ad9361_bus_in_le;
				// i_path_r2 <= ad9361_bus_in_he;
			// end
		end
	end
	
	genvar i;
	
	generate
		for(i=0;i<12;i=i+1)begin : ad_if_bus
			DR1_LOGIC_IDDR #(
				.PIPEMODE		("PIPED"),
				.ASYNCRST		("ENABLE")
			) IDDR_bus (
				.q0		(ad9361_bus_in_he[i]),
				.q1		(ad9361_bus_in_le[i]),
				.clk	(bufg_rx_clk),   // 1-bit clock input
				.d		(p0_d[i]),
				.rst	(~sys_nrst)
			);
		end
	endgenerate
	
	DR1_LOGIC_IDDR #(
		.PIPEMODE		("PIPED"),
		.ASYNCRST		("ENABLE")
	) IDDR_bus (
		.q0		(ad9361_frm_in_he),
		.q1		(ad9361_frm_in_le),
		.clk	(bufg_rx_clk),   // 1-bit clock input
		.d		(rx_frame_p),
		.rst	(~sys_nrst)
	);

endmodule
