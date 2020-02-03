//author Saeed Aghajani

module TestMIPS;
    reg CLK, RESET;
    wire [31:0] PCREG, AREG, BREG, ALUOUTREG;
    
    MIPS mips(CLK, RESET, PCREG, AREG, BREG, ALUOUTREG);
    
    initial
    begin
        CLK = 1'b0; RESET = 1'b1;
        #20 RESET = 1'b0;
        $display("At %t the value of PCReg, ARdg, BRdg, aluOutReG is %b %b %b",
               $time,PCREG, AREG, BREG, ALUOUTREG);
        #8 $display("At %t the value of PCReg, ARdg, BRdg, aluOutReG is %b %b %b",
               $time,PCREG, AREG, BREG, ALUOUTREG);
        #16 $display("At %t the value of PCReg, ARdg, BRdg, aluOutReG is %b %b %b",
               $time,PCREG, AREG, BREG, ALUOUTREG);
        #24 $display("At %t the value of PCReg, ARdg, BRdg, aluOutReG is %b %b %b",
               $time,PCREG, AREG, BREG, ALUOUTREG);
        #32 $display("At %t the value of PCReg, ARdg, BRdg, aluOutReG is %b %b %b",
               $time,PCREG, AREG, BREG, ALUOUTREG);
        #40 $display("At %t the value of PCReg, ARdg, BRdg, aluOutReG is %b %b %b",
               $time,PCREG, AREG, BREG, ALUOUTREG);
        #48 $display("At %t the value of PCReg, ARdg, BRdg, aluOutReG is %b %b %b",
               $time,PCREG, AREG, BREG, ALUOUTREG);
    end
    
    always #5 CLK = ~CLK;//clock with 10 time units period
    
endmodule
