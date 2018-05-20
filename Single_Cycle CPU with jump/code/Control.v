module Control(
    instr_op_i,
    Branch_o,
    MemToReg_o,
    BranchType_o,
    Jump_o,
    MemRead_o,
    MemWrite_o,
    ALU_op_o,
    ALUSrc_o,
	RegWrite_o,
	RegDst_o
	);
     
//I/O ports
input  [6-1:0] instr_op_i;

output         Branch_o;
output         MemToReg_o;
output         BranchType_o;
output         Jump_o;
output         MemRead_o;
output         MemWrite_o;
output [4-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegWrite_o;
output         RegDst_o;

 
//Internal Signals
wire    [4-1:0] ALU_op_o;
wire            ALUSrc_o;
wire            RegWrite_o;
wire            RegDst_o;
wire            Branch_o;


//Parameter

assign RegDst_o = (instr_op_i == 6'b000000)? 1'b1:1'b0;
assign RegWrite_o = ((instr_op_i != 6'b000100&&instr_op_i != 6'b000101) || instr_op_i == 6'b100011)? 1'b1:1'b0;
assign Branch_o = (instr_op_i == 6'b000100 || instr_op_i == 6'b000101)? 1'b1:1'b0;
assign ALUSrc_o = (instr_op_i == 6'b001011||instr_op_i == 6'b001000||instr_op_i == 6'b001111||instr_op_i == 6'b001101)? 1'b1:1'b0;
assign MemWrite_o = (instr_op_i == 6'b101011)? 1'b1:1'b0;
assign MemRead_o = (instr_op_i == 6'b100011)? 1'b1:1'b0;
assign Jump_o = (instr_op_i == 6'b000010 || instr_op_i == 6'b000011 || instr_op_i == 6'b000000)? 1'b1:1'b0;
// 010 => R-type
// 100 => addi
// 011 => beq
// 111 => slti
// 101 => lui
// 110 => ori
// 001 => bne

assign ALU_op_o = (instr_op_i == 6'b000000)? 4'b0010: //addu subu slt sra srav or  and mul  jr
                  (instr_op_i == 6'b001000)? 4'b0100: //addi 
                  (instr_op_i == 6'b000100)? 4'b0011: //beq
                  (instr_op_i == 6'b000101)? 4'b0001: //bne
                  (instr_op_i == 6'b001011)? 4'b0111: //sltiu 
                  (instr_op_i == 6'b001111)? 4'b0101: //LUI
                  (instr_op_i == 6'b001101)? 4'b0110:4'b0001; //ORI

//Main function
endmodule





                    
                    