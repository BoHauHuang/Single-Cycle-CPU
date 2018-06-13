`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:     
// Design Name: 
// Module Name:    Instruction_Memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Instruction_Memory
(
	addr_i, 
	instr_o
);

// Interface
input	[31:0]		addr_i;
output	[31:0]		instr_o;
integer          i;

// Instruction File
reg		[31:0]		instruction_file	[0:65-1];

initial begin

    for ( i=0; i<65; i=i+1 )
            instruction_file[i] = 32'b0;
        
    $readmemb("lab5_test_data.txt", instruction_file);  //Read instruction from "lab5_test_data.txt"   
end

assign	instr_o = instruction_file[addr_i/4];  

endmodule
