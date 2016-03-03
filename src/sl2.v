module sl2  (input  [31:0]  a,
             output [31:0]  y);
  // 左へ2ビットシフト
  assign y = {a[29:0], 2'b00};
endmodule