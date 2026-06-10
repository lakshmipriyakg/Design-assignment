`timescale 1ns / 1ps
module mach_out (
    input wire clk,
    input wire rst,
    input wire [7:0] d_in,
    input wire fifo_empty,
    output reg read_enb,
    output reg [7:0] d_out
);

    // State definitions
    localparam STATE_0 = 2'b00,
               STATE_1 = 2'b01,
               STATE_2 = 2'b10,
               READ_ST = 2'b11;

    reg [1:0] current_state, next_state;

    // State transitions
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            current_state <= STATE_0;
        end else begin
            current_state <= next_state;
        end
    end

    // FSM Next State logic
    always @(*) begin
        case (current_state)
            STATE_0:  next_state = STATE_1;
            STATE_1:  next_state = STATE_2;
            STATE_2:  next_state = (!fifo_empty) ? READ_ST : STATE_0; 
            READ_ST:  next_state = STATE_0; // Return to cycle count after reading
            default:  next_state = STATE_0;
        endcase
    end

    // FSM Output Logic
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            read_enb <= 1'b0;
            d_out    <= 8'h00;
        end else begin
            if (next_state == READ_ST) begin
                read_enb <= 1'b1;  // Request data from FIFO
                d_out    <= d_in;  // Latch data to final slow output
            end else begin
                read_enb <= 1'b0;
            end
        end
    end

endmodule


