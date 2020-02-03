//author Saeed Aghajani

module IR(memData, IRWrite, clk, inst, func, addr, longAddr, Rd, Rt, Rs, opCode);
    input [31:0] memData;
    input IRWrite, clk;
    output [31:0] inst;
    output [5:0] func, opCode;
    output [4:0] Rd, Rt, Rs;
    output [15:0] addr;
    output [25:0] longAddr;    
    reg [31:0] inst;
    
    always @ (posedge clk)
    begin
        if(IRWrite == 1'b1)
            inst = memData;
    end
    
    assign func = inst[5:0];
    assign addr = inst[15:0];
    assign longAddr = inst[25:0];
    assign Rd = inst[15:11];
    assign Rt = inst[20:16];
    assign Rs = inst[25:21];
    assign opCode = inst[31:26];
endmodule
