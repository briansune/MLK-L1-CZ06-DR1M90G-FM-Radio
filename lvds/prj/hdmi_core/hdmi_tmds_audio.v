`timescale 1ns / 1ns

module hdmi_tmds_audio(
	
    // input				sys_clk_p,
    // input				sys_clk_n,
    input				clk_pixel,
    input				clk_pixel_x5,
    input				sys_nrst,
	
	input	[31 : 0]	hdmi_aud,
	// input	[15 : 0]	hdmi_r,
	
	// output				hdmi_cec,
	// input				hdmi_hdp,
	// output				hdmi_scl,
	// output				hdmi_sda,
	
	output				hdmi_clk,
	output	[2:0]		hdmi_d
);
	
	// assign hdmi_sda = 1'b1;
	// assign hdmi_scl = 1'b1;
	// assign hdmi_cec = 1'b1;
	
	// logic global_rst;
	
	// logic clk_pixel;
	// logic clk_pixel_x5;
	
	// dvi_pll_v2 dvi_pll_v2_inst0(
		
		// .clk_in1_p			(sys_clk_p),
		// .clk_in1_n			(sys_clk_n),
		
		// .resetn				(sys_nrst),
		// .pixel_clock		(clk_pixel),
		// .dvi_bit_clock		(clk_pixel_x5)
	// );
	
	// reg [31:0] audio_sample_word = 32'h00000000;
	
	
	// always @(posedge clk_pixel) audio_sample_word <= {audio_sample_word[16+:16] + 16'd8, audio_sample_word[0+:16] - 16'd32};
	
	reg [15:0] audio_sample_l;
	reg [15:0] audio_sample_r;
	reg	[15:0]	sampling_clk;
	wire [31:0] audio_sample_word = {audio_sample_l, audio_sample_r};
	
	always @(posedge clk_pixel)begin
		if(sampling_clk >= 16'd3093)begin
			audio_sample_l <= hdmi_aud[16+:16];
			audio_sample_r <= hdmi_aud[16+:16];
		end
		
		sampling_clk <= (sampling_clk >= 16'd3093) ? 16'd0 : sampling_clk + 16'd1;
	end
	
	reg [23:0] rgb = 24'd0;
	wire [11:0] cx, frame_width, screen_width;
	wire [10:0] cy, frame_height, screen_height;
	
	// Border test (left = red, top = green, right = blue, bottom = blue, fill = black)
	always @(posedge clk_pixel)begin
		rgb <= {cx == 0 ? ~8'd0 : 8'd0, 
				cy == 0 ? ~8'd0 : 8'd0,
				cx == screen_width - 1'd1 || cy == screen_height - 1'd1 ? ~8'd0 : 8'd0
		};
	end
	
	// 640x480 @ 59.94Hz
	hdmi#(
		// .DVI_OUTPUT				(1),
		.VIDEO_ID_CODE			(16),
		.VIDEO_REFRESH_RATE		(59.94),
		.AUDIO_RATE				(48000),
		.AUDIO_BIT_WIDTH		(16)
	)hdmi(
		.clk_pixel_x5(clk_pixel_x5),
		.clk_pixel(clk_pixel),
		.clk_audio(clk_pixel),
		.reset(~sys_nrst),
		.rgb(rgb),
		.audio_sample_word(audio_sample_word),
		.tmds(hdmi_d),
		.tmds_clock(hdmi_clk),
		.cx(cx),
		.cy(cy),
		.frame_width(frame_width),
		.frame_height(frame_height),
		.screen_width(screen_width),
		.screen_height(screen_height)
	);
	
endmodule
