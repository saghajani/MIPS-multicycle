module testController;
    reg CLK, RESET;
    reg [5:0] OPCODE;
    
    wire PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, IRWritE, AluSrcA, RegWritE, RegDsT;
    wire [1:0] PCSrC, Aluop, AluSrcB;
    
    Controller controller(CLK, OPCODE, RESET, PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, 
                  IRWritE, PCSrC, Aluop, AluSrcA, AluSrcB, RegWritE, RegDsT);
    initial
    begin
        RESET = 1'b0; CLK = 1'b0;
        forever #5 CLK = ~CLK;
        
        OPCODE = 6'd0;//R-TYPE
        #15 OPCODE = 6'd35;//LW
        $display("At %t the value of PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, 
                  IRWritE, PCSrC, Aluop, AluSrcA, AluSrcB, RegWritE, RegDsT are 
                  %b%b%b%b%b%bb%b%b%b%b%b",$time,PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, 
                  IRWritE, PCSrC, Aluop, AluSrcA, AluSrcB, RegWritE, RegDsT);
        
        #25 OPCODE = 6'd43;//SW
        $display("At %t the value of PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, 
                  IRWritE, PCSrC, Aluop, AluSrcA, AluSrcB, RegWritE, RegDsT are 
                  %b%b%b%b%b%bb%b%b%b%b%b",$time,PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, 
                  IRWritE, PCSrC, Aluop, AluSrcA, AluSrcB, RegWritE, RegDsT);
        #35 OPCODE = 6'd2;//J
        $display("At %t the value of PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, 
                  IRWritE, PCSrC, Aluop, AluSrcA, AluSrcB, RegWritE, RegDsT are 
                  %b%b%b%b%b%bb%b%b%b%b%b",$time,PCWriteConD, PCWritE, IORD, R_wbar, MemToReg, 
                  IRWritE, PCSrC, Aluop, AluSrcA, AluSrcB, RegWritE, RegDsT);
        
    end
endmodule
    
