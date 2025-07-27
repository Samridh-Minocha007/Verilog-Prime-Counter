`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.07.2025 03:20:23
// Design Name: 
// Module Name: prime_counter
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


module prime_counter (
    input        clk,
    input        reset_n,
    input        set_n,
    input        enable,
    input        up_down,
    output reg [6:0] count_out
);

    reg [4:0] prime_index;

    always @(posedge clk or negedge reset_n or negedge set_n) begin
        if (!reset_n) begin
            prime_index <= 5'd0;
        end
        else if (!set_n) begin
            prime_index <= 5'd23;
        end
        else if (enable) begin
            if (up_down) begin
                if (prime_index == 5'd23)
                    prime_index <= 5'd0;
                else
                    prime_index <= prime_index + 1;
            end
            else begin
                if (prime_index == 5'd0)
                    prime_index <= 5'd23;
                else
                    prime_index <= prime_index - 1;
            end
        end
    end

    always @(*) begin
        case (prime_index)
            5'd0:  count_out = 7'd2;
            5'd1:  count_out = 7'd3;
            5'd2:  count_out = 7'd5;
            5'd3:  count_out = 7'd7;
            5'd4:  count_out = 7'd11;
            5'd5:  count_out = 7'd13;
            5'd6:  count_out = 7'd17;
            5'd7:  count_out = 7'd19;
            5'd8:  count_out = 7'd23;
            5'd9:  count_out = 7'd29;
            5'd10: count_out = 7'd31;
            5'd11: count_out = 7'd37;
            5'd12: count_out = 7'd41;
            5'd13: count_out = 7'd43;
            5'd14: count_out = 7'd47;
            5'd15: count_out = 7'd53;
            5'd16: count_out = 7'd59;
            5'd17: count_out = 7'd61;
            5'd18: count_out = 7'd67;
            5'd19: count_out = 7'd71;
            5'd20: count_out = 7'd73;
            5'd21: count_out = 7'd79;
            5'd22: count_out = 7'd83;
            5'd23: count_out = 7'd89;
            default: count_out = 7'd2;
        endcase
    end

endmodule
