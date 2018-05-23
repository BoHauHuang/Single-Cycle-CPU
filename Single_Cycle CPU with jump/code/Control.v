module Control(
    instr_op_i,
    instr_func_i,
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
input  [6-1:0] instr_func_i;
output         Branch_o;
output [2-1:0] MemToReg_o;
output         BranchType_o;
output [2-1:0] Jump_o;
output         MemRead_o;
output         MemWrite_o;
output [4-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegWrite_o;
output         RegDst_o;

 
//Internal Signals
wire    [2-1:0] Jump_o;
wire            MemRead_o;
wire            MemWrite_o;
wire    [2-1:0] MemToReg_o;
wire    [4-1:0] ALU_op_o;
wire            ALUSrc_o;
wire            RegWrite_o;
wire            RegDst_o;
wire            Branch_o;
wire            BranchType_o;

//Parameter
assign MemToReg_o = (instr_op_i == 6'b100011)? 2'b01:(instr_op_i == 6'b001111)? 2'b10:2'b00;
assign RegDst_o = (instr_op_i == 6'b000000)? 1'b1:1'b0;
assign RegWrite_o = ((instr_op_i == 6'b001000)||(instr_op_i == 6'b000000 && instr_func_i != 6'b001000)||(instr_op_i == 6'b100011)||(instr_op_i == 6'b000011)||(instr_op_i == 6'b001111))? 1'b1:1'b0;
//assign RegWrite_o = ((instr_op_i != 6'b000100&&instr_op_i != 6'b000101) || instr_op_i == 6'b100011)? 1'b1:1'b0;
assign Branch_o = (instr_op_i == 6'b000100 || instr_op_i == 6'b000101)? 1'b1:1'b0;
assign ALUSrc_o = (instr_op_i == 6'b001011||instr_op_i == 6'b001000||instr_op_i == 6'b001111||instr_op_i == 6'b001101||instr_op_i == 6'b100011||instr_op_i == 6'b101011)? 1'b1:1'b0;
assign MemWrite_o = (instr_op_i == 6'b101011)? 1'b1:1'b0;
assign MemRead_o = (instr_op_i == 6'b100011)? 1'b1:1'b0;
assign Jump_o = (instr_op_i == 6'b000010 || instr_op_i == 6'b000011)? 2'b00: (instr_op_i == 6'b000000 && instr_func_i == 6'b001000)? 2'b10 : 2'b01;
assign BranchType_o = (instr_op_i == 6'b000101)? 1'b0:1'b1;

// 0010 => R-type
// 0100 => addi
// 0011 => beq
// 0111 => slti
// 0101 => lui
// 0110 => ori
// 0001 => bne

assign ALU_op_o = (instr_op_i == 6'b000000)? 4'b0010: //addu subu slt sra srav or  and mul jr 
                  (instr_op_i == 6'b001000||instr_op_i == 6'b100011||instr_op_i == 6'b101011)? 4'b0100: //addi LW SW
                  (instr_op_i == 6'b000100)? 4'b0011: //beq
                  (instr_op_i == 6'b000001)? 4'b1000: //bltz
                  (instr_op_i == 6'b000110)? 4'b1001: //ble
                  (instr_op_i == 6'b000101)? 4'b0001: //bne bnez
                  (instr_op_i == 6'b001011)? 4'b0111: //sltiu 
                  (instr_op_i == 6'b001111)? 4'b0101: //LUI
                  (instr_op_i == 6'b001101)? 4'b0110:4'b0001; //ORI

//Main function
endmodule





                    
                    