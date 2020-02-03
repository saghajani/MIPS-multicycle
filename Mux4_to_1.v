//author Saeed Aghajani

module Mux4_to_1(in0, in1, in2, in3, sel, out);
    input [31:0] in0, in1, in2, in3;
    input [1:0] sel;
    output [31:0] out;
    reg [31:0] out;
    
    always @ (in0 or in1 or in2 or in3 or sel)
    begin
        case(sel)
            2'b00 : out = in0;
            2'b01 : out = in1;
            2'b10 : out = in2;
            2'b11 : out = in3;
        endcase
    end
endmodule

