`timescale 1ns/1ps
`include "3bit_palindrome.sv"

module three_bit_palindrome_tb();
    logic clk, reset, x_i, palindrome_o;

    three_bit_palindrome DUT(.clk(clk), .reset(reset), .x_i(x_i), .palindrome_o(palindrome_o));

    always #5 clk = ~clk;

    initial begin
        clk = 1'b0;
        x_i = 1'b0;
        reset = 1'b1; #20;

        @(posedge clk);
        reset = 1'b0;

        for (int i = 0; i < 20 ; i++) begin
            @(posedge clk);
            x_i = $random % 2;            
        end

        #50;
        $finish;
    end

    initial begin
        $dumpfile("3bit_palindrome.vcd");
        $dumpvars(0, three_bit_palindrome_tb);
        $dumpvars(0, three_bit_palindrome_tb.DUT);
    end

    always @(posedge clk) begin
        $display("At time %0t ns, reset = %0b, x_i = %0b, palindrome_o = %0b", $time, reset, x_i, palindrome_o);
    end
endmodule