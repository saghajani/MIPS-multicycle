//author Saeed Aghajani

module MIPS(clk, reset, PCReg, AReg, BReg, aluOutReg);
    input clk, reset;
    output [31:0] PCReg, AReg, BReg, aluOutReg;

    wire PCWriteCond, PCWrite, IorD, r_wbar, memToReg, IRWrite, aluSrcA, RegWrite, RegDst;
    wire [1:0] PCSrc, aluop, aluSrcB;
    wire [5:0] opCode;

    Datapath datapath(PCWriteCond, PCWrite, IorD, r_wbar, memToReg, IRWrite, PCSrc, aluop, 
                    aluSrcA, aluSrcB, RegWrite, RegDst, clk, PCReg, aluOutReg, AReg, BReg, opCode);
    Controller controller(clk, opCode, reset, PCWriteCond, PCWrite, IorD, r_wbar, memToReg, 
                        IRWrite, PCSrc, aluop, aluSrcA, aluSrcB, RegWrite, RegDst);
    
endmodule

 
