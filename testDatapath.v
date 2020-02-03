module testDatapath;
    reg PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, IRWritE, AluSrcA, RegWritE, RegDsT, CLK;//Controlling signals
    reg [1:0] PCSrC, Aluop, AluSrcB;
    wire [31:0] PCReG, AReB, BReG, AluOutReg;
    wire [5:0] OPCODE;//to Contrller
    
    Datapath datapath(PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, IRWritE, PCSrC, Aluop, 
                AluSrcA, AluSrcB, RegWritE, RegDsT, CLK, PCReG, AluOutReg, AReG, BReG, OPCODE);
    initial
    begin
        CLK = 1'b0;
        forever #10 CLK = ~CLK;
        PCWriteConD = 1'b1; PCWritE = 1'b1; IORD = 1'b1; R_wbar = 1'b1; MemToReg = 1'b1; IRWritE = 1'b1; AluSrcA = 1'b1; RegWritE = 1'b1; RegDsT = 1'b1;
        PCSrC = 2'b00; Aluop = 2'b00; AluSrcB = 2'b00;
        #20 PCWriteConD = 1'b0; PCWritE = 1'b0; IORD = 1'b0; R_wbar = 1'b0; MemToReg = 1'b0; IRWritE = 1'b0; AluSrcA = 1'b0; RegWritE = 1'b0; RegDsT = 1'b0; 
        PCSrC = 2'b01; Aluop = 2'b01; AluSrcB = 2'b00; 
        #45 PCWriteConD = 1'b0; PCWritE = 1'b0; IORD = 1'b0; R_wbar = 1'b0; MemToReg = 1'b0; IRWritE = 1'b0; AluSrcA = 1'b0; RegWritE = 1'b0; RegDsT = 1'b0;
        PCSrC = 2'b01; Aluop = 2'b01; AluSrcB = 2'b00;       
        #55 PCWriteConD = 1'b1; PCWritE = 1'b1; IORD = 1'b1; R_wbar = 1'b1; MemToReg = 1'b1; IRWritE = 1'b1; AluSrcA = 1'b1; RegWritE = 1'b1; RegDsT = 1'b1; 
        PCSrC = 2'b00; Aluop = 2'b00; AluSrcB = 2'b00;
        #65 PCWriteConD = 1'b0; PCWritE = 1'b0; IORD = 1'b0; R_wbar = 1'b0; MemToReg = 1'b0; IRWritE = 1'b0; AluSrcA = 1'b0; RegWritE = 1'b0; RegDsT = 1'b0; 
        PCSrC = 2'b01; Aluop = 2'b01; AluSrcB = 2'b00; 
        #75 PCWriteConD = 1'b1; PCWritE = 1'b0; IORD = 1'b1; R_wbar = 1'b1; MemToReg = 1'b0; IRWritE = 1'b0; AluSrcA = 1'b0; RegWritE = 1'b1; RegDsT = 1'b1;
        PCSrC = 2'b00; Aluop = 2'b11; AluSrcB = 2'b10;       
    end  
endmodule
        
