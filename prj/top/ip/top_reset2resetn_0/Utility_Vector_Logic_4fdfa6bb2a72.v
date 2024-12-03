
module Utility_Vector_Logic_4fdfa6bb2a72 #(parameter OPERATION = 0, 
        parameter SIZE = 8) (
    input [(SIZE - 1):0] vector_a, 
    input [(SIZE - 1):0] vector_b, 
    output [(SIZE - 1):0] result_vector) ;
    wire [(SIZE - 1):0] And ; 
    wire [(SIZE - 1):0] Or ; 
    wire [(SIZE - 1):0] Xor ; 
    wire [(SIZE - 1):0] Not ; 
    assign And = (vector_a & vector_b) ; 
    assign Or = (vector_a | vector_b) ; 
    assign Xor = (vector_a ^ vector_b) ; 
    assign Not = (~vector_a) ; 
    assign result_vector = ((OPERATION == 0) ? And : ((OPERATION == 1) ? Or : ((OPERATION == 2) ? Xor : Not))) ; 
endmodule


