//author Saeed Aghajani

module ALUControl(aluop, func, aluctl);
    input [1:0] aluop;
    input [5:0] func;
    output [2:0] aluctl;//to the ALU
    reg [2:0] aluctl;
    
    always @ (aluop or func)
    begin
        case(aluop)
            2'b00 : aluctl = 3'b010;//add
            2'b01 : aluctl = 3'b110;//sub
            2'b10 : //according to func
            begin
                case(func)
                    6'd32 : aluctl = 3'b010;//add
                    6'd34 : aluctl = 3'b110;//sub
                    6'd36 : aluctl = 3'b000;//and
                    6'd37 : aluctl = 3'b001;//or
                endcase
            end           
        endcase
    end   
endmodule