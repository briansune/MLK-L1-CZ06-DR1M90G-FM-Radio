module top_ad9361_unit_0 
(
    input             sys_clk ,
    input             sys_nrst ,
    output            ad9361_spi_cs ,
    output            ad9361_spi_sclk ,
    output            ad9361_spi_mosi ,
    input             ad9361_spi_miso ,
    output            en_agc ,
    output            enable ,
    output            resetb ,
    output            txnrx ,
    output            sync_in ,
    output      [3:0] ctrl_in ,
    input       [7:0] ctrl_out ,
    input             data_clk_p ,
    input             data_clk_n ,
    input             rx_frame_p ,
    input             rx_frame_n ,
    input      [11:0] p0_d ,
    output            fb_clk_p ,
    output            fb_clk_n ,
    output            tx_frame_p ,
    output            tx_frame_n ,
    output     [11:0] p1_d ,
    output      [6:0] led ,
    output            bufg_rx_clk ,
    output     [15:0] rx_q ,
    output     [15:0] rx_i
) ;

    ad9361_unit ad9361_unit (
        .sys_clk(sys_clk) ,
        .sys_nrst(sys_nrst) ,
        .ad9361_spi_cs(ad9361_spi_cs) ,
        .ad9361_spi_sclk(ad9361_spi_sclk) ,
        .ad9361_spi_mosi(ad9361_spi_mosi) ,
        .ad9361_spi_miso(ad9361_spi_miso) ,
        .en_agc(en_agc) ,
        .enable(enable) ,
        .resetb(resetb) ,
        .txnrx(txnrx) ,
        .sync_in(sync_in) ,
        .ctrl_in(ctrl_in) ,
        .ctrl_out(ctrl_out) ,
        .data_clk_p(data_clk_p) ,
        .data_clk_n(data_clk_n) ,
        .rx_frame_p(rx_frame_p) ,
        .rx_frame_n(rx_frame_n) ,
        .p0_d(p0_d) ,
        .fb_clk_p(fb_clk_p) ,
        .fb_clk_n(fb_clk_n) ,
        .tx_frame_p(tx_frame_p) ,
        .tx_frame_n(tx_frame_n) ,
        .p1_d(p1_d) ,
        .led(led) ,
        .bufg_rx_clk(bufg_rx_clk) ,
        .rx_q(rx_q) ,
        .rx_i(rx_i)
    );


endmodule
