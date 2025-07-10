// Detecting a big sequence - 1110_1101_1011

module sequence_det (
    input wire  clk,
    input wire  reset,
    input wire  x_i,
    output wire det_o);
 
    // We need a 12-bit FF to shift the bits as they arrive on every clock edge
    logic [11:0] shift_ff;
    logic [11:0] next_shift;
 
    always@(posedge clk or posedge reset) begin
        if (reset)
            shift_ff <= 12'h0;
        else
            shift_ff <= next_shift;
    end
 
    assign next_shift = {shift_ff[10:0], x_i};
    assign det_o      = (shift_ff == 12'b111011011011) ? 1 : 0;
endmodule