
module concat_34bc40459dfa #(parameter PORT_NUM = 1, 
        parameter IN_WIDTH_0 = 1, 
        parameter IN_WIDTH_1 = 1, 
        parameter OUT_WIDTH = 32) (
    input wire [(IN_WIDTH_0 - 1):0] In0, 
    input wire [(IN_WIDTH_1 - 1):0] In1, 
    output wire [(OUT_WIDTH - 1):0] Dout) ;
    assign Dout = {In1,
                In0} ; 
endmodule


