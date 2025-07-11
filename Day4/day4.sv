// Designing a rise and fall edge detector
module edgedut(
	input logic clk,
	input logic reset,
	input logic a_i,
	
	output logic rise_edge_o,
	output logic fall_edge_o);
  
  logic a_ff;
  
  always@(posedge clk) begin
    if(reset)
      a_ff <= 0;
    else
      a_ff <= a_i;
  end
  
  /* Rising edge will be detected when the past signal is 0 (i.e. the output of the FF) and the incoming input signal is 1 */
  assign rise_edge_o = ~a_ff && a_i;
  
  /* Falling edge will be detected when the past signal is 1 (i.e. the output of the FF) and the incoming input signal is 0 */
  assign fall_edge_o = a_ff && ~a_i;
endmodule