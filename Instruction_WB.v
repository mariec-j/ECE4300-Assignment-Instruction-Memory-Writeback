`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/23/2026 03:35:07 AM
// Design Name: 
// Module Name: Instr_WB
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Instr_WB(
    input MemtoReg,
    input [31:0] ReadData,
    input [31:0] Mem_ALU_Result,
    output [31:0] WriteData
    );
    
mux #(.WIDTH_inp(32)) wb_mux (
    .sel(MemtoReg),
    .in_1(Mem_ALU_Result),
    .in_2(ReadData),
    .outp(WriteData)
    );
    
endmodule
