`timescale 1ns / 1ps

module Mem_Wb_Latch(
// - - - - - - Inputs - - - - - -
    input [1:0]     WB,
    input           m_ctlout,
    input           Zero,
    input           MemWrite,
    input [31:0]    ALU_Result,
    input [31:0]    ReadData2_ex_mem,
    input           clk, rst,
    input [4:0]     muxOut_5bit,
// - - - - - - Outputs - - - - - -
    output reg          Mem_Wb_Latch_RegWrite,
    output reg          Mem_Wb_Latch_MemtoReg,
    output reg [31:0]   Mem_Wb_Latch_ReadData,
    output reg [31:0]   Mem_Wb_Latch_Mem_ALU_Result,
    output reg [4:0]    Mem_Wb_Latch_MemWriteReg
    );
    
always @(posedge clk or posedge rst)begin
    if(rst)begin
        Mem_Wb_Latch_RegWrite <= 0;
        Mem_Wb_Latch_MemtoReg <= 0;
        Mem_Wb_Latch_ReadData <= 0;
        Mem_Wb_Latch_Mem_ALU_Result <= 0;
        Mem_Wb_Latch_MemWriteReg <= 0;
    end else begin
        Mem_Wb_Latch_RegWrite <= WB[1];
        Mem_Wb_Latch_MemtoReg <= WB[0];
        Mem_Wb_Latch_ReadData <= ReadData2_ex_mem;
        Mem_Wb_Latch_Mem_ALU_Result <= ALU_Result;
        Mem_Wb_Latch_MemWriteReg <= muxOut_5bit;
    end
end

endmodule