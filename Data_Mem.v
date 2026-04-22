`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/20/2026 01:26:51 PM
// Design Name: 
// Module Name: Data_Mem
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


module Data_Mem(
    input MemWrite,
    input [31:0] ALU_Result,
    input [31:0] ReadData2_ex_mem,
    input MemRead,
    input clk,
    input rst,
    output [31:0] DataMem_ReadData
    );

reg [31:0] DMEM[0:255]
integer i;

initial begin
    DataMem_ReadData <= 0;
    $readmemb("data.txt",DMEM);
    for(i = 0; i < 6; i = i + 1)
    $display("\tDMEM[%0d] = %0b", i, DMEM[i]);
end



endmodule
