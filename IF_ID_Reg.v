module IF_ID_Reg(input clk, input rst, input IF_ID_Write, input [31:0] instr_add, input [31:0] instr,
		output [31:0] address, output [31:0] instruction);

		reg[31:0] instr_reg;
		reg[31:0] addr_reg;
		
		assign instruction = instr_reg;
		assign address = addr_reg;
		
		always@(posedge clk, posedge rst)
		begin
			if(rst)
			begin
				instr_reg <= 0;
				instr_reg <= 0;
			end
			else
			begin
				instr_reg <= (IF_ID_Write == 1'b1) ? instr_reg : instr;
				addr_reg  <= (IF_ID_Write == 1'b1) ? addr_reg  : instr_add;
			end
		end
		
endmodule