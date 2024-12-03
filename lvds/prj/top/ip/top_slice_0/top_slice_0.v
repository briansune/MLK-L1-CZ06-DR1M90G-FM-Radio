module top_slice_0 
(
    input       [6:0] in0 ,
    output      [0:0] out1 ,
    output      [5:0] out0
) ;

    slice slice (
        .in0(in0) ,
        .out1(out1) ,
        .out0(out0)
    );


endmodule
