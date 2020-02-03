//author Saeed Aghajani

module Datapath(PCWriteCond, PCWrite, IorD, r_wbar, memToReg, IRWrite, PCSrc, aluop, 
                aluSrcA, aluSrcB, RegWrite, RegDst, clk, PCReg, aluOutReg, AReg, BReg, opCode);
    input PCWriteCond, PCWrite, IorD, r_wbar, memToReg, IRWrite, aluSrcA, RegWrite, RegDst, clk;//Controlling signals
    input [1:0] PCSrc, aluop, aluSrcB;//Controlling signals
    output [31:0] PCReg, AReg, BReg, aluOutReg;
    output [5:0] opCode;//to Contrller
    
    reg [31:0] PCReg, MDR, aluOutReg, AReg, BReg;
    
    wire [31:0] memAddr, memWData, memData, inst, regWData, rData1, rData2, aluin1, aluin2,
                 aluout, jAddr, PCin, signExtAddr, shftAddr; 
    wire [5:0] func;//for R-tupe instructions
    wire [15:0] addr;//for I-type instructions
    wire [25:0] longAddr;//for J-type instructions
    wire [4:0] Rd, Rt, Rs, wReg;
    wire [2:0] aluctl;//from ALUControl to ALU
    wire zero;//zero flag of ALU
    wire PCctl;
    
    initial
    begin
        PCReg = 32'd0;
    end
    
    assign signExtAddr = {{16{addr[15]}}, addr};//sign extended addr for I-type
    assign shftAddr = signExtAddr << 2;//2 bit shifted sign extended addr for I-type

    assign jAddr = {PCReg[31:28], longAddr, 2'b00};//jump addr for J-type
    
    Mux2_to_1 mux1(PCReg, aluOutReg, IorD, memAddr);
    Memory memory(r_wbar, clk, memAddr, memWData, memData);
    
    IR ir(memData, IRWrite, clk, inst, func, addr, longAddr, Rd, Rt, Rs, opCode);
    
    assign wReg = RegDst ? Rd : Rt;
    Mux2_to_1 mux2(aluOutReg, MDR, memToReg, regWData);
    RegFile regFile(Rs, Rt, wReg, regWData, RegWrite, clk, rData1, rData2);
    
    Mux2_to_1 mux3(PCReg, AReg, aluSrcA, aluin1);
    Mux4_to_1 mux4(BReg, 32'd4, signExtAddr, shftAddr, aluSrcB, aluin2);
    ALU alu(aluin1, aluin2, aluctl, aluout, zero);
    ALUControl aluControl(aluop, func, aluctl);

    Mux4_to_1 mux5(aluout, aluOutReg, jAddr, 32'bx, PCSrc, PCin);//to the PCReg   
    
    assign PCctl = PCWrite | (PCWriteCond & zero);
    assign memWData = BReg;
    
    
    always @ (posedge clk)
    begin//writting in Registers
        if(PCctl)
            PCReg = PCin;
            
        MDR = memData;
        
        AReg = rData1;
        BReg = rData2;
        
        aluOutReg = aluout;
    end
endmodule