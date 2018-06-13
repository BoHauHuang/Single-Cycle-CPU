//0511097 ¶À¬f»¨¡B0516329 ¶À¬R¹ü
module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [4-1:0] ALUOp_i;

output     [5-1:0] ALUCtrl_o;    
     
//Internal Signals
wire        [5-1:0] ALUCtrl_o;

//Parameter

//Select exact operation

// 0010 => R-type
// 0100 => addi
// 0011 => beq
// 0111 => slti
// 0101 => lui
// 0110 => ori
// 0001 => bne

assign ALUCtrl_o = (ALUOp_i == 4'b0010 && funct_i == 6'b100001)? 5'b00010: //addu 2
                   (ALUOp_i == 4'b0010 && funct_i == 6'b100011)? 5'b00110: //subu 6 
                   (ALUOp_i == 4'b0010 && funct_i == 6'b100101)? 5'b00001: //or     1
                   (ALUOp_i == 4'b0010 && funct_i == 6'b100100)? 5'b00000: //and  0
                   (ALUOp_i == 4'b0010 && funct_i == 6'b101010)? 5'b00111: //slt    7
                   (ALUOp_i == 4'b0010 && funct_i == 6'b000011)? 5'b01101: //sra  13
                   (ALUOp_i == 4'b0010 && funct_i == 6'b000111)? 5'b00011: //srav 3
                   (ALUOp_i == 4'b0010 && funct_i == 6'b011000)? 5'b01100: // mul 12
                   (ALUOp_i == 4'b0101)? 5'b01110: //LUI                                                14
                   (ALUOp_i == 4'b0100)? 5'b01000:  //addi                                               8
                   (ALUOp_i == 4'b0011)? 5'b00100:  //beq                                                4
                   (ALUOp_i == 4'b0001)? 5'b01010:  //bne  bnez                                            10
                   (ALUOp_i == 4'b1000)? 5'b01011:  //bltz                                               11
                   (ALUOp_i == 4'b1001)? 5'b01111:  //ble                                                15
                   (ALUOp_i == 4'b0111)? 5'b00101:  //sltiu                                               5
                   (ALUOp_i == 4'b0110)? 5'b01001 : 4'b0000;//ORI                              9
endmodule     





                    
                    