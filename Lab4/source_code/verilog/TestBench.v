`timescale 1ns / 1ps
`define	CYCLE_TIME 20

module TestBench;
	reg	CLK, START;
	integer	handle1, handle2;

	CPU	cpu(
				.clk_i(CLK),
				.start_i(START)
				);

initial	begin
		CLK	=	0;
		START	=	0;
		handle1	=	$fopen("ICACHE.txt");
		handle2	=	$fopen("DCACHE.txt");

		#(`CYCLE_TIME)

		START	=	1;
		#(`CYCLE_TIME*1000)	begin
		$fclose(handle1);
		$fclose(handle2);
		$stop;
		end
end

always #(`CYCLE_TIME/2)	CLK	=	~CLK;

always@(posedge	CLK) begin

 if(cpu.IM.instr_o !=	32'd0)
	$fdisplay(handle1, "%h\n", cpu.IM.addr_i);
 else;

 if(cpu.DM.MemWrite_i	|| cpu.DM.MemRead_i)
	$fdisplay(handle2, "%h\n", cpu.DM.addr_i);
 else;

 end

endmodule
