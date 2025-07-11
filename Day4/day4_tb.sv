// Testbench for rise and fall edge detection
module edge_tb();
  logic clk, reset, a_i, rise_edge_o, fall_edge_o;
  
  edgedut DUT(.clk(clk), .reset(reset), .a_i(a_i), .rise_edge_o(rise_edge_o), .fall_edge_o(fall_edge_o));
  
  always #2.5 clk = ~clk;
  
  initial begin
    clk = 0; reset = 1; #8;
    reset = 0; @(posedge clk);
    
    for (int i = 0; i < 20; i++) begin
      a_i = $random % 2; @(posedge clk);
    end
    
    $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule