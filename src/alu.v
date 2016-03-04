module alu( input   [31:0]      srca, srcb,
            input   [2:0]       alucontrol,
            output  reg [31:0]  aluout,
            output              zero);

  assign zero = (aluout == 32'b0) ? 1'b1 : 1'b0;

  always @(*) begin
    case(alucontrol)
      3'b000: aluout <= srca & srcb;            // A AND B
      3'b001: aluout <= srca | srcb;            // A OR B
      3'b010: aluout <= srca + srcb;            // A + B
      3'b011: aluout <= 32'b0;                  // not used
      3'b100: aluout <= srca & ~srcb;           // A AND ~B
      3'b101: aluout <= srca | ~srcb;           // A OR ~B
      3'b110: aluout <= srca - srcb;            // A - B
      3'b111: aluout <= {31'b0,(srca < srcb)};  // SLT
    endcase
  end
endmodule