//author Saeed Aghajani

module Mux2_to_1(in0, in1, sel, out);
    input [31:0] in0, in1;
    input sel;
    output [31:0] out;
    reg [31:0] out;
    
    always @ (in0 or in1 or sel)
    begin
        if(sel)
            out = in1;
        else
            out = in0;
    end
endmodule
