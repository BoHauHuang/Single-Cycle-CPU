//0511097 ¶À¬f»¨¡B0516329 ¶À¬R¹ü
module Shift_Left_Two(
    data_i,
    data_o
    );

parameter size = 0;

//I/O ports                    
input [size-1:0] data_i;
output [size-1:0] data_o;


wire [size-1:0] data_o;

assign data_o[size-1:2] = data_i[size-3:0] ;
assign data_o[1:0] = 2'b00;

endmodule
