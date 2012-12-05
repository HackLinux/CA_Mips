module forward_unit(input [4:0] ID_EX_RS, input [4:0] ID_EX_RT, 
	input [4:0] EX_MEM_RegWriteAdd, 
	input EX_MEM_RegWrite, input EX_MEM_MemtoReg, 
	input [4:0] MEM_WB_RegWriteAdd,
	input MEM_WB_RegWrite, input MEM_WB_MemtoReg,
	output [1:0] ALU_Mux1, output [1:0] ALU_Mux2);
	
	assign ALU_Mux1 = (EX_MEM_RegWrite && (EX_MEM_RegWriteAdd != 0) && (EX_MEM_RegWriteAdd == ID_EX_RS)) ? 	2'b10 :
							(MEM_WB_RegWrite && (MEM_WB_RegWriteAdd != 0) && 
								!(EX_MEM_RegWrite && (EX_MEM_RegWriteAdd != 0) && (EX_MEM_RegWriteAdd != ID_EX_RS)) 
								&& (MEM_WB_RegWriteAdd == ID_EX_RS)) 															? 	2'b01 : 
																																				2'b00;
	assign ALU_Mux2 = (EX_MEM_RegWrite && (EX_MEM_RegWriteAdd != 0) && (EX_MEM_RegWriteAdd == ID_EX_RT)) ? 	2'b10 :
							(MEM_WB_RegWrite && (MEM_WB_RegWriteAdd != 0) && 
								!(EX_MEM_RegWrite && (EX_MEM_RegWriteAdd != 0) && (EX_MEM_RegWriteAdd != ID_EX_RT)) 
								&& (MEM_WB_RegWriteAdd == ID_EX_RT)) 															? 	2'b01 : 
																																				2'b00;
endmodule