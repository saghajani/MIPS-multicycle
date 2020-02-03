module testReg;
      reg [4:0] RREG1, RREG2, WREG;
      reg REGWRITE, CLK;
      reg [31:0] WDATA;
      wire [31:0] RDATA1, RDATA2;
      
      RegFile rf1(RREG1, RREG2, WREG, WDATA, REGWRITE, CLK, RDATA1 , RDATA2);
      
      initial
      begin
          CLK = 1'b0;
          forever #5 CLK = ~CLK;
           WREG = 5'd4; REGWRITE = 1'b1; WDATA = 32'd50;
          #10 WREG = 5'd2; REGWRITE = 1'b1; WDATA = 32'd40;
          #10 WREG = 5'd3; REGWRITE = 1'b1; WDATA = 32'd60;
          #10 REGWRITE = 1'b0; RREG1 = 5'd2; RREG2 = 5'd3;
      end
  endmodule

