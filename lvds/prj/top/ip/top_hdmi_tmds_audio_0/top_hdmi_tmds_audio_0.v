module top_hdmi_tmds_audio_0 
(
    input             clk_pixel ,
    input             clk_pixel_x5 ,
    input             sys_nrst ,
    input      [31:0] hdmi_aud ,
    output            hdmi_clk ,
    output      [2:0] hdmi_d
) ;

    hdmi_tmds_audio hdmi_tmds_audio (
        .clk_pixel(clk_pixel) ,
        .clk_pixel_x5(clk_pixel_x5) ,
        .sys_nrst(sys_nrst) ,
        .hdmi_aud(hdmi_aud) ,
        .hdmi_clk(hdmi_clk) ,
        .hdmi_d(hdmi_d)
    );


endmodule
