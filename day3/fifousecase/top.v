`timescale 1ns / 1ps
module top_system (
    input wire clk,
    input wire rst,
    input wire [7:0] s_in,
    output wire [7:0] d_out,
    output wire full,
    output wire empty
);

    // Internal wires connecting the subsystems
    wire [7:0] s_out_wire;
    wire write_enb_wire;
    wire read_enb_wire;
    wire [7:0] fifo_to_mach_data;

    // 1. Instantiate Face (Fast) Module
    facemodule fast_inst (
        .clk(clk),
        .rst(rst),
        .s_in(s_in),
        .s_out(s_out_wire),
        .write_enb(write_enb_wire)
    );

    // 2. Instantiate intermediate FIFO Architecture
    fifomodule fifomodule_inst (
        .clk(clk),
        .rst(rst),
        .write_enb(write_enb_wire),
        .read_enb(read_enb_wire),
        .data_in(s_out_wire),
        .data_out(fifo_to_mach_data),
        .full(full),
        .empty(empty)
    );

    // 3. Instantiate Machine (Slow) Module with FSM
    mach_out slow_inst (
        .clk(clk),
        .rst(rst),
        .d_in(fifo_to_mach_data),
        .fifo_empty(empty),
        .read_enb(read_enb_wire),
        .d_out(d_out)
    );

endmodule
