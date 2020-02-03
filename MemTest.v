module MemTest;
    reg R_WBAR, CLK;
    reg [31:0] ADDR, WDATA;
    wire [31:0] RDATA;
    
    Memory m1(R_WBAR, CLK, ADDR, WDATA, RDATA);
    
    initial
    begin
        CLK = 1'b0; forever #10 CLK = ~CLK;
        R_WBAR = 1'b0; ADDR = 32'd5; WDATA = 32'd9;
        #15 R_WBAR = 1'b1; ADDR = 32'd5; WDATA = 32'd9;
        #15 R_WBAR = 1'b1; ADDR = 32'd2; WDATA = 32'd9;
        #15 R_WBAR = 1'b1; ADDR = 32'd3; WDATA = 32'd9;
        #15 R_WBAR = 1'b0; ADDR = 32'd10; WDATA = 32'd27;

    end
endmodule
