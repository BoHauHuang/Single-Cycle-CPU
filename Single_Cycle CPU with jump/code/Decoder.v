module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;
 
//Internal Signals
wire    [3-1:0] ALU_op_o;
wire            ALUSrc_o;
wire            RegWrite_o;
wire            RegDst_o;
wire            Branch_o;


//Parameter

assign RegDst_o = (instr_op_i == 6'b000000)? 1'b1:1'b0;
assign RegWrite_o = (instr_op_i != 6'b000100&&instr_op_i != 6'b000101)? 1'b1:1'b0;
assign Branch_o = (instr_op_i == 6'b000100 || instr_op_i == 6'b000101)? 1'b1:1'b0;
assign ALUSrc_o = (instr_op_i == 6'b001011||instr_op_i == 6'b001000||instr_op_i == 6'b001111||instr_op_i == 6'b001101)? 1'b1:1'b0;

// 010 => R-type
// 100 => addi
// 011 => beq
// 111 => slti
// 101 => lui
// 110 => ori
// 001 => bne

assign ALU_op_o = (instr_op_i == 6'b000000)? 3'b010: //addu subu slt sra srav or  and
                  (instr_op_i == 6'b001000)? 3'b100: //addi 
                  (instr_op_i == 6'b000100)? 3'b011: //beq
                  (instr_op_i == 6'b000101)? 3'b001: //bne
                  (instr_op_i == 6'b001011)? 3'b111: //sltiu 
                  (instr_op_i == 6'b001111)? 3'b101: //LUI
                  (instr_op_i == 6'b001101)? 3'b110:3'b001; //ORI

//Main function
endmodule





                    
                    