# ==================================================
# File Name: golden_hdmi_tmds.xdc
# ==================================================
# Programed By: BrianSune
# Contact: briansune@gmail.com
#

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]

# =================================================================
# System Clock
# ========================================================
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]
set_property PACKAGE_PIN D9 [get_ports sys_clk_p]
# =================================================================


# =================================================================
# AD9361 SPI interface signal. Same as Before C2C
# =================================================================
set_property PACKAGE_PIN AF23 [get_ports ad9361_spi_cs]
set_property PACKAGE_PIN AG24 [get_ports ad9361_spi_mosi]
set_property PACKAGE_PIN AF24 [get_ports ad9361_spi_sclk]
set_property PACKAGE_PIN AG25 [get_ports ad9361_spi_miso]

set_property IOSTANDARD LVCMOS25 [get_ports ad9361_spi_cs]
set_property IOSTANDARD LVCMOS25 [get_ports ad9361_spi_sclk]
set_property IOSTANDARD LVCMOS25 [get_ports ad9361_spi_mosi]
set_property IOSTANDARD LVCMOS25 [get_ports ad9361_spi_miso]
# =================================================================


# =================================================================
# AD9361 control pins.
#
# clog - RSTB changed
# =================================================================
set_property PACKAGE_PIN AF20 [get_ports en_agc]
set_property PACKAGE_PIN AJ21 [get_ports enable]
set_property PACKAGE_PIN W21 [get_ports resetb]
set_property PACKAGE_PIN AK21 [get_ports txnrx]
set_property PACKAGE_PIN AG20 [get_ports sync_in]

set_property IOSTANDARD LVCMOS25 [get_ports en_agc]
set_property IOSTANDARD LVCMOS25 [get_ports enable]
set_property IOSTANDARD LVCMOS25 [get_ports resetb]
set_property IOSTANDARD LVCMOS25 [get_ports txnrx]
set_property IOSTANDARD LVCMOS25 [get_ports sync_in]
# =================================================================
# clog - CTRL 0
# clog - CTRL 1
# =================================================================
set_property PACKAGE_PIN AH17 [get_ports {ctrl_in[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_in[0]}]
set_property PACKAGE_PIN AH16 [get_ports {ctrl_in[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_in[1]}]
set_property PACKAGE_PIN AH19 [get_ports {ctrl_in[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_in[2]}]
set_property PACKAGE_PIN AJ19 [get_ports {ctrl_in[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_in[3]}]
# =================================================================
# Same as Before C2C
# =================================================================
set_property PACKAGE_PIN AD21 [get_ports {ctrl_out[0]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_out[0]}]
set_property PACKAGE_PIN AE21 [get_ports {ctrl_out[1]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_out[1]}]
set_property PACKAGE_PIN AB21 [get_ports {ctrl_out[2]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_out[2]}]
set_property PACKAGE_PIN AB22 [get_ports {ctrl_out[3]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_out[3]}]
set_property PACKAGE_PIN AA22 [get_ports {ctrl_out[4]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_out[4]}]
set_property PACKAGE_PIN AA23 [get_ports {ctrl_out[5]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_out[5]}]
set_property PACKAGE_PIN AC24 [get_ports {ctrl_out[6]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_out[6]}]
set_property PACKAGE_PIN AD24 [get_ports {ctrl_out[7]}]
set_property IOSTANDARD LVCMOS25 [get_ports {ctrl_out[7]}]
# =================================================================


# =================================================================
# AD9361 parallel data ports pins. Same as Before C2C
# =================================================================
set_property -dict {PACKAGE_PIN AF15 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports data_clk_p]
set_property -dict {PACKAGE_PIN AG15 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports data_clk_n]

set_property -dict {PACKAGE_PIN AG17 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports rx_frame_p]
set_property -dict {PACKAGE_PIN AG16 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports rx_frame_n]
# =================================================================
# CMOS-0	RX-LVDS		PIN
# D11 .. 	D5_P		AB17
# D10 .. 	D5_N		AB16
# D9 ... 	D4_P		AF18
# D8 ... 	D4_N		AF17
# D7 ... 	D3_P		AJ15
# D6 ... 	D3_N		AK15
# D5 ... 	D2_P		AJ16
# D4 ... 	D2_N		AK16
# D3 ... 	D1_P		AB12	changed
# D2 ... 	D1_N		AC12	changed
# D1 ... 	D0_P		AH18
# D0 ... 	D0_N		AJ18
# =================================================================
set_property -dict {PACKAGE_PIN AH18 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_p[0]}]
set_property -dict {PACKAGE_PIN AJ18 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_n[0]}]
set_property -dict {PACKAGE_PIN AB12 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_p[1]}]
set_property -dict {PACKAGE_PIN AC12 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_n[1]}]
set_property -dict {PACKAGE_PIN AJ16 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_p[2]}]
set_property -dict {PACKAGE_PIN AK16 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_n[2]}]
set_property -dict {PACKAGE_PIN AJ15 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_p[3]}]
set_property -dict {PACKAGE_PIN AK15 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_n[3]}]
set_property -dict {PACKAGE_PIN AF18 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_p[4]}]
set_property -dict {PACKAGE_PIN AF17 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_n[4]}]
set_property -dict {PACKAGE_PIN AB17 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_p[5]}]
set_property -dict {PACKAGE_PIN AB16 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports {rx_data_n[5]}]

# =================================================================
set_property IOSTANDARD LVDS_25 [get_ports fb_clk_p]
set_property PACKAGE_PIN AE18 [get_ports fb_clk_p]
set_property PACKAGE_PIN AE17 [get_ports fb_clk_n]
set_property IOSTANDARD LVDS_25 [get_ports fb_clk_n]
# =================================================================
# changed
# =================================================================
set_property IOSTANDARD LVDS_25 [get_ports {tx_frame_p[0]}]
set_property PACKAGE_PIN AE16 [get_ports {tx_frame_p[0]}]
set_property PACKAGE_PIN AE15 [get_ports {tx_frame_n[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_frame_n[0]}]
# =================================================================
# CMOS-1	TX-LVDS		PIN
# D11 .. 	D5_P		AJ14
# D10 .. 	D5_N		AJ13
# D9 ... 	D4_P		AD16
# D8 ... 	D4_N		AD15
# D7 ... 	D3_P		AH14
# D6 ... 	D3_N		AH13
# D5 ... 	D2_P		AE12
# D4 ... 	D2_N		AF12
# D3 ... 	D1_P		AC17
# D2 ... 	D1_N		AC16
# D1 ... 	D0_P		AD14
# D0 ... 	D0_N		AD13
# =================================================================
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_n[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_p[0]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_n[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_p[1]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_n[2]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_p[2]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_n[3]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_p[3]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_n[4]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_p[4]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_n[5]}]
set_property IOSTANDARD LVDS_25 [get_ports {tx_data_p[5]}]

set_property PACKAGE_PIN AD14 [get_ports {tx_data_p[0]}]
set_property PACKAGE_PIN AD13 [get_ports {tx_data_n[0]}]
set_property PACKAGE_PIN AC17 [get_ports {tx_data_p[1]}]
set_property PACKAGE_PIN AC16 [get_ports {tx_data_n[1]}]
set_property PACKAGE_PIN AE12 [get_ports {tx_data_p[2]}]
set_property PACKAGE_PIN AF12 [get_ports {tx_data_n[2]}]
set_property PACKAGE_PIN AH14 [get_ports {tx_data_p[3]}]
set_property PACKAGE_PIN AH13 [get_ports {tx_data_n[3]}]
set_property PACKAGE_PIN AD16 [get_ports {tx_data_p[4]}]
set_property PACKAGE_PIN AD15 [get_ports {tx_data_n[4]}]
set_property PACKAGE_PIN AJ14 [get_ports {tx_data_p[5]}]
set_property PACKAGE_PIN AJ13 [get_ports {tx_data_n[5]}]

# =================================================================
# LEDs
# =================================================================
set_property IOSTANDARD LVCMOS15 [get_ports {leds[7]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[6]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[5]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[4]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {leds[0]}]
set_property PACKAGE_PIN K12 [get_ports {leds[7]}]
set_property PACKAGE_PIN L12 [get_ports {leds[6]}]
set_property PACKAGE_PIN J10 [get_ports {leds[5]}]
set_property PACKAGE_PIN J11 [get_ports {leds[4]}]
set_property PACKAGE_PIN K11 [get_ports {leds[3]}]
set_property PACKAGE_PIN K10 [get_ports {leds[2]}]
set_property PACKAGE_PIN J8 [get_ports {leds[1]}]
set_property PACKAGE_PIN J9 [get_ports {leds[0]}]

# =================================================================
# Reset
# =================================================================
set_property PACKAGE_PIN A7 [get_ports sys_nrst]
set_property IOSTANDARD LVCMOS15 [get_ports sys_nrst]
# =================================================================




set_property PACKAGE_PIN N27 [get_ports hdmi_cec]
set_property PACKAGE_PIN N26 [get_ports hdmi_hdp]
set_property PACKAGE_PIN U21 [get_ports hdmi_scl]
set_property PACKAGE_PIN V21 [get_ports hdmi_sda]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_cec]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_hdp]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_scl]
set_property IOSTANDARD LVCMOS33 [get_ports hdmi_sda]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d1[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d1[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d2[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d2[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d0[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_d0[0]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_clk[1]}]
set_property IOSTANDARD TMDS_33 [get_ports {hdmi_clk[0]}]
set_property PACKAGE_PIN Y20 [get_ports {hdmi_d0[1]}]
set_property PACKAGE_PIN AC18 [get_ports {hdmi_d1[1]}]
set_property PACKAGE_PIN AD20 [get_ports {hdmi_d2[1]}]
set_property PACKAGE_PIN AB19 [get_ports {hdmi_clk[1]}]


#create_clock -period 108.507 -name data_clk_p -waveform {0.000 54.254} [get_ports data_clk_p]
create_clock -period 217.014 -name data_clk_p -waveform {0.000 108.507} [get_ports data_clk_p]
