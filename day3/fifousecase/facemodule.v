`timescale 1ns / 1ps
module facemodule (
    input wire clk,
    input wire rst,
    input wire [7:0] s_in,
    output reg [7:0] s_out,
    output reg write_enb
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            s_out     <= 8'h00;
            write_enb <= 1'b0;
        end else begin
            s_out     <= s_in;
            write_enb <= 1'b1; // Continuous high pulse stream
        end
    end

endmodule
