`timescale 1ns / 1ps

module Instr_Mem_tb();

// - - - - - - Inputs - - - - - -
    reg [1:0]   WB;
    reg         M_ctlout;
    reg         Zero;
    reg         MemWrite;
    reg [31:0]  ALU_Result;
    reg [31:0]  ReadData2_ex_mem;
    reg         MemRead;
    reg [4:0]   muxOut_5bit;
    reg         clk;
    reg         rst;
// - - - - - - Outputs - - - - - -
    wire        RegWrite;
    wire        MemtoReg;
    wire [31:0] ReadData;
    wire [31:0] Mem_ALU_Result;
    wire [4:0]  MemWriteReg;
    wire    PCSrc;

Instruction_Mem UUT (
// - - - - - - Inputs - - - - - -
    .WB(WB),
    .M_ctlout(M_ctlout),
    .Zero(Zero),
    .MemWrite(MemWrite),
    .ALU_Result(ALU_Result),
    .ReadData2_ex_mem(ReadData2_ex_mem),
    .MemRead(MemRead),
    .muxOut_5bit(muxOut_5bit),
    .clk(clk),
    .rst(rst),
// - - - - - - Outputs - - - - - -
    .RegWrite(RegWrite),
    .MemtoReg(MemtoReg),
    .ReadData(ReadData),
    .Mem_ALU_Result(Mem_ALU_Result),
    .MemWriteReg(MemWriteReg),
    .PCSrc(PCSrc)
    );

always #5 clk = ~clk;

initial begin
// Initialize
    ALU_Result = 32'h0;
    ReadData2_ex_mem = 32'h0;
    muxOut_5bit = 5'h00;
    WB = 2'b00;
    MemWrite = 0;
    MemRead = 0;
    M_ctlout = 0;
    Zero = 0;
    clk = 0;
    rst = 0;
    #5

// Mem Read
    rst = 1;
    ALU_Result = 32'h00000004;
    ReadData2_ex_mem = 32'h12345678;
    muxOut_5bit = 5'h02;
    WB = 2'b01;
    MemWrite = 0;
    MemRead = 1;
    M_ctlout = 0;
    Zero = 0;

    #10; 

    // Mem Write
    MemWrite = 1;
    MemRead = 0;
    #10; // Allow write to occur
    MemWrite = 0;
    MemRead = 1;
    #10; // Verify write by reading back

    // Branch
    M_ctlout = 1;
    Zero = 1;
    #10; // Check PCSrc

    $finish;
end

endmodule