//author Saeed Aghajani

module ALU(aluin1, aluin2, aluctl, aluout, zero);
    input [2:0] aluctl;
    input [31:0] aluin1, aluin2;
    output [31:0] aluout;
    output zero;
    reg [31:0] aluout;
    reg zero;
    
    always @ (aluin1 or aluin2 or aluctl)
    begin
        case(aluctl)
            3'b000 : aluout = aluin1 & aluin2;//and
            3'b001 : aluout = aluin1 | aluin2;//or
            3'b010 : aluout = aluin1 + aluin2;//add
            3'b110 : aluout = aluin1 - aluin2;//sub
        endcase
        
        zero = ((aluin1 - aluin2) == 0) ? 1 : 0;
    end
endmodule
  

    
    
