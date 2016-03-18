`default_nettype none

module top  ( input   wire          clk, reset,
              output  wire  [31:0]  writedata, dataadr,
              output  wire          memwrite);

  wire  [31:0]  pc, instr, readdata;

  // processorとmemoriesの実体化
  mips mips ( clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);

  imem imem ( pc[7:2], instr);
  dmem dmem ( clk, memwrite, dataadr, writedata, readdata);

endmodule