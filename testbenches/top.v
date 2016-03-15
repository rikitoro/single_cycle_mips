module top  ( input           clk, reset,
              output  [31:0]  writedata, dataadr,
              output          memwrite);

  wire  [31:0]  pc, instr, readdata;

  // processorとmemoriesの実体化
  mips mips ( clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);

  imem imem ( pc[7:2], instr);
  dmem dmem ( clk, memwrite, dataadr, writedata, readdata);

endmodule