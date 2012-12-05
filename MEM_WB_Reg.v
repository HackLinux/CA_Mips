module MEM_WB_Reg(input clk, input rst,
	input RegWrite, input MemtoReg, 
	input [31:0] MemoryData, input [31:0] ALUResult, 
	input [4:0] RegWriteAdd,
	output RegWrite_Out, output MemtoReg_Out, 
	output [31:0] MemoryData_Out, output [31:0] ALUResult_Out, 
	output [4:0] RegWriteAdd_Out);
	
	reg RegWrite_Reg;
	reg MemtoReg_Reg;
	reg [31:0] MemoryData_Reg; 
	reg [31:0] ALUResult_Reg; 
	reg [4:0] RegWriteAdd_Reg; 
	
	assign RegWrite_Out = RegWrite_Reg; 
	assign MemtoReg_Out = MemtoReg_Reg; 
	assign MemoryData_Out = MemoryData_Reg; 
	assign ALUResult_Out = ALUResult_Reg; 
	assign RegWriteAdd_Out = RegWriteAdd_Reg; 
	
	always@(posedge clk, posedge rst)
	begin
		if(rst)
		begin
			RegWrite_Reg <= 0;
			MemtoReg_Reg <= 0;
			MemoryData_Reg <= 0; 
			ALUResult_Reg <= 0; 
			RegWriteAdd_Reg <= 0; 
		end
		else
		begin
			RegWrite_Reg <= RegWrite;
			MemtoReg_Reg <= MemtoReg;
			MemoryData_Reg <= MemoryData; 
			ALUResult_Reg <= ALUResult; 
			RegWriteAdd_Reg <= RegWriteAdd; 
		end
	end
	
endmodule