module flopr  # (parameter  WIDTH = 8)
                ( input                   clk, reset,
                  input       [WIDTH-1:0] d,
                  output reg  [WIDTH-1:0] q);

  always @(posedge clk, posedge reset) begin
    if (reset) begin
      q <= 0;
    end
    else
      q <= d;
    end
  end
endmodule