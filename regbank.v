module regbank (r0Addr, r1Addr, wAddr, wData, wEn, r0Out, r1Out, CLK, reset);
	input [4:0] r0Addr, r1Addr, wAddr;
	input wEn, CLK, reset;
	input [31:0] wData;
	output [31:0] r0Out, r1Out;
	integer i;
	
	reg [31:0] regbank [31:0];
	
	assign r0Out = regbank[r0Addr];
	assign r1Out = regbank[r1Addr];
	
	always @(posedge CLK, posedge reset) begin
		if(reset) begin
			for(i = 0; i < 32; i = i+1) begin
				regbank[i] <= 0;
			end
		
		end
     	
        if (wEn & ~reset) begin
			regbank[wAddr] = wData;
		end

	end
endmodule
	
