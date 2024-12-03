create_clock -name sys_clk -period 10 -waveform {0 5} [get_ports {sys_clk}]
create_clock -name data_clk -period 27.778 -waveform {0 13.889} [get_ports {data_clk_p}]
derive_pll_clocks