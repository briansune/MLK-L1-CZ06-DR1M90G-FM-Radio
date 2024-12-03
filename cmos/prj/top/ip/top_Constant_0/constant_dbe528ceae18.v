
module constant_dbe528ceae18 #(parameter WIDTH = 3, 
        parameter OUT_MODE = 1) (
    output [(WIDTH - 1):0] dout) ;
    assign dout = (OUT_MODE ? {WIDTH{1'b1}} : 'b0) ; 
endmodule


