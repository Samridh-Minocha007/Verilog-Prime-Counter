`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 03:20:39
// Design Name: 
// Module Name: testbench
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



`timescale 1ns/1ps

module testbench;

    reg clk;
    reg reset_n;
    reg set_n;
    reg enable;
    reg up_down;

    wire [6:0] count_out;

    prime_counter dut (
        .clk(clk),
        .reset_n(reset_n),
        .set_n(set_n),
        .enable(enable),
        .up_down(up_down),
        .count_out(count_out)
    );

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        reset_n = 1'b1;
        set_n   = 1'b1;
        enable  = 1'b0;
        up_down = 1'b1;
        #10;
        reset_n = 1'b0;
        #10;
        reset_n = 1'b1;
        #10;

        enable = 1'b1;
        up_down = 1'b1;
        repeat (4) @(posedge clk);
        #10;

        up_down = 1'b0;
        repeat (4) @(posedge clk);
        #10;

        set_n = 1'b0;
        #15;
        set_n = 1'b1;
        #10;

        $finish;
    end
    
endmodule