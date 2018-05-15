//0516329 ¶À¬R¹ü
//0511097 ¶À¬f»¨
`timescale 1ns/1ps

module alu(
	rst_n,         // negative reset            (input)
	src1,          // 32 bits source 1          (input)
	src2,          // 32 bits source 2          (input)
	ALU_control,   // 4 bits ALU control input  (input)
	bonus_control, // 3 bits bonus control input(input)
	result,        // 32 bits result            (output)
	zero,          // 1 bit when the output is 0, zero must be set (output)
	cout,          // 1 bit carry out           (output)
	overflow       // 1 bit overflow            (output)
);
 

input				rst_n;
input	[32-1:0]	src1;
input	[32-1:0]	src2;
input	[4-1:0]		ALU_control;
input	[3-1:0]		bonus_control;

output	[32-1:0]	result;
output				zero;
output				cout;
output				overflow;

reg		[32-1:0]	result;
reg					zero;
reg					cout;
reg					overflow;

wire            B_invert,A_invert;
wire            [32-1:0] carry_out;
wire            [32-1:0] result_temp;
wire            set_less;
wire            equal;
wire            set_equal;
wire            cin_control;
wire            false = 1'b0;
wire            [31:0]src1temp,src2temp;

assign set_equal = (src1 == src2)? 1'b1:1'b0;
assign B_invert = ALU_control[2];
assign A_invert = ALU_control[3];
assign src1temp = src1;
assign src2temp = src2;
assign cin_control = (ALU_control[2])? 1'b1:1'b0;

alu_top top1(  .src1(src1temp[0]),       //1 bit source 1 (input)
               .src2(src2temp[0]),       //1 bit source 2 (input)
               .less(set_less),       //1 bit less     (input)
               .equal(set_equal),   //1 bit equal     (input)
               .A_invert(A_invert),   //1 bit A_invert (input)
               .B_invert(B_invert),   //1 bit B_invert (input)
               .cin(cin_control),        //1 bit carry in (input)
               .operation(ALU_control[3:0]),  //operation      (input)
               .func(bonus_control[2:0]),
               .result(result_temp[0]),     //1 bit result   (output)
               .cout(carry_out[0])
               );

alu_top top2(  .src1(src1temp[1]),       //1 bit source 1 (input)
             .src2(src2temp[1]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[0]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[1]),       //1 bit result)
             .cout(carry_out[1])
           );
alu_top top3(  .src1(src1temp[2]),       //1 bit source 1 (input)
             .src2(src2temp[2]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[1]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[2]),       //1 bit result)
             .cout(carry_out[2])
           );
alu_top top4(  .src1(src1temp[3]),       //1 bit source 1 (input)
             .src2(src2temp[3]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[2]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[3]),       //1 bit result)
             .cout(carry_out[3])
           );
alu_top top5(  .src1(src1temp[4]),       //1 bit source 1 (input)
             .src2(src2temp[4]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[3]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[4]),       //1 bit result)
             .cout(carry_out[4])
           );
alu_top top6(  .src1(src1temp[5]),       //1 bit source 1 (input)
             .src2(src2temp[5]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[4]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[5]),       //1 bit result)
             .cout(carry_out[5])
           );
alu_top top7(  .src1(src1temp[6]),       //1 bit source 1 (input)
             .src2(src2temp[6]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[5]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[6]),       //1 bit result)
             .cout(carry_out[6])
           );
alu_top top8(  .src1(src1temp[7]),       //1 bit source 1 (input)
             .src2(src2temp[7]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[6]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[7]),       //1 bit result)
             .cout(carry_out[7])
           );
alu_top top9(  .src1(src1temp[8]),       //1 bit source 1 (input)
             .src2(src2temp[8]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[7]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[8]),       //1 bit result)
             .cout(carry_out[8])
           );
alu_top top10(  .src1(src1temp[9]),       //1 bit source 1 (input)
             .src2(src2temp[9]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[8]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[9]),       //1 bit result)
             .cout(carry_out[9])
           );
alu_top top11(  .src1(src1temp[10]),       //1 bit source 1 (input)
             .src2(src2temp[10]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[9]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[10]),       //1 bit result)
             .cout(carry_out[10])
           );
alu_top top12(  .src1(src1temp[11]),       //1 bit source 1 (input)
             .src2(src2temp[11]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[10]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[11]),       //1 bit result)
             .cout(carry_out[11])
           );
alu_top top13(  .src1(src1temp[12]),       //1 bit source 1 (input)
             .src2(src2temp[12]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[11]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[12]),       //1 bit result)
             .cout(carry_out[12])
           );
alu_top top14(  .src1(src1temp[13]),       //1 bit source 1 (input)
             .src2(src2temp[13]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[12]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[13]),       //1 bit result)
             .cout(carry_out[13])
           );
alu_top top15(  .src1(src1temp[14]),       //1 bit source 1 (input)
             .src2(src2temp[14]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[13]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[14]),       //1 bit result)
             .cout(carry_out[14])
           );
alu_top top16(  .src1(src1temp[15]),       //1 bit source 1 (input)
             .src2(src2temp[15]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[14]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[15]),       //1 bit result)
             .cout(carry_out[15])
           );
alu_top top17(  .src1(src1temp[16]),       //1 bit source 1 (input)
             .src2(src2temp[16]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[15]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[16]),       //1 bit result)
             .cout(carry_out[16])
           );
alu_top top18(  .src1(src1temp[17]),       //1 bit source 1 (input)
             .src2(src2temp[17]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[16]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[17]),       //1 bit result)
             .cout(carry_out[17])
           );
alu_top top19(  .src1(src1temp[18]),       //1 bit source 1 (input)
             .src2(src2temp[18]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[17]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[18]),       //1 bit result)
             .cout(carry_out[18])
           );
alu_top top20(  .src1(src1temp[19]),       //1 bit source 1 (input)
             .src2(src2temp[19]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[18]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[19]),       //1 bit result)
             .cout(carry_out[19])
           );
alu_top top21(  .src1(src1temp[20]),       //1 bit source 1 (input)
             .src2(src2temp[20]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[19]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[20]),       //1 bit result)
             .cout(carry_out[20])
           );
alu_top top22(  .src1(src1temp[21]),       //1 bit source 1 (input)
             .src2(src2temp[21]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[20]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[21]),       //1 bit result)
             .cout(carry_out[21])
           );
alu_top top23(  .src1(src1temp[22]),       //1 bit source 1 (input)
             .src2(src2temp[22]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[21]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[22]),       //1 bit result)
             .cout(carry_out[22])
           );
alu_top top24(  .src1(src1temp[23]),       //1 bit source 1 (input)
             .src2(src2temp[23]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[22]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[23]),       //1 bit result)
             .cout(carry_out[23])
           );
alu_top top25(  .src1(src1temp[24]),       //1 bit source 1 (input)
             .src2(src2temp[24]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[23]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[24]),       //1 bit result)
             .cout(carry_out[24])
           );
alu_top top26(  .src1(src1temp[25]),       //1 bit source 1 (input)
             .src2(src2temp[25]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[24]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[25]),       //1 bit result)
             .cout(carry_out[25])
           );
alu_top top27(  .src1(src1temp[26]),       //1 bit source 1 (input)
             .src2(src2temp[26]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[25]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[26]),       //1 bit result)
             .cout(carry_out[26])
           );
alu_top top28(  .src1(src1temp[27]),       //1 bit source 1 (input)
             .src2(src2temp[27]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[26]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[27]),       //1 bit result)
             .cout(carry_out[27])
           );
alu_top top29(  .src1(src1temp[28]),       //1 bit source 1 (input)
             .src2(src2temp[28]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[27]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[28]),       //1 bit result)
             .cout(carry_out[28])
           );
alu_top top30(  .src1(src1temp[29]),       //1 bit source 1 (input)
             .src2(src2temp[29]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[28]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[29]),       //1 bit result)
             .cout(carry_out[29])
           );
alu_top top31(  .src1(src1temp[30]),       //1 bit source 1 (input)
             .src2(src2temp[30]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[29]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[30]),       //1 bit result)
             .cout(carry_out[30])
           );

alu_bottom bottom(  .src1(src1temp[31]),       //1 bit source 1 (input)
             .src2(src2temp[31]),       //1 bit source 2 (input)
              .less(false),       //1 bit less     (input)
              .equal(false),   //1 bit equal     (input)
              .A_invert(A_invert),   //1 bit A_invert (input)
              .B_invert(B_invert),   //1 bit B_invert (input)
             .cin(carry_out[30]),       //1 bit carry in input)
              .operation(ALU_control[3:0]),  //operation      (input)
              .func(bonus_control[2:0]),
             .result(result_temp[31]),       //1 bit result)
             .cout(carry_out[31]),       //1 bit carry out)
             .set_less(set_less)
       );
      
     
      
always@(*)begin
           result <= result_temp;
end

always@(*) begin
    if(!rst_n) begin
    overflow <= 0;
    end
    else begin
        if((carry_out[31] && ALU_control[3:0] == 4'b0010) || (~carry_out[31] && ALU_control[3:0] == 4'b0110)) overflow <= 1;
        else overflow <= 0; 
    end
end

always@(*)
begin
    if(~rst_n) 
        zero <= 0;
    else if(result_temp == 0) zero <= 1;
    else zero <= 0;
end
always@(*)
begin
    if(~rst_n) 
        cout <= 0;
    else cout <= carry_out[31];
end

endmodule
