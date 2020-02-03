//author Saeed Aghajani

module Controller(clk, opCode, reset, PCWriteCond, PCWrite, IorD, r_wbar, memToReg, 
                  IRWrite, PCSrc, aluop, aluSrcA, aluSrcB, RegWrite, RegDst);
    input clk, reset;
    input [5:0] opCode;//from Datapath
    output PCWriteCond, PCWrite, IorD, r_wbar, memToReg, IRWrite, aluSrcA, RegWrite, RegDst;//controlling signals
    output [1:0] PCSrc, aluop, aluSrcB;
    
    reg PCWriteCond, PCWrite, IorD, r_wbar, memToReg, IRWrite, aluSrcA, RegWrite, RegDst;//controlling signals
    reg [1:0] PCSrc, aluop, aluSrcB;
    reg [3:0] cs, ns;
    
    //opcodes
    `define Rtype 6'd0
    `define LW 6'd35
    `define SW 6'd43
    `define beq 6'd4   
    `define J 6'd2
    
    //states
    `define IF 4'd1
    `define ID 4'd2
    `define ADDR 4'd3
    `define READMEM 4'd4
    `define WRITEMEM 4'd5
    `define WRITEBACK 4'd6
    `define EXE 4'd7
    `define R_TYPECOMPLETION 4'd8
    `define BRANCHCOMPLETION 4'd9
    `define JUMPCOMPLETION 4'd10
    
    initial
    begin
        PCWriteCond = 1'b0;
        PCWrite = 1'b0;
        IorD = 1'b0;
        r_wbar = 1'b0;
        memToReg = 1'b0;
        IRWrite = 1'b0;
        aluSrcA = 1'b0;
        RegWrite = 1'b0;
        RegDst = 1'b0;
        PCSrc = 2'b00; 
        aluop = 2'b00;
        aluSrcB = 2'b00;
    end
         
    always @ (posedge clk)
    begin
        if(reset)
            cs = `IF;
        else
            cs = ns;
    end
    
    always @ (cs)
    begin
        case(cs)
            `IF : 
            begin
                IorD = 1'b0;
                r_wbar = 1'b1;
                IRWrite = 1'b1;
                aluSrcA = 1'b0;
                aluSrcB = 2'b01;
                aluop = 2'b00;
                PCSrc = 2'b00;
                PCWrite = 1'b1;
                ns = `ID;
            end
            `ID :
            begin
                aluSrcA = 1'b0;
                aluSrcB = 2'b11;
                aluop = 2'b00;
                case(opCode)
                    `LW : ns = `ADDR;
                    `SW : ns = `ADDR;
                    `Rtype : ns = `EXE;
                    `beq : ns = `BRANCHCOMPLETION;
                    `J : ns = `JUMPCOMPLETION;
                endcase
            end
            `ADDR :
            begin
                aluSrcA = 1'b1;
                aluSrcB = 2'b10;
                aluop = 2'b00;
                case(opCode)
                    `LW : ns = `READMEM;
                    `SW : ns = `WRITEMEM;
                endcase
            end
            `READMEM : 
            begin
                IorD = 1'b1;
                r_wbar = 1'b1;
                ns = `WRITEBACK;
            end
            `WRITEMEM :
            begin
                IorD = 1'b1;
                r_wbar = 1'b0;
                ns = `IF;
            end
            `WRITEBACK :
            begin
                memToReg = 1'b1;
                RegWrite = 1'b1;
                RegDst = 1'b0;
                ns = `IF;
            end
            `EXE : 
            begin
                aluSrcA = 1'b1;
                aluSrcB = 2'b00;
                aluop = 2'b10;//according to the func
                ns = `R_TYPECOMPLETION;
            end
            `R_TYPECOMPLETION :
            begin
                RegDst = 1'b1;
                memToReg = 1'b0;
                RegWrite = 1'b1;
                ns = `IF;
            end
            `BRANCHCOMPLETION :
            begin
                PCSrc = 2'b01;
                PCWriteCond = 1'b1;
                aluSrcA = 1'b1;
                aluSrcB = 2'b00;
                aluop = 2'b01;
                ns = `IF;
            end
            `JUMPCOMPLETION :
            begin
                PCSrc = 2'b10;
                PCWrite = 1'b1;
                ns = `IF;
            end
            default :
            begin
                aluSrcA = 1'b0;//PC
                aluSrcB = 2'b01;//4
                aluop = 2'b00;//add 
                PCSrc = 2'b00;//(PC + 4) is the Mux input
                PCWrite = 1'b1;
                IorD = 1'b0;
                r_wbar = 1'b1;
                IRWrite = 1'b1;
                ns = `IF;
            end
        endcase
    end   
endmodule
    
    
    
