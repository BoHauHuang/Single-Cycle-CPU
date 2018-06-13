//0511097 ¶À¬f»¨¡B0516329 ¶À¬R¹ü

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o, 
	shamt
	);
     
//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [5-1: 0]  ctrl_i;
input  [5-1: 0]   shamt;   

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
wire             zero_o;
integer          i = 0;
reg    [32-1:0] ones = 32'b11111111111111111111111111111111;
reg    [32-1:0] reg_2;
//assign src2_i[31:16] = (src2_i[15] == 1'b1)?;
//Parameter
assign zero_o = result_o ;
//Main function
always @(ctrl_i,src1_i,src2_i)begin
 // case (ctrl_i)
    ones = 32'b11111111111111111111111111111111;
    if(ctrl_i == 0)result_o<= src1_i&src2_i;                                //or
    else if(ctrl_i == 1)result_o<= src1_i | src2_i;                         //and
	else if(ctrl_i == 2)result_o<=src1_i+src2_i;                            //addu 
	else if(ctrl_i == 3)                                               //srav
    begin                                              
             if(src2_i[31] == 1)begin
               ones = ones << (32-src1_i);
               reg_2 = src2_i>>src1_i;
               result_o<= (ones | reg_2 );
             end
             else result_o<=src2_i>>src1_i;
    end                       
	else if(ctrl_i == 4)result_o<= (src1_i == src2_i)? 1'b1:1'b0;           //beq
	else if(ctrl_i == 5)result_o<= (src1_i < src2_i)? 1'b1:1'b0;            //sltiu
	else if(ctrl_i == 6)result_o<=src1_i-src2_i;                            //subu
	else if(ctrl_i == 7)result_o<= (src1_i < src2_i)? 1'b1:1'b0;            //slt
	else if(ctrl_i == 8)result_o[31:0]<= src1_i[31:0] + src2_i[31:0];       //addi 
	else if(ctrl_i == 9)result_o<= (src1_i | src2_i);                       //ORI
	else if(ctrl_i == 10)result_o <= (src1_i == src2_i)? 1'b0:1'b1;          //bne
	else if(ctrl_i == 11)result_o <= (src1_i < src2_i)? 1'b1:1'b0;           //bltz
	else if(ctrl_i == 12)result_o<= src1_i*src2_i;                          //mul
	else if(ctrl_i == 13)begin                                              //sra
	     if(src2_i[31] == 1)begin
	       ones = ones << (32-shamt);
	       reg_2 = src2_i>>shamt;
	       result_o<= (ones | reg_2 );
	     end
	     else result_o<=src2_i>>shamt;
    end
	else if(ctrl_i == 14)result_o <= src2_i<<16;                             //LUI  
	else if(ctrl_i == 15)result_o <= (src1_i <= src2_i)? 1'b1:1'b0;          //ble
	else result_o<= 0;
	
end


endmodule





                    
                    