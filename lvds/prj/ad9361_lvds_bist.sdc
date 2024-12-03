create_clock -name sys_clk -period 10 -waveform {0 5} [get_ports {sys_clk}]
create_clock -name data_clk -period 4 -waveform {0 2} [get_ports {data_clk}]
derive_pll_clocks