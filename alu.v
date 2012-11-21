module ALU(input [5:0] opcode, input [5:0] funct, input [31:0] A, input [31:0] B, 
			  output reg[31:0] ALUResult, output wire zero);
	
	assign zero = (opcode == 4 && A == B) ? 1 : 0;
	
	always@(opcode or A or B)
	begin
		ALUResult <= 0;
		
		case(opcode)
			6'h0: //ADD R[rd] = R[rs] + R[rt]
				ALUResult <= (funct == 6'h20) ? A + B : 0;
			6'h8: //ADDI R[rt] = R[rs] + SignExtImm
				ALUResult <= A + B;
			6'h4: //BEQ if(R[rs] == R[rt]) PC = PC + 4 + BranchAddr
				ALUResult <= A + B;
			6'h23: //LW -- R[rt] = M[R[rs] + SignExtImm]
				ALUResult <= A + B;
			6'h2b: //SW -- M[R[rs] + SignExtImm] = R[rt]
				ALUResult <= A + B;
		endcase
	end
endmodule