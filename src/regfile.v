module regfile (input           clk,
                input           we3,
                input   [4:0]   ra1, ra2, wa3,
                input   [31:0]  wd3,
                output  [31:0]  rd1, rd2);

  reg [31:0]  rf[31:0];

  // 2ポートレジスタファイル
  // 2つのポートから読み
  // 3番目のポートにはclockの立上りエッジで書き込む
  // レジスタ0は0に固定されている

  assign rd1 = (ra1 != 0) ? rf[ra1] : 0;
  assign rd2 = (ra2 != 0) ? rf[ra2] : 0;

  always @(posedge clk) begin
    if (we3) begin
      rf[wa3] <= wd3;
    end
  end
endmodule