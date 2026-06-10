`timescale 1ns / 1ps
module fifomodule (
    input wire clk,
    input wire rst,
    input wire write_enb,
    input wire read_enb,
    input wire [7:0] data_in,
    output reg [7:0] data_out,
    output wire full,
    output wire empty
);

    reg [7:0] memory [0:7]; // 8x8 memory array
    reg [2:0] wr_ptr;       // Write pointer
    reg [2:0] rd_ptr;       // Read pointer
    reg [3:0] count;        // Tracks number of elements in FIFO

    // Status flags
    assign empty = (count == 0);
    assign full  = (count == 8);

    // Write operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            wr_ptr <= 3'b000;
        end else if (write_enb && !full) begin
            memory[wr_ptr] <= data_in;
            wr_ptr <= wr_ptr + 1;
        end
    end

    // Read operation
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            rd_ptr   <= 3'b000;
            data_out <= 8'b0;
        end else if (read_enb && !empty) begin
            data_out <= memory[rd_ptr];
            rd_ptr   <= rd_ptr + 1;
        end
    end

    // Counter management
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            count <= 4'b0000;
        end else begin
            case ({write_enb && !full, read_enb && !empty})
                2'b10: count <= count + 1;
                2'b01: count <= count - 1;
                default: count <= count; // 2'b11 or 2'b00 does not change count
            endcase
        end
    end

endmodule
