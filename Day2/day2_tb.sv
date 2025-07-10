`timescale 1ns/1ps
`include "day2.sv"

module sequence_det_tb();
  logic clk;
  logic reset;
  logic x_i;
  logic det_o;
 
  logic [11:0] seq = 12'b1110_1101_1011;
 
  sequence_det DUT(.clk(clk), .reset(reset), .x_i(x_i), .det_o(det_o));
 
  always #5 clk = ~clk;
 
  initial begin
    clk   = 1'b0;
    reset = 1'b1;
    x_i   = 1'b1; @(posedge clk);
   
    reset = 1'b0; @(posedge clk);
   
    for (int i = 0; i < 12; i++) begin
      x_i = seq[i]; @(posedge clk);
    end
   
    for (int i = 0; i < 12; i++) begin
      x_i = $random % 2; @(posedge clk);
    end
   
    $finish;
  end
 
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule