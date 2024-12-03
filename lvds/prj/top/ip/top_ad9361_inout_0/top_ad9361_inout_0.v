module top_ad9361_inout_0 
(
    input  [(7 - 1):0] data_in_from_pins ,
    output [(14 - 1):0] data_in_to_device ,
    input  [(14 - 1):0] data_out_from_device ,
    output [(7 - 1):0] data_out_to_pins ,
    output            clk_to_pins ,
    input             clk_in ,
    output            clk_out ,
    input             clk_reset ,
    input             io_reset
) ;

    ad9361_inout ad9361_inout (
        .data_in_from_pins(data_in_from_pins) ,
        .data_in_to_device(data_in_to_device) ,
        .data_out_from_device(data_out_from_device) ,
        .data_out_to_pins(data_out_to_pins) ,
        .clk_to_pins(clk_to_pins) ,
        .clk_in(clk_in) ,
        .clk_out(clk_out) ,
        .clk_reset(clk_reset) ,
        .io_reset(io_reset)
    );


endmodule
