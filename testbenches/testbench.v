module testbench();

  reg clk;
  reg reset;

  wire [31:0] writedata, dataadr;
  wire        memwrite;

  // instantiate device to be tested
  top dut (clk, reset, writedata, dataadr, memwrite);

  // initialize test
  initial
  begin
    reset <= 1; # 22; reset <= 0;
  end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5;
    end

  // check results
  always @(negedge clk) begin
    if (memwrite) begin
      if (dataadr === 84 & writedata === 7) begin
        $messagelog("%:S Simulation succeeded", "Note");
        $stop;
      end else if(dataadr !== 80) begin
        $messagelog ("%:S Simulation failed", "Note");
        $stop;
      end
    end
  end

endmodule

