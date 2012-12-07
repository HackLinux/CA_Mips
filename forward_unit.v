module forward_unit(input [4:0] ID_EX_RS, input [4:0] ID_EX_RT, 
	input [4:0] EX_MEM_RegWriteAdd, 
	input EX_MEM_RegWrite, input EX_MEM_MemtoReg, 
	input [4:0] MEM_WB_RegWriteAdd,
	input MEM_WB_RegWrite, input MEM_WB_MemtoReg,
	output [1:0] ALU_Mux1, output [1:0] ALU_Mux2);
	
	reg [1:0] Mux1;
	reg [1:0] Mux2;
	
	assign ALU_Mux1 = Mux1;
	assign ALU_Mux2 = Mux2;
	
	always@(*) begin
	if((MEM_WB_RegWriteAdd == ID_EX_RS) && (ID_EX_RS != 0) && MEM_WB_RegWrite)
		begin
			Mux1 = 2'b01;
		end 
	else if((EX_MEM_RegWriteAdd == ID_EX_RS) && (ID_EX_RS != 0) && EX_MEM_RegWrite)
		begin
			Mux1 = 2'b10;
		end
	else
		begin
			Mux1 = 2'b00;
		end
	
	if((MEM_WB_RegWriteAdd == ID_EX_RT) && (ID_EX_RT != 0) && MEM_WB_RegWrite)
		begin
			Mux2 = 2'b01;
		end
	else if((EX_MEM_RegWriteAdd == ID_EX_RT) && (ID_EX_RT != 0) && EX_MEM_RegWrite)
		begin
			Mux2 = 2'b10;
		end
	else
		begin
			Mux2 = 2'b00;
		end
	end
	
	endmodule