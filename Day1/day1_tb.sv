// A simple TB for 2:1 MUX
`timescale  1ns/1ps
`include "day1.sv"

module day1_tb ();
    logic [7:0] a_i;
    logic [7:0] b_i;
    logic       sel_i;
    logic [7:0] y_o;

    day1 DAY1(.*);

    initial begin
        for (int i = 0; i < 10; i++) begin
            a_i   = $urandom_range (0, 8'hFF);
            b_i   = $urandom_range (0, 8'hFF);
            sel_i =  $random % 2;
            #5;
        end
    end

    initial begin
        $dumpfile("day1.vcd");
        $dumpvars(0, day1_tb);
    end

endmodule