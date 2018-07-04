//0511097 ¶À¬f»¨¡B0516329 ¶À¬R¹ü
`timescale 1ns / 1ps
module Instr_Memory(
    addr_i,
	instr_o
);
 
// Interface
input  [31:0]	addr_i;
output [31:0]	instr_o;

// Internal Signals
integer          i;

// Instruction File
reg		[31:0]		instruction_file	[0:65-1];

//Initial Memory Contents
initial begin
    for ( i=0; i<65; i=i+1 )
            instruction_file[i] = 32'b0;
    $readmemb("lab4_test_data.txt", instruction_file);  //Read instruction from "lab5_test_data.txt"   
end

assign	instr_o = instruction_file[addr_i/4];

endmodule
