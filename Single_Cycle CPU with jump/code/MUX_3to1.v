module MUX_3to1(
               data0_i,
               data1_i,
               data2_i,
               select_i,
               data_o
               );

parameter size = 0;
			
//I/O ports               
input   [size-1:0] data0_i;          
input   [size-1:0] data1_i;
input   [size-1:0] data2_i;
input   [2-1:0] select_i;
output  [size-1:0] data_o; 

//Internal Signals
wire     [size-1:0] data_o;
//Main function
assign data_o = (select_i == 2'b00)? data0_i:
                (select_i == 2'b01)? data1_i:data2_i;

endmodule      
          
          
          
          