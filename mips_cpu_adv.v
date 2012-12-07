module mips_cpu_adv(input clk, input rst, input [31:0] instr, input [31:0] data,
	output [4*8:1] instr_addr, output [4*8:1] data_addr, output [31:0] data_in, output mem_read, output mem_write);
	
	//Control signals
	wire RegDst;
	wire Jump;
	wire Branch;
	wire MemRead;
	wire MemtoReg;
	wire [5:0] ALUOp;
	wire MemWrite;
	wire ALUsrc;
	wire RegWrite;
	wire [5:0] funct;
	
	wire [31:0] ALUResult;
	wire [4:0] RegAdd1;		//Reg Address 1
	wire [4:0] RegAdd2;
	wire [4:0] RegWAdd;		//Reg Write Address
	wire [31:0] RegWData;	//Reg Write Data
	wire [31:0] RegData1;	//Reg Read Data (Output)
	wire [31:0] RegData2;
	wire [31:0] signExtend;
	
	wire [31:0] BranchOut;
	wire Zero;
	wire [31:0] JmpAddr;
	wire [31:0] IncrAddOut;
	wire [31:0] BrnchAddOut;
	reg  [31:0] PC = 31'h1000;
	reg  [31:0] PCIncr = 32'h4;
	wire BRMuxSelect;
	
	//TODO Wires Pipelined
	wire [31:0] IF_ID_address;
	wire [31:0] IF_ID_instruction;
	
	wire ID_EX_RegWrite; 
	wire ID_EX_MemtoReg;
	wire ID_EX_Branch;
	wire ID_EX_MemRead;
	wire ID_EX_MemWrite;	
	wire ID_EX_RegDest;
	wire [5:0] ID_EX_ALUOp;
	wire ID_EX_ALUSrc;
	wire [31:0] ID_EX_address;
	wire [31:0] ID_EX_RegData1;
	wire [31:0] ID_EX_RegData2;
	wire [31:0] ID_EX_SignExtend;
	wire [4:0] ID_EX_RegWriteAdd1;
	wire [4:0] ID_EX_RegWriteAdd2;
	wire [4:0] ID_EX_RegAdd1;
	wire [4:0] ID_EX_RegAdd2;
	

	wire [31:0] ALU_IN_1;
	wire [31:0] ALU_IN_2;
	wire [1:0] ALU_Mux1;
	wire [1:0] ALU_Mux2;
	
	wire EX_MEM_RegWrite;
	wire EX_MEM_MemtoReg;
	wire EX_MEM_Branch;
	wire EX_MEM_MemRead;
	wire EX_MEM_MemWrite;
	wire [31:0] EX_MEM_address;
	wire [31:0] EX_MEM_ALUResult;
	wire EX_MEM_zero;
	wire [31:0] EX_MEM_WriteData;
	wire [4:0] EX_MEM_RegWriteAdd;
	
	wire MEM_WB_RegWrite;
	wire MEM_WB_MemtoReg;
	wire [31:0] MEM_WB_MemoryData;
	wire [31:0] MEM_WB_ALUResult;
	wire [4:0] MEM_WB_RegWriteAdd;
	
	wire [31:0] BranchAddress;
	
	wire IF_ID_Write;
	wire PCWrite;
	wire ID_EX_Mux;
	wire DoBranch;
	
	assign instr_addr = PC;
	
	assign signExtend = {16'b0, IF_ID_instruction[15:0]};
	assign ALUOp = IF_ID_instruction[31:26];
	assign RegAdd1 = IF_ID_instruction[25:21];
	assign RegAdd2 = IF_ID_instruction[20:16];
	
	assign funct = ID_EX_SignExtend[5:0];
	assign RegWAdd = ID_EX_RegDest ? ID_EX_RegWriteAdd2 : ID_EX_RegWriteAdd1; //Register Mux
	
	assign data_addr = EX_MEM_ALUResult;
	assign data_in = EX_MEM_WriteData;
	assign mem_read = EX_MEM_MemRead;
	assign mem_write = EX_MEM_MemWrite;
	//TODO - verify
	assign BRMuxSelect = EX_MEM_Branch & EX_MEM_zero;
	
	//Mux declaration
	wire[31:0] ALU_Mux_In;
	mux ALU_Mux(ALU_Mux_In, ID_EX_SignExtend, ID_EX_ALUSrc, ALU_IN_2);	
	mux3 alu_mux_1(ID_EX_RegData1, RegWData, EX_MEM_ALUResult, ALU_Mux1, ALU_IN_1);
	mux3 alu_mux_2(ID_EX_RegData2, RegWData, EX_MEM_ALUResult, ALU_Mux2, ALU_Mux_In);
	mux MEM_Mux(MEM_WB_ALUResult, MEM_WB_MemoryData, MEM_WB_MemtoReg, RegWData);
	
	//Instruction logic
	add32 instr_add32(PC, PCIncr, IncrAddOut);
	branch_control brancher(RegData1, RegData2, IF_ID_instruction, IF_ID_address, signExtend, Branch, Jump, DoBranch, BranchAddress);
	mux muxxer(IncrAddOut, BranchAddress, DoBranch, BranchOut);
	
	//Main datapath
	control ctrl(ALUOp, RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite);
	regbank registers(RegAdd1, RegAdd2, MEM_WB_RegWriteAdd, RegWData, MEM_WB_RegWrite, RegData1, RegData2, clk, rst);
	ALU m_alu(ID_EX_ALUOp, funct, ALU_IN_1, ALU_IN_2, ALUResult, Zero);
	
	forward_unit forward(ID_EX_RegAdd1, ID_EX_RegAdd2, 
		EX_MEM_RegWriteAdd, EX_MEM_RegWrite, EX_MEM_MemtoReg, 
		MEM_WB_RegWriteAdd, MEM_WB_RegWrite, MEM_WB_MemtoReg,
		ALU_Mux1, ALU_Mux2);
	
	//TODO verify RegAdd1&2
	hazard_unit hazard(RegAdd1, RegAdd2, ID_EX_RegWriteAdd1, ID_EX_MemRead, IF_ID_Write, PCWrite, ID_EX_Mux);
	
	//Attached Correctly Pipelined
	IF_ID_Reg if_id_reg(clk, rst, IF_ID_Write, DoBranch, IncrAddOut, instr, IF_ID_address, IF_ID_instruction);
		
	ID_EX_Reg id_ex_reg(clk, rst, ID_EX_Mux, RegWrite, MemtoReg, Branch, MemRead, MemWrite, RegDst, ALUOp, ALUsrc,
		IF_ID_address, RegData1, RegData2, signExtend, IF_ID_instruction[20:16], IF_ID_instruction[15:11], RegAdd1, RegAdd2, 
		ID_EX_RegWrite, ID_EX_MemtoReg, 
		ID_EX_Branch, ID_EX_MemRead, ID_EX_MemWrite, 
		ID_EX_RegDest, ID_EX_ALUOp, ID_EX_ALUSrc,
		ID_EX_address, ID_EX_RegData1, ID_EX_RegData2, ID_EX_SignExtend, 
		ID_EX_RegWriteAdd1, ID_EX_RegWriteAdd2,
		ID_EX_RegAdd1, ID_EX_RegAdd2);
		
	EX_MEM_Reg ex_mem_reg(clk, rst, ID_EX_RegWrite, ID_EX_MemtoReg, ID_EX_Branch, ID_EX_MemRead, ID_EX_MemWrite, 
		BrnchAddOut, ALUResult, Zero, ALU_Mux_In, RegWAdd,
		EX_MEM_RegWrite, EX_MEM_MemtoReg, EX_MEM_Branch, EX_MEM_MemRead, EX_MEM_MemWrite, 
		EX_MEM_address, EX_MEM_ALUResult, EX_MEM_zero, EX_MEM_WriteData, EX_MEM_RegWriteAdd);
		
	MEM_WB_Reg mem_wb_reg(clk, rst, EX_MEM_RegWrite, EX_MEM_MemtoReg, data, EX_MEM_ALUResult, EX_MEM_RegWriteAdd,
		MEM_WB_RegWrite, MEM_WB_MemtoReg, MEM_WB_MemoryData, MEM_WB_ALUResult, MEM_WB_RegWriteAdd);
		
	always@(negedge clk, posedge rst)
	begin 
		if(rst)
			begin
				PC <= 32'h1000;
			end
		else
			begin
				if(ALUOp == 6'h3f) begin
					#40 $finish;
				end
				PC <= (PCWrite == 1'b1) ? PC : BranchOut;
			end
	end
endmodule
