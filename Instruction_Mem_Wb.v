`timescale 1ns / 1ps

module Instruction_Mem(
    input [1:0] WB,
    input M_ctlout,
    input Zero,
    input [31:0] ALU_Result,
    input [31:0] ReadData2_ex_mem,
    input [4:0] muxOut_5bit,
    input clk,
    input rst,
    output RegWrite,
    output MemtoReg,
    output [31:0] ReadData,
    output [31:0] Mem_ALU_Result,
    output [4:0] MemWriteReg
    );
endmodule
