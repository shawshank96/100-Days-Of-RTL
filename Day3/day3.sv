// Different kinds of D-flip flops based on their reset capabilities
module dff (
	input logic  clk,
	input logic  reset,
	input logic  d_i,
	
	output logic q_norst_o,
	output logic q_syncrst_o,
	output logic q_asyncrst_o);
  
    always@(posedge clk) begin
    
        // no reset D flip flop
        q_norst_o <= d_i;
    
        // Synchronous reset flip flop
        if(reset)
            q_syncrst_o <= 0;
        else
            q_syncrst_o <= d_i;
    end
  
    // Asynchronous reset flip flop
    always@(posedge clk or posedge reset) begin
        if(reset)
            q_asyncrst_o <= 0;
        else
            q_asyncrst_o <= d_i;
    end
endmodule