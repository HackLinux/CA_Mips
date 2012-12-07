module mips_tb();

	reg clk;
	reg rst;
	
	wire  [4*8:1] inst_addr;
	wire  [31:0]  instr;
	wire  [4*8:1] data_addr;
	wire  [31:0]  data_in;
	wire          mem_read;
	wire          mem_write;
	wire  [31:0]  data_out;
	
	mips_cpu_adv uut1(clk,rst,instr,data_out,inst_addr,data_addr,data_in,mem_read,mem_write);
	Memory 		 uut2(clk, inst_addr,instr,data_addr,data_in,mem_read,mem_write,data_out);
	
	always #5 clk = ~clk;
	
	initial begin
		clk = 0;
		//PC reset to 32'h1000 at rst=1
		#1 rst = 1'b1;
		#16 rst = 1'b0;
	end
endmodule