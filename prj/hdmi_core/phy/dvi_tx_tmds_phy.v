
module dvi_tx_tmds_phy(
	
	input				pixel_clock,
	input				ddr_bit_clock,
	input				reset,
	input	[9 : 0]		data,
	output				tmds_lane
);
	
    wire[9:0] S_tmds_data_ch0;

    assign S_tmds_data_ch0 = {data[0],
                              data[1],
                              data[2],
                              data[3],
                              data[4],
                              data[5],
                              data[6],
                              data[7],
                              data[8],
                              data[9]};
	// -------------------------------------------

    lane_lvds_10_1 u0_lane_lvds_10_1(
        .I_pixel_clk  ( pixel_clock      ),
        .I_serial_clk ( ddr_bit_clock    ),
        .I_rst        ( reset            ),
        .I_data_in    ( S_tmds_data_ch0  ),
        .O_serial_out ( tmds_lane        )
    );

endmodule
