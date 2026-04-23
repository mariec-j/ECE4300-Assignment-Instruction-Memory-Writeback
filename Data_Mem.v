`timescale 1ns / 1ps
/*Instantiates and serves as the data memory.
- If memread is true, then read_data is re-assigned
as the value in current address. 

- If memwrite is true, then read_data is unaltered,
and instead, the value in the current address is
changed to rdata2out. 
*/

module Data_Mem(
    input MemWrite,
    input [31:0] ALU_Result,
    input [31:0] ReadData2_ex_mem,
    input MemRead,
    input clk,
    input rst,
    output reg [31:0] DataMem_ReadData
    );

reg [31:0] DMEM[0:255];
reg [0:255] addr;
integer i;

initial begin
    DataMem_ReadData <= 0;
    $readmemb("data.txt",DMEM);
    for(i = 0; i < 6; i = i + 1)
    $display("\tDMEM[%0d] = %0b", i, DMEM[i]);
end

always @(addr) begin
    if (MemRead)
    DataMem_ReadData <= DMEM[addr];
    if(MemWrite)
    DMEM[addr] <= ReadData2_ex_mem;
end

endmodule
