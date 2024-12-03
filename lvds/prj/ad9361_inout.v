// ==========================================================
//  ____         _                ____                      
// | __ )  _ __ (_)  __ _  _ __  / ___|  _   _  _ __    ___ 
// |  _ \ | '__|| | / _` || '_ \ \___ \ | | | || '_ \  / _ \
// | |_) || |   | || (_| || | | | ___) || |_| || | | ||  __/
// |____/ |_|   |_| \__,_||_| |_||____/  \__,_||_| |_| \___|
//                                                          
// ==========================================================
// Programed By: BrianSune
// Contact: briansune@gmail.com
// 
// ==========================================================

`timescale 1ns / 1ps

module ad9361_inout(
	
	input wire		[7-1 : 0]	data_in_from_pins,
	output wire		[14-1 : 0]	data_in_to_device,
	
	input wire		[14-1 : 0]	data_out_from_device,
	output wire		[7-1 : 0]	data_out_to_pins,
	
	output wire								clk_to_pins,
	input wire								clk_in,
	output wire								clk_out,
	input wire								clk_reset,
	input wire								io_reset
);
	
	wire		clk_div;
	
	DR1_PHY_LCLK #(
		.CEMD         ( "SYNC"     ),
		.CLKSEL       ( "ORG"      ),
		.DIV          ( "1"        ),
		.LCLK         ( "BYPASS"   ),
		.GSR          ( "DISABLE"  )
	)clkout_buf_inst(
		.clkin        ( clk_in     ), //  1-Bit input.
		.ce           ( 1'b1       ), //  1-Bit input.
		.rst          ( 1'b0       ), //  1-Bit input.
		.clkout       ( clk_div    ), //  1-Bit output.
		.clkdivout    (            )  //  1-Bit output.
	);
	
	assign clk_out = clk_div; // This is regional clock;
	
	genvar pin_count;
	
	generate
		for (pin_count = 0; pin_count < 7; pin_count = pin_count + 1) begin: pins
			DR1_LOGIC_IDDR #(
				.ASYNCRST     ( "ENABLE"   ),
				.PIPEMODE     ( "PIPED"    )
			)iddr_inst(
				.q0           ( data_in_to_device[pin_count]         ), //  1-Bit output. 1 bit posedge data output.
				.q1           ( data_in_to_device[7 + pin_count] ), //  1-Bit output. 1 bit negedge data output.
				.clk          ( clk_div                              ), //  1-Bit input. Sampling clock.                
				.d            ( data_in_from_pins[pin_count]         ), //  1-Bit input. DDR data entered on I/O.       
				.rst          ( io_reset                             )  //  1-Bit input. Reset signal,high active.      
			);
			
			DR1_LOGIC_ODDR #(
				.ASYNCRST     ( "ENABLE"   )
			)oddr_inst(
				.d0           ( data_out_from_device[pin_count]         ), //  1-Bit input. 1 bit posedge input data.
				.d1           ( data_out_from_device[7 + pin_count] ), //  1-Bit input. 1 bit negedge input data.
				.clk          ( clk_div                                 ), //  1-Bit input. Synchronous clock.
				.q            ( data_out_to_pins[pin_count]             ), //  1-Bit output. 1 bit DDR edge output data.
				.rst          ( io_reset                                )  //  1-Bit input. Reset,high active.
			);
		end
	endgenerate
	
	DR1_LOGIC_ODDR #(
		.ASYNCRST     ( "ENABLE"   )
	)oddr_inst(
		.d0           ( 1'b1         ), //  1-Bit input. 1 bit posedge input data.
		.d1           ( 1'b0         ), //  1-Bit input. 1 bit negedge input data.
		.clk          ( clk_div      ), //  1-Bit input. Synchronous clock.
		.q            ( clk_to_pins  ), //  1-Bit output. 1 bit DDR edge output data.
		.rst          ( clk_reset    )  //  1-Bit input. Reset,high active.
	);
	
endmodule

// ==========================================================
// End of File
// ==========================================================
