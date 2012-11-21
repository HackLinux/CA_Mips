module control(opCode, RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, ALUsrc, RegWrite);
  input [5:0] opCode;
  output RegDst, Jump, Branch, MemRead, MemtoReg, MemWrite, RegWrite, ALUsrc;
  
  assign RegDst = (opCode == 6'h0);
  assign Jump = (opCode == 6'h2);
  assign Branch = (opCode == 6'h4);
  assign MemRead = (opCode == 6'h23);
  assign MemtoReg = (opCode == 6'h23);
  assign ALUsrc = (opCode == 6'h8 || opCode == 6'h23 || opCode == 6'h2b);
  assign RegWrite = (opCode == 6'h0 || opCode == 6'h8 || opCode == 6'h23);
  assign MemWrite = (opCode == 6'h2b);
endmodule