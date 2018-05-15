//0516329 ¶À¬R¹ü
//0511097 ¶À¬f»¨

`timescale 1ns/1ps

module alu_top(
	src1,       //1 bit source 1 (input)
	src2,       //1 bit source 2 (input)
	less,       //1 bit less     (input)
	set_equal,
	A_invert,   //1 bit A_invert (input)
	B_invert,   //1 bit B_invert (input)
	cin,        //1 bit carry in (input)
	operation,  //operation      (input)
	func,      //function          (input)
	equal,     //1 bit equal   (input)
	result,     //1 bit result   (output)
	cout,       //1 bit carry out(output)
	//set,
);

input			src1;
input			src2;
input			less;
input           set_equal;
input			A_invert;
input			B_invert;
input			cin;
input	[4-1:0]	operation;
input   [3-1:0] func;
input           equal;

output			result;
output			cout;
//output          set;

reg				result;
wire  src1temp,src2temp;

assign src1temp = (A_invert)? ~src1:src1;
assign src2temp = (B_invert)? ~src2:src2;
assign cout = (src1temp && src2temp) || (src1temp && cin) || (src2temp && cin);

always @(*) begin
    if(operation == 4'b0000 || operation == 4'b1100) result = src1temp & src2temp;
    else if(operation == 4'b0001 || operation == 4'b1101) result = src1temp | src2temp;
    else if(operation == 4'b0010 || operation == 4'b0110) result = src1temp + src2temp + cin;
    
    else if(operation == 4'b0111 && (func == 3'b000 || func == 3'b110)) result = (less)? 1'b1 : 1'b0;
    else if(operation == 4'b0111 && (func == 3'b001 || func == 3'b111)) result = (less)? less : equal;
    else if(operation == 4'b0111 && (func == 3'b010 || func == 3'b011)) result = (func == 3'b010 && equal)? ~equal : equal;
    
    else result = result;
end

endmodule
