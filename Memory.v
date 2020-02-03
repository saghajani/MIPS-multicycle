//author Saeed Aghajani

module Memory(r_wbar, clk, addr, wData, rData);
    input r_wbar, clk;
    input [31:0] addr, wData;
    output [31:0] rData;
    reg [31:0] rData;
    reg [31:0] Mem [0:127];
    
    initial
    begin
        Mem[0] = 32'h221820;//add $3, $1, $2   {6'd0, 5'd1, 5'd2, 5'd3, 5'd0, 6'd32}
        Mem[1] = 32'h222022;//sub $4, $1, $2   {6'd0, 5'd1, 5'd2, 5'd4, 5'd0, 6'd34}
        Mem[2] = 32'h642820;//add $5, $3, $4 = 2*$1  
        Mem[3] = {6'd35, 5'd0, 5'd2, 16'd20};// lw $2, $0, 20
        Mem[4] = {6'd35, 5'd0, 5'd3, 16'd24};// lw $3, $0, 24
        Mem[5] = {6'd2, 26'd16};//j 16 
        
    end
    
    always @ (posedge clk/*r_wbar or addr or wData*/)
    begin
        if(r_wbar == 0)
            #2 Mem[addr] = wData;
        else
            #1 rData = Mem[addr];
    end
endmodule


                  
        
    
    
    
