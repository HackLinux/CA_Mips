module mips_cpu(input clk, input rst, input [31:0] instr, input [31:0] data,
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
	
	wire [31:0] ALU_IN_1;
	wire [31:0] ALU_IN_2;
	
	wire [31:0] signExtend;
	
	wire [31:0] BRMuxOut;
	wire [31:0] JMPMuxOut;
	wire Zero;
	wire [31:0] JmpAddr;
	wire [31:0] IncrAddOut;
	wire [31:0] BrnchAddOut;
	reg  [31:0] PC = 31'h1000;
	reg  [31:0] PCIncr = 32'h4;
	wire BRMuxSelect;
	
	
	assign signExtend = {16'b0, instr[15:0]};
	assign ALUOp = instr[31:26];
	assign funct = instr[5:0];
	assign RegAdd1 = instr[25:21];
	assign RegAdd2 = instr[20:16];
	assign ALU_IN_1 = RegData1;
	
	assign data_addr = ALUResult;
	assign data_in = RegData2;
	assign mem_read = MemRead;
	assign mem_write = MemWrite;
	assign instr_addr = PC;
	assign JmpAddr = instr[25:0] << 2;
	assign BRMuxSelect = Branch & Zero;
	assign RegWAdd = RegDst ? instr[15:11] : instr[20:16]; //Register Mux
	
	//Mux declaration
	mux ALU_Mux(RegData2, signExtend, ALUsrc, ALU_IN_2);	
	mux MEM_Mux(ALUResult, data, MemtoReg, RegWData);
	
	//Instruction logic
	add32 instr_add32(PC, PCIncr, IncrAddOut);
	add32 brnch_add32(IncrAddOut, signExtend<<2, BrnchAddOut);
	mux BR_Mux(IncrAddOut, BrnchAddOut, BRMuxSelect, BRMuxOut);
	mux JMP_Mux(BRMuxOut, JmpAddr, Jump, JMPMuxOut);
	
	//Main datapath
	control ctrl(ALUOp, RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite);
	regbank registers(RegAdd1, RegAdd2, RegWAdd, RegWData, RegWrite, RegData1, RegData2, clk, rst);
	ALU m_alu(ALUOp, funct, ALU_IN_1, ALU_IN_2, ALUResult, Zero);
		
	always@(posedge clk, posedge rst)
	begin 
		if(rst)
			begin
				PC <= 32'h1000;
			end
		else
			begin
				if(ALUOp == 6'h3f) begin
					$finish;
				end
				PC <= JMPMuxOut;
			end
	end
endmodule