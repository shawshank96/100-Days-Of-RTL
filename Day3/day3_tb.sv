// Code your testbench here
// or browse Examples
`timescale 1ns/1ps

module dff_tb();
  logic clk, reset, d_i, q_norst_o, q_syncrst_o, q_asyncrst_o;
  
  dff DUT(.clk(clk), .reset(reset), .d_i(d_i), .q_norst_o(q_norst_o), .q_syncrst_o(q_syncrst_o), .q_asyncrst_o(q_asyncrst_o));
  
  always #5 clk = ~clk;
  
  initial begin
    clk   = 1'b0;
    reset = 1'b1; #8;
    
    reset = 1'b0; @(posedge clk);
    
    for (int i = 0; i < 20; i++) begin
      d_i   = $random % 2; @(posedge clk);
      reset = $random % 2; @(posedge clk);
    end
    
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule