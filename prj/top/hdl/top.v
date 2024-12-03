module top (
    input     wire              sys_clk ,
    input     wire              sys_nrst ,
    input     wire              ad9361_spi_miso ,
    input     wire              data_clk_p ,
    input     wire              data_clk_n ,
    input     wire              rx_frame_p ,
    input     wire              rx_frame_n ,
    input     wire       [11:0] p0_d ,
    input     wire        [7:0] ctrl_out ,
    output    wire              ad9361_spi_cs ,
    output    wire              ad9361_spi_sclk ,
    output    wire              ad9361_spi_mosi ,
    output    wire              en_agc ,
    output    wire              enable ,
    output    wire              resetb ,
    output    wire              txnrx ,
    output    wire              sync_in ,
    output    wire        [3:0] ctrl_in ,
    output    wire       [11:0] p1_d ,
    output    wire              fb_clk_p ,
    output    wire              fb_clk_n ,
    output    wire              tx_frame_p ,
    output    wire              tx_frame_n ,
    output    wire        [6:0] led ,
    output    wire              hdmi_clk ,
    output    wire        [2:0] hdmi_d
) ;
    wire [28:0]       w_port__CIC_I__dout ;
    wire [28:0]       w_port__del_m_0__tap_i ;
    wire [28:0]       w_net__CIC_I__dout ;

    wire [28:0]       w_port__CIC_Q__dout ;
    wire [28:0]       w_port__del_m_0__tap_q ;
    wire [28:0]       w_net__CIC_Q__dout ;

    wire [31:0]       w_port__CORDIC_0__angle ;
    wire [31:0]       w_port__hdmi_tmds_audio_0__hdmi_aud ;
    wire [31:0]       w_net__CORDIC_0__angle ;

    wire [0:0]        w_port__Constant_0__dout ;
    wire              w_port__CIC_I__din_en ;
    wire              w_port__CIC_Q__din_en ;
    wire              w_port__CIC_I2__din_en ;
    wire              w_port__CIC_Q2__din_en ;
    wire              w_port__CORDIC_0__start ;
    wire [0:0]        w_net__Constant_0__dout ;

    wire              w_port__PLL_0__clk0_out ;
    wire              w_port__ad9361_unit_0__sys_clk ;
    wire              w_net__PLL_0__clk0_out ;

    wire              w_port__PLL_0__lock ;
    wire              w_port__ad9361_unit_0__sys_nrst ;
    wire [0:0]        w_port__reset2resetn__vector_a ;
    wire              w_port__del_m_0__aresetn ;
    wire              w_net__PLL_0__lock ;

    wire              w_port__PLL_1__clk0_out ;
    wire              w_port__hdmi_tmds_audio_0__clk_pixel ;
    wire              w_net__PLL_1__clk0_out ;

    wire              w_port__PLL_1__clk1_out ;
    wire              w_port__hdmi_tmds_audio_0__clk_pixel_x5 ;
    wire              w_net__PLL_1__clk1_out ;

    wire              w_port__PLL_1__lock ;
    wire              w_port__hdmi_tmds_audio_0__sys_nrst ;
    wire              w_net__PLL_1__lock ;

    wire              w_port__ad9361_unit_0__ad9361_spi_miso ;
    wire              w_net__ad9361_spi_miso ;

    wire              w_port__ad9361_unit_0__ad9361_spi_cs ;
    wire              w_net__ad9361_unit_0__ad9361_spi_cs ;

    wire              w_port__ad9361_unit_0__ad9361_spi_mosi ;
    wire              w_net__ad9361_unit_0__ad9361_spi_mosi ;

    wire              w_port__ad9361_unit_0__ad9361_spi_sclk ;
    wire              w_net__ad9361_unit_0__ad9361_spi_sclk ;

    wire              w_port__ad9361_unit_0__bufg_rx_clk ;
    wire              w_port__CIC_I__clk ;
    wire              w_port__CIC_Q__clk ;
    wire              w_port__del_m_0__aclk ;
    wire              w_port__CIC_I2__clk ;
    wire              w_port__CIC_Q2__clk ;
    wire              w_port__CORDIC_0__clk ;
    wire              w_net__ad9361_unit_0__bufg_rx_clk ;

    wire [3:0]        w_port__ad9361_unit_0__ctrl_in ;
    wire [3:0]        w_net__ad9361_unit_0__ctrl_in ;

    wire              w_port__ad9361_unit_0__en_agc ;
    wire              w_net__ad9361_unit_0__en_agc ;

    wire              w_port__ad9361_unit_0__enable ;
    wire              w_net__ad9361_unit_0__enable ;

    wire              w_port__ad9361_unit_0__fb_clk_n ;
    wire              w_net__ad9361_unit_0__fb_clk_n ;

    wire              w_port__ad9361_unit_0__fb_clk_p ;
    wire              w_net__ad9361_unit_0__fb_clk_p ;

    wire [6:0]        w_port__ad9361_unit_0__led ;
    wire [6:0]        w_net__ad9361_unit_0__led ;

    wire [11:0]       w_port__ad9361_unit_0__p1_d ;
    wire [11:0]       w_net__ad9361_unit_0__p1_d ;

    wire              w_port__ad9361_unit_0__resetb ;
    wire              w_net__ad9361_unit_0__resetb ;

    wire [15:0]       w_port__ad9361_unit_0__rx_i ;
    wire [15:0]       w_port__CIC_I__din ;
    wire [15:0]       w_net__ad9361_unit_0__rx_i ;

    wire [15:0]       w_port__ad9361_unit_0__rx_q ;
    wire [15:0]       w_port__CIC_Q__din ;
    wire [15:0]       w_net__ad9361_unit_0__rx_q ;

    wire              w_port__ad9361_unit_0__sync_in ;
    wire              w_net__ad9361_unit_0__sync_in ;

    wire              w_port__ad9361_unit_0__tx_frame_n ;
    wire              w_net__ad9361_unit_0__tx_frame_n ;

    wire              w_port__ad9361_unit_0__tx_frame_p ;
    wire              w_net__ad9361_unit_0__tx_frame_p ;

    wire              w_port__ad9361_unit_0__txnrx ;
    wire              w_net__ad9361_unit_0__txnrx ;

    wire [7:0]        w_port__ad9361_unit_0__ctrl_out ;
    wire [7:0]        w_net__ctrl_out ;

    wire              w_port__ad9361_unit_0__data_clk_n ;
    wire              w_net__data_clk_n ;

    wire              w_port__ad9361_unit_0__data_clk_p ;
    wire              w_net__data_clk_p ;

    wire [15:0]       w_port__del_m_0__out_i ;
    wire [15:0]       w_port__CIC_I2__din ;
    wire [15:0]       w_net__del_m_0__out_i ;

    wire [15:0]       w_port__del_m_0__out_q ;
    wire [15:0]       w_port__CIC_Q2__din ;
    wire [15:0]       w_net__del_m_0__out_q ;

    wire              w_port__hdmi_tmds_audio_0__hdmi_clk ;
    wire              w_net__hdmi_tmds_audio_0__hdmi_clk ;

    wire [2:0]        w_port__hdmi_tmds_audio_0__hdmi_d ;
    wire [2:0]        w_net__hdmi_tmds_audio_0__hdmi_d ;

    wire [11:0]       w_port__ad9361_unit_0__p0_d ;
    wire [11:0]       w_net__p0_d ;

    wire [0:0]        w_port__reset2resetn_0__result_vector ;
    wire              w_port__PLL_0__pllreset ;
    wire              w_port__PLL_1__pllreset ;
    wire [0:0]        w_net__reset2resetn_0__result_vector ;

    wire [0:0]        w_port__reset2resetn__result_vector ;
    wire              w_port__CIC_I__rst ;
    wire              w_port__CIC_Q__rst ;
    wire              w_port__CIC_I2__rst ;
    wire              w_port__CIC_Q2__rst ;
    wire              w_port__CORDIC_0__rst ;
    wire [0:0]        w_net__reset2resetn__result_vector ;

    wire              w_port__ad9361_unit_0__rx_frame_n ;
    wire              w_net__rx_frame_n ;

    wire              w_port__ad9361_unit_0__rx_frame_p ;
    wire              w_net__rx_frame_p ;

    wire              w_port__PLL_0__refclk ;
    wire              w_port__PLL_1__refclk ;
    wire              w_net__sys_clk ;

    wire [0:0]        w_port__reset2resetn_0__vector_a ;
    wire [0:0]        w_net__sys_nrst ;

    wire [30:0]       w_port__CIC_I2__dout ;
    wire [30:0]       w_port__CORDIC_0__xin ;
    wire [30:0]       w_net__CIC_I2__dout ;

    wire [30:0]       w_port__CIC_Q2__dout ;
    wire [30:0]       w_port__CORDIC_0__yin ;
    wire [30:0]       w_net__CIC_Q2__dout ;

    assign w_net__CIC_I__dout = w_port__CIC_I__dout ;
    assign w_port__del_m_0__tap_i = w_net__CIC_I__dout ;

    assign w_net__CIC_Q__dout = w_port__CIC_Q__dout ;
    assign w_port__del_m_0__tap_q = w_net__CIC_Q__dout ;

    assign w_net__CORDIC_0__angle = w_port__CORDIC_0__angle ;
    assign w_port__hdmi_tmds_audio_0__hdmi_aud = w_net__CORDIC_0__angle ;

    assign w_net__Constant_0__dout = w_port__Constant_0__dout ;
    assign w_port__CIC_I__din_en = w_net__Constant_0__dout ;
    assign w_port__CIC_Q__din_en = w_net__Constant_0__dout ;
    assign w_port__CIC_I2__din_en = w_net__Constant_0__dout ;
    assign w_port__CIC_Q2__din_en = w_net__Constant_0__dout ;
    assign w_port__CORDIC_0__start = w_net__Constant_0__dout ;

    assign w_net__PLL_0__clk0_out = w_port__PLL_0__clk0_out ;
    assign w_port__ad9361_unit_0__sys_clk = w_net__PLL_0__clk0_out ;

    assign w_net__PLL_0__lock = w_port__PLL_0__lock ;
    assign w_port__ad9361_unit_0__sys_nrst = w_net__PLL_0__lock ;
    assign w_port__reset2resetn__vector_a = w_net__PLL_0__lock ;
    assign w_port__del_m_0__aresetn = w_net__PLL_0__lock ;

    assign w_net__PLL_1__clk0_out = w_port__PLL_1__clk0_out ;
    assign w_port__hdmi_tmds_audio_0__clk_pixel = w_net__PLL_1__clk0_out ;

    assign w_net__PLL_1__clk1_out = w_port__PLL_1__clk1_out ;
    assign w_port__hdmi_tmds_audio_0__clk_pixel_x5 = w_net__PLL_1__clk1_out ;

    assign w_net__PLL_1__lock = w_port__PLL_1__lock ;
    assign w_port__hdmi_tmds_audio_0__sys_nrst = w_net__PLL_1__lock ;

    assign w_net__ad9361_spi_miso = ad9361_spi_miso ;
    assign w_port__ad9361_unit_0__ad9361_spi_miso = w_net__ad9361_spi_miso ;

    assign w_net__ad9361_unit_0__ad9361_spi_cs = w_port__ad9361_unit_0__ad9361_spi_cs ;
    assign ad9361_spi_cs = w_net__ad9361_unit_0__ad9361_spi_cs ;

    assign w_net__ad9361_unit_0__ad9361_spi_mosi = w_port__ad9361_unit_0__ad9361_spi_mosi ;
    assign ad9361_spi_mosi = w_net__ad9361_unit_0__ad9361_spi_mosi ;

    assign w_net__ad9361_unit_0__ad9361_spi_sclk = w_port__ad9361_unit_0__ad9361_spi_sclk ;
    assign ad9361_spi_sclk = w_net__ad9361_unit_0__ad9361_spi_sclk ;

    assign w_net__ad9361_unit_0__bufg_rx_clk = w_port__ad9361_unit_0__bufg_rx_clk ;
    assign w_port__CIC_I__clk = w_net__ad9361_unit_0__bufg_rx_clk ;
    assign w_port__CIC_Q__clk = w_net__ad9361_unit_0__bufg_rx_clk ;
    assign w_port__del_m_0__aclk = w_net__ad9361_unit_0__bufg_rx_clk ;
    assign w_port__CIC_I2__clk = w_net__ad9361_unit_0__bufg_rx_clk ;
    assign w_port__CIC_Q2__clk = w_net__ad9361_unit_0__bufg_rx_clk ;
    assign w_port__CORDIC_0__clk = w_net__ad9361_unit_0__bufg_rx_clk ;

    assign w_net__ad9361_unit_0__ctrl_in = w_port__ad9361_unit_0__ctrl_in ;
    assign ctrl_in = w_net__ad9361_unit_0__ctrl_in ;

    assign w_net__ad9361_unit_0__en_agc = w_port__ad9361_unit_0__en_agc ;
    assign en_agc = w_net__ad9361_unit_0__en_agc ;

    assign w_net__ad9361_unit_0__enable = w_port__ad9361_unit_0__enable ;
    assign enable = w_net__ad9361_unit_0__enable ;

    assign w_net__ad9361_unit_0__fb_clk_n = w_port__ad9361_unit_0__fb_clk_n ;
    assign fb_clk_n = w_net__ad9361_unit_0__fb_clk_n ;

    assign w_net__ad9361_unit_0__fb_clk_p = w_port__ad9361_unit_0__fb_clk_p ;
    assign fb_clk_p = w_net__ad9361_unit_0__fb_clk_p ;

    assign w_net__ad9361_unit_0__led = w_port__ad9361_unit_0__led ;
    assign led = w_net__ad9361_unit_0__led ;

    assign w_net__ad9361_unit_0__p1_d = w_port__ad9361_unit_0__p1_d ;
    assign p1_d = w_net__ad9361_unit_0__p1_d ;

    assign w_net__ad9361_unit_0__resetb = w_port__ad9361_unit_0__resetb ;
    assign resetb = w_net__ad9361_unit_0__resetb ;

    assign w_net__ad9361_unit_0__rx_i = w_port__ad9361_unit_0__rx_i ;
    assign w_port__CIC_I__din = w_net__ad9361_unit_0__rx_i ;

    assign w_net__ad9361_unit_0__rx_q = w_port__ad9361_unit_0__rx_q ;
    assign w_port__CIC_Q__din = w_net__ad9361_unit_0__rx_q ;

    assign w_net__ad9361_unit_0__sync_in = w_port__ad9361_unit_0__sync_in ;
    assign sync_in = w_net__ad9361_unit_0__sync_in ;

    assign w_net__ad9361_unit_0__tx_frame_n = w_port__ad9361_unit_0__tx_frame_n ;
    assign tx_frame_n = w_net__ad9361_unit_0__tx_frame_n ;

    assign w_net__ad9361_unit_0__tx_frame_p = w_port__ad9361_unit_0__tx_frame_p ;
    assign tx_frame_p = w_net__ad9361_unit_0__tx_frame_p ;

    assign w_net__ad9361_unit_0__txnrx = w_port__ad9361_unit_0__txnrx ;
    assign txnrx = w_net__ad9361_unit_0__txnrx ;

    assign w_net__ctrl_out = ctrl_out ;
    assign w_port__ad9361_unit_0__ctrl_out = w_net__ctrl_out ;

    assign w_net__data_clk_n = data_clk_n ;
    assign w_port__ad9361_unit_0__data_clk_n = w_net__data_clk_n ;

    assign w_net__data_clk_p = data_clk_p ;
    assign w_port__ad9361_unit_0__data_clk_p = w_net__data_clk_p ;

    assign w_net__del_m_0__out_i = w_port__del_m_0__out_i ;
    assign w_port__CIC_I2__din = w_net__del_m_0__out_i ;

    assign w_net__del_m_0__out_q = w_port__del_m_0__out_q ;
    assign w_port__CIC_Q2__din = w_net__del_m_0__out_q ;

    assign w_net__hdmi_tmds_audio_0__hdmi_clk = w_port__hdmi_tmds_audio_0__hdmi_clk ;
    assign hdmi_clk = w_net__hdmi_tmds_audio_0__hdmi_clk ;

    assign w_net__hdmi_tmds_audio_0__hdmi_d = w_port__hdmi_tmds_audio_0__hdmi_d ;
    assign hdmi_d = w_net__hdmi_tmds_audio_0__hdmi_d ;

    assign w_net__p0_d = p0_d ;
    assign w_port__ad9361_unit_0__p0_d = w_net__p0_d ;

    assign w_net__reset2resetn_0__result_vector = w_port__reset2resetn_0__result_vector ;
    assign w_port__PLL_0__pllreset = w_net__reset2resetn_0__result_vector ;
    assign w_port__PLL_1__pllreset = w_net__reset2resetn_0__result_vector ;

    assign w_net__reset2resetn__result_vector = w_port__reset2resetn__result_vector ;
    assign w_port__CIC_I__rst = w_net__reset2resetn__result_vector ;
    assign w_port__CIC_Q__rst = w_net__reset2resetn__result_vector ;
    assign w_port__CIC_I2__rst = w_net__reset2resetn__result_vector ;
    assign w_port__CIC_Q2__rst = w_net__reset2resetn__result_vector ;
    assign w_port__CORDIC_0__rst = w_net__reset2resetn__result_vector ;

    assign w_net__rx_frame_n = rx_frame_n ;
    assign w_port__ad9361_unit_0__rx_frame_n = w_net__rx_frame_n ;

    assign w_net__rx_frame_p = rx_frame_p ;
    assign w_port__ad9361_unit_0__rx_frame_p = w_net__rx_frame_p ;

    assign w_net__sys_clk = sys_clk ;
    assign w_port__PLL_0__refclk = w_net__sys_clk ;
    assign w_port__PLL_1__refclk = w_net__sys_clk ;

    assign w_net__sys_nrst = sys_nrst ;
    assign w_port__reset2resetn_0__vector_a = w_net__sys_nrst ;

    assign w_net__CIC_I2__dout = w_port__CIC_I2__dout ;
    assign w_port__CORDIC_0__xin = w_net__CIC_I2__dout ;

    assign w_net__CIC_Q2__dout = w_port__CIC_Q2__dout ;
    assign w_port__CORDIC_0__yin = w_net__CIC_Q2__dout ;

    top_ad9361_unit_0 ad9361_unit_0 (  .sys_clk(w_port__ad9361_unit_0__sys_clk)
                                     , .sys_nrst(w_port__ad9361_unit_0__sys_nrst)
                                     , .ad9361_spi_cs(w_port__ad9361_unit_0__ad9361_spi_cs)
                                     , .ad9361_spi_sclk(w_port__ad9361_unit_0__ad9361_spi_sclk)
                                     , .ad9361_spi_mosi(w_port__ad9361_unit_0__ad9361_spi_mosi)
                                     , .ad9361_spi_miso(w_port__ad9361_unit_0__ad9361_spi_miso)
                                     , .en_agc(w_port__ad9361_unit_0__en_agc)
                                     , .enable(w_port__ad9361_unit_0__enable)
                                     , .resetb(w_port__ad9361_unit_0__resetb)
                                     , .txnrx(w_port__ad9361_unit_0__txnrx)
                                     , .sync_in(w_port__ad9361_unit_0__sync_in)
                                     , .ctrl_in(w_port__ad9361_unit_0__ctrl_in)
                                     , .ctrl_out(w_port__ad9361_unit_0__ctrl_out)
                                     , .data_clk_p(w_port__ad9361_unit_0__data_clk_p)
                                     , .data_clk_n(w_port__ad9361_unit_0__data_clk_n)
                                     , .rx_frame_p(w_port__ad9361_unit_0__rx_frame_p)
                                     , .rx_frame_n(w_port__ad9361_unit_0__rx_frame_n)
                                     , .p0_d(w_port__ad9361_unit_0__p0_d)
                                     , .fb_clk_p(w_port__ad9361_unit_0__fb_clk_p)
                                     , .fb_clk_n(w_port__ad9361_unit_0__fb_clk_n)
                                     , .tx_frame_p(w_port__ad9361_unit_0__tx_frame_p)
                                     , .tx_frame_n(w_port__ad9361_unit_0__tx_frame_n)
                                     , .p1_d(w_port__ad9361_unit_0__p1_d)
                                     , .led(w_port__ad9361_unit_0__led)
                                     , .bufg_rx_clk(w_port__ad9361_unit_0__bufg_rx_clk)
                                     , .rx_q(w_port__ad9361_unit_0__rx_q)
                                     , .rx_i(w_port__ad9361_unit_0__rx_i) );

    top_PLL_0 PLL_0 (  .refclk(w_port__PLL_0__refclk)
                     , .clk0_out(w_port__PLL_0__clk0_out)
                     , .lock(w_port__PLL_0__lock)
                     , .pllreset(w_port__PLL_0__pllreset) );

    top_CIC_0 CIC_I (  .clk(w_port__CIC_I__clk)
                     , .din(w_port__CIC_I__din)
                     , .din_en(w_port__CIC_I__din_en)
                     , .rst(w_port__CIC_I__rst)
                     , .dout(w_port__CIC_I__dout)
                     , .dout_en() );

    top_Utility_Vector_Logic_0 reset2resetn (  .vector_a(w_port__reset2resetn__vector_a)
                                             , .result_vector(w_port__reset2resetn__result_vector) );

    top_Constant_0 Constant_0 (  .dout(w_port__Constant_0__dout) );

    top_CIC_1 CIC_Q (  .clk(w_port__CIC_Q__clk)
                     , .din(w_port__CIC_Q__din)
                     , .din_en(w_port__CIC_Q__din_en)
                     , .rst(w_port__CIC_Q__rst)
                     , .dout(w_port__CIC_Q__dout)
                     , .dout_en() );

    top_del_m_0 del_m_0 (  .aclk(w_port__del_m_0__aclk)
                         , .aresetn(w_port__del_m_0__aresetn)
                         , .tap_i(w_port__del_m_0__tap_i)
                         , .tap_q(w_port__del_m_0__tap_q)
                         , .out_i(w_port__del_m_0__out_i)
                         , .out_q(w_port__del_m_0__out_q) );

    top_CIC_2 CIC_I2 (  .clk(w_port__CIC_I2__clk)
                      , .din(w_port__CIC_I2__din)
                      , .din_en(w_port__CIC_I2__din_en)
                      , .rst(w_port__CIC_I2__rst)
                      , .dout(w_port__CIC_I2__dout)
                      , .dout_en() );

    top_CIC_3 CIC_Q2 (  .clk(w_port__CIC_Q2__clk)
                      , .din(w_port__CIC_Q2__din)
                      , .din_en(w_port__CIC_Q2__din_en)
                      , .rst(w_port__CIC_Q2__rst)
                      , .dout(w_port__CIC_Q2__dout)
                      , .dout_en() );

    top_CORDIC_0 CORDIC_0 (  .clk(w_port__CORDIC_0__clk)
                           , .rst(w_port__CORDIC_0__rst)
                           , .start(w_port__CORDIC_0__start)
                           , .xin(w_port__CORDIC_0__xin)
                           , .yin(w_port__CORDIC_0__yin)
                           , .angle(w_port__CORDIC_0__angle)
                           , .done() );

    top_hdmi_tmds_audio_0 hdmi_tmds_audio_0 (  .clk_pixel(w_port__hdmi_tmds_audio_0__clk_pixel)
                                             , .clk_pixel_x5(w_port__hdmi_tmds_audio_0__clk_pixel_x5)
                                             , .sys_nrst(w_port__hdmi_tmds_audio_0__sys_nrst)
                                             , .hdmi_aud(w_port__hdmi_tmds_audio_0__hdmi_aud)
                                             , .hdmi_clk(w_port__hdmi_tmds_audio_0__hdmi_clk)
                                             , .hdmi_d(w_port__hdmi_tmds_audio_0__hdmi_d) );

    top_PLL_1 PLL_1 (  .refclk(w_port__PLL_1__refclk)
                     , .clk0_out(w_port__PLL_1__clk0_out)
                     , .clk1_out(w_port__PLL_1__clk1_out)
                     , .lock(w_port__PLL_1__lock)
                     , .pllreset(w_port__PLL_1__pllreset) );

    top_reset2resetn_0 reset2resetn_0 (  .vector_a(w_port__reset2resetn_0__vector_a)
                                       , .result_vector(w_port__reset2resetn_0__result_vector) );

endmodule
