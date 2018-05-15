//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
wire        [4-1:0] ALUCtrl_o;

//Parameter

//Select exact operation

// 010 => R-type
// 100 => addi
// 011 => beq
// 111 => slti
// 101 => lui
// 110 => ori
// 001 => bne

assign ALUCtrl_o = (ALUOp_i == 3'b010 && funct_i == 6'b100001)? 4'b0010: //addu 2
                   (ALUOp_i == 3'b010 && funct_i == 6'b100011)? 4'b0110: //subu 6 
                   (ALUOp_i == 3'b010 && funct_i == 6'b100101)? 4'b0001: //or     1
                   (ALUOp_i == 3'b010 && funct_i == 6'b100100)? 4'b0000: //and  0
                   (ALUOp_i == 3'b010 && funct_i == 6'b101010)? 4'b0111: //slt    7
                   (ALUOp_i == 3'b010 && funct_i == 6'b000011)? 4'b1101: //sra  13
                   (ALUOp_i == 3'b010 && funct_i == 6'b000111)? 4'b0011: //srav 3
                   (ALUOp_i == 3'b101)? 4'b1110: //LUI                                                14
                   (ALUOp_i == 3'b100)? 4'b1000:  //addi                                               8
                   (ALUOp_i == 3'b011)? 4'b0100:  //beq                                                4
                   (ALUOp_i == 3'b001)? 4'b1010:  //bne                                              10
                   (ALUOp_i == 3'b111)? 4'b0101:  //sltiu                                               5
                   (ALUOp_i == 3'b110)? 4'b1001 : 4'b0000;//ORI                              9
endmodule     





                    
                    