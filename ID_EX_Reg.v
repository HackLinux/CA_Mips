module ID_EX_Reg(input clk, input rst, input ID_EX_Mux,
	input RegWrite, input MemtoReg, 
	input Branch, input MemRead, input MemWrite, 
	input RegDest, input [5:0] ALUOp, input ALUSrc,
	input [31:0] address, input [31:0] RegData1, input [31:0] RegData2, input [31:0] SignExtend, 
	input [4:0] RegWriteAdd1, input [4:0] RegWriteAdd2,
	input [4:0] RegAdd1, input [4:0] RegAdd2,
	output RegWrite_Out, output MemtoReg_Out, 
	output Branch_Out, output MemRead_Out, output MemWrite_Out, 
	output RegDest_Out, output [5:0] ALUOp_Out, output ALUSrc_Out,
	output [31:0] address_Out, output [31:0] RegData1_Out, output [31:0] RegData2_Out, output [31:0] SignExtend_Out, 
	output [4:0] RegWriteAdd1_Out, output [4:0] RegWriteAdd2_Out,
	output [4:0] RegAdd1_Out, output [4:0] RegAdd2_Out);
	
	reg RegWrite_Reg;
	reg MemtoReg_Reg;
	reg Branch_Reg;
	reg MemRead_Reg;
	reg MemWrite_Reg;
	reg RegDest_Reg; 
	reg [5:0] ALUOp_Reg; 
	reg ALUSrc_Reg;
	reg [31:0] address_Reg; 
	reg [31:0] RegData1_Reg; 
	reg [31:0] RegData2_Reg; 
	reg [31:0] SignExtend_Reg; 
	reg [4:0] RegWriteAdd1_Reg; 
	reg [4:0] RegWriteAdd2_Reg;
	reg [4:0] RegAdd1_Reg;
	reg [4:0] RegAdd2_Reg;
	
	assign RegWrite_Out = RegWrite_Reg; 
	assign MemtoReg_Out = MemtoReg_Reg; 
	assign Branch_Out = Branch_Reg; 
	assign MemRead_Out = MemRead_Reg; 
	assign MemWrite_Out = MemWrite_Reg; 
	assign RegDest_Out = RegDest_Reg; 
	assign ALUOp_Out = ALUOp_Reg; 
	assign ALUSrc_Out = ALUSrc_Reg;
	assign address_Out = address_Reg; 
	assign RegData1_Out = RegData1_Reg; 
	assign RegData2_Out = RegData2_Reg; 
	assign SignExtend_Out = SignExtend_Reg; 
	assign RegWriteAdd1_Out = RegWriteAdd1_Reg; 
	assign RegWriteAdd2_Out = RegWriteAdd2_Reg;
	assign RegAdd1_Out = RegAdd1_Reg;
	assign RegAdd2_Out = RegAdd2_Reg;
	
	always@(negedge clk, posedge rst)
	begin
		if(rst)
		begin
			RegWrite_Reg <= 0;
			MemtoReg_Reg <= 0;
			Branch_Reg <= 0;
			MemRead_Reg <= 0;
			MemWrite_Reg <= 0;
			RegDest_Reg <= 0; 
			ALUOp_Reg <= 0; 
			ALUSrc_Reg <= 0;
			address_Reg <= 0; 
			RegData1_Reg <= 0; 
			RegData2_Reg <= 0; 
			SignExtend_Reg <= 0; 
			RegWriteAdd1_Reg <= 0; 
			RegWriteAdd2_Reg <= 0;
			RegAdd1_Reg <= 0;
			RegAdd2_Reg <= 0;
		end
		else
		begin
			RegWrite_Reg 		<= ID_EX_Mux ? 0 : RegWrite;
			MemtoReg_Reg 		<= ID_EX_Mux ? 0 : MemtoReg;
			Branch_Reg 			<= ID_EX_Mux ? 0 : Branch;
			MemRead_Reg 		<= ID_EX_Mux ? 0 : MemRead;
			MemWrite_Reg 		<= ID_EX_Mux ? 0 : MemWrite;
			RegDest_Reg 		<= ID_EX_Mux ? 0 : RegDest; 
			ALUOp_Reg 			<= ID_EX_Mux ? 0 : ALUOp; 
			ALUSrc_Reg 			<= ID_EX_Mux ? 0 : ALUSrc;
			address_Reg 		<= address; 
			RegData1_Reg 		<= RegData1; 
			RegData2_Reg 		<= RegData2; 
			SignExtend_Reg 	<= SignExtend; 
			RegWriteAdd1_Reg 	<= RegWriteAdd1; 
			RegWriteAdd2_Reg 	<= RegWriteAdd2;
			RegAdd1_Reg 		<= RegAdd1;
			RegAdd2_Reg 		<= RegAdd2;
		end
	end
	
endmodule