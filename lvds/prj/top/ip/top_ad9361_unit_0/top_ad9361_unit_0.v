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
    input             ad9361_dclk ,
    input      [13:0] ad9361_din ,
    output     [13:0] ad9361_dout ,
    output      [6:0] led ,
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
        .ad9361_dclk(ad9361_dclk) ,
        .ad9361_din(ad9361_din) ,
        .ad9361_dout(ad9361_dout) ,
        .led(led) ,
        .rx_q(rx_q) ,
        .rx_i(rx_i)
    );


endmodule
