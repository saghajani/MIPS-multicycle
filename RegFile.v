//author Saeed Aghajani

module RegFile(rReg1, rReg2, wReg, wData, RegWrite, clk, rData1, rData2);
    input RegWrite, clk;
    input [4:0] rReg1, rReg2, wReg;
    input [31:0] wData;
    output [31:0] rData1, rData2;
    //reg [31:0] rData1, rData2;
    reg [31:0] Reg [31:0];
    
    initial
    begin
        Reg[0] = 32'd0;//$0 = 0
        
    end
    
    always @ (posedge clk/*RegWrite or rReg1 or rReg2 or wReg or wData*/)
    begin
        if(RegWrite)
            Reg[wReg] = wData;
        /*else
        begin
            #1 rData1 = Reg[rReg1];
            #1 rData2 = Reg[rReg2];
        end*/
    end    
    
    assign rData1 = Reg[rReg1];
    assign rData2 = Reg[rReg2];
endmodule

module testReg;
      reg [4:0] RREG1, RREG2, WREG;
      reg REGWRITE, CLK;
      reg [31:0] WDATA;
      wire [31:0] RDATA1, RDATA2;
      
      RegFile rf1(RREG1, RREG2, WREG, WDATA, REGWRITE, CLK, RDATA1 , RDATA2);
      
      initial
      begin
           WREG = 5'd4; REGWRITE = 1'b1; WDATA = 32'd50;
          #10 WREG = 5'd2; REGWRITE = 1'b1; WDATA = 32'd40;
          #10 WREG = 5'd3; REGWRITE = 1'b1; WDATA = 32'd60;
          #10 REGWRITE = 1'b0; RREG1 = 5'd2; RREG2 = 5'd3;
      end
  endmodule
