`timescale 1ns / 1ps

module comparator_tb;

    reg clk;
    reg rst_n;
    reg vin_p;
    reg vin_n;
    wire decision;

    comparator uut (
        .clk(clk),
        .rst_n(rst_n),
        .vin_p(vin_p),
        .vin_n(vin_n),
        .decision(decision)
    );

    initial begin
        clk = 0;
        rst_n = 0;
        vin_p = 0;
        vin_n = 0;
        #20 rst_n = 1;

        #10 vin_p = 1; vin_n = 0;
        #20 vin_p = 0; vin_n = 1;
        #20 vin_p = 1; vin_n = 1;
        #20 vin_p = 0; vin_n = 0;
        #20 $finish;
    end

    always #5 clk = ~clk;

endmodule
