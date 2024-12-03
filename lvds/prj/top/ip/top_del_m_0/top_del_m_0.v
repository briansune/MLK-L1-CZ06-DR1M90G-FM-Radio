module top_del_m_0 
(
    input             aclk ,
    input             aresetn ,
    input      [28:0] tap_i ,
    input      [28:0] tap_q ,
    output     [15:0] out_i ,
    output     [15:0] out_q
) ;

    del_m del_m (
        .aclk(aclk) ,
        .aresetn(aresetn) ,
        .tap_i(tap_i) ,
        .tap_q(tap_q) ,
        .out_i(out_i) ,
        .out_q(out_q)
    );


endmodule
