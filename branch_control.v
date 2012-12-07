module branch_control(input [31:0] RegData1, input [31:0] RegData2, input [31:0] instruction, 
	input [31:0] address, input [31:0] SignExtend, input branch, input Jump, 
	output DoBranch, output [31:0] BranchAddress);
	
	assign BranchAddress = (Jump) 					 ? (instruction[25:0] << 2) : 
								  ((branch && (RegData1 == RegData2)) ? (address + (SignExtend << 2)) :  
								  32'b0);
								  
	assign DoBranch = (Jump || (branch && (RegData1 == RegData2))) ? 1'b1 : 1'b0;
	
endmodule