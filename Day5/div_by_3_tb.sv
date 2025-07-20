`timescale 1ns/1ps
//`include "div_by_3.sv"

module div_by_3_tb();
    logic clk, reset, x_i, div_o;

    div_by_3 DUT(.clk(clk), .reset(reset), .x_i(x_i), .div_o(div_o));

    always #5 clk = ~clk;

    initial begin
        clk     = 1'b0;
        x_i     = 1'b0;
        reset   = 1'b1; #8;

        @(posedge clk);
        reset   = 1'b0;

        for (int i = 0; i < 20; i++) begin
            @(posedge clk);            
            x_i = $random % 2;
        end

    #20;
    $finish;
    end

    initial begin
        $dumpfile("div_by_3.vcd");
        $dumpvars(0, div_by_3_tb);
    end

endmodule