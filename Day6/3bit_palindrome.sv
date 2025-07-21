module three_bit_palindrome(
    input  logic clk,
    input  logic reset,
    input  logic x_i,

    output logic palindrome_o
);

/*  palindrome_o is asserted 1 when x(t-2), x(t-1) and x_i is a palindrome.
    since we only have 3 bits the only possibilities are 000, 111, 101, 010
    we only need to be sampling after we've recieved at least 2 bits so we need a 2 bit counter 
    once this 2-bit counter hits 2'b10 is when we start sampling
*/

    logic [1:0] count_q;
    logic [1:0] count;

    logic [1:0] shift_reg_q;
    logic [1:0] shift_reg;

    always_ff @(posedge clk or posedge reset) begin
        if(reset) begin
            count_q     <= 0;
            shift_reg_q <= 0;            
        end
        else begin
            count_q     <= count;
            shift_reg_q <= shift_reg;
        end
    end

    assign count        = count_q[1] ? count_q : count_q + 1;
    assign shift_reg    = {shift_reg_q[0], x_i};
    assign palindrome_o = (x_i == shift_reg_q[1]) & count_q[1]; 

endmodule