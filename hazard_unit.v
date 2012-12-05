module hazard_unit(input [4:0] IF_ID_RegAdd_RS, input [4:0] IF_ID_RegAdd_RT, 
	input [4:0] ID_EX_RegWriteAdd, 
	input ID_EX_MemRead,
	output IF_ID_Write, output PCWrite, output ID_EX_Mux);
	
	assign IF_ID_Write = ID_EX_MemRead && 
		((ID_EX_RegWriteAdd == IF_ID_RegAdd_RS) || (ID_EX_RegWriteAdd == IF_ID_RegAdd_RT));
	
	assign PCWrite = ID_EX_MemRead && 
		((ID_EX_RegWriteAdd == IF_ID_RegAdd_RS) || (ID_EX_RegWriteAdd == IF_ID_RegAdd_RT));
	
	assign ID_EX_Mux = ID_EX_MemRead && 
		((ID_EX_RegWriteAdd == IF_ID_RegAdd_RS) || (ID_EX_RegWriteAdd == IF_ID_RegAdd_RT));
	
	
endmodule