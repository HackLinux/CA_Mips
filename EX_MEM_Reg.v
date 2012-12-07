module EX_MEM_Reg(input clk, input rst,
	input RegWrite, input MemtoReg, 
	input Branch, input MemRead, input MemWrite, 
	input [31:0] address, input [31:0] ALUResult, input zero, input [31:0] WriteData, 
	input [4:0] RegWriteAdd,
	output RegWrite_Out, output MemtoReg_Out, 
	output Branch_Out, output MemRead_Out, output MemWrite_Out, 
	output [31:0] address_Out, output [31:0] ALUResult_Out, output zero_Out, output [31:0] WriteData_Out, 
	output [4:0] RegWriteAdd_Out);
	
	reg RegWrite_Reg;
	reg MemtoReg_Reg;
	reg Branch_Reg;
	reg MemRead_Reg;
	reg MemWrite_Reg;
	reg [31:0] address_Reg; 
	reg [31:0] ALUResult_Reg; 
	reg zero_Reg; 
	reg [31:0] WriteData_Reg; 
	reg [4:0] RegWriteAdd_Reg; 
	
	assign RegWrite_Out = RegWrite_Reg; 
	assign MemtoReg_Out = MemtoReg_Reg; 
	assign Branch_Out = Branch_Reg; 
	assign MemRead_Out = MemRead_Reg; 
	assign MemWrite_Out = MemWrite_Reg; 
	assign address_Out = address_Reg; 
	assign ALUResult_Out = ALUResult_Reg; 
	assign zero_Out = zero_Reg; 
	assign WriteData_Out = WriteData_Reg; 
	assign RegWriteAdd_Out = RegWriteAdd_Reg; 
	
	always@(negedge clk, posedge rst)
	begin
		if(rst)
		begin
			RegWrite_Reg <= 0;
			MemtoReg_Reg <= 0;
			Branch_Reg <= 0;
			MemRead_Reg <= 0;
			MemWrite_Reg <= 0;
			address_Reg <= 0; 
			ALUResult_Reg <= 0; 
			zero_Reg <= 0; 
			WriteData_Reg <= 0; 
			RegWriteAdd_Reg <= 0; 
		end
		else
		begin
			RegWrite_Reg <= RegWrite;
			MemtoReg_Reg <= MemtoReg;
			Branch_Reg <= Branch;
			MemRead_Reg <= MemRead;
			MemWrite_Reg <= MemWrite;
			address_Reg <= address; 
			ALUResult_Reg <= ALUResult; 
			zero_Reg <= zero; 
			WriteData_Reg <= WriteData; 
			RegWriteAdd_Reg <= RegWriteAdd; 
		end
	end
	
endmodule