`default_nettype none

module aludec ( input   wire  [5:0] funct,
                input   wire  [1:0] aluop,
                output  reg   [2:0] alucontrol);

  always @(*) begin
    case (aluop)
      2'b00: alucontrol <= 3'b010; // addition
      2'b01: alucontrol <= 3'b110; // subtruction
      default: case(funct) // R form
        6'b100000: alucontrol <= 3'b010; // ADD
        6'b100010: alucontrol <= 3'b110; // SUB
        6'b100100: alucontrol <= 3'b000; // AND
        6'b100101: alucontrol <= 3'b001; // OR
        6'b101010: alucontrol <= 3'b111; // SLT
        default:   alucontrol <= 3'bxxx; // ???
      endcase
    endcase
  end

endmodule