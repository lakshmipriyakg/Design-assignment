

module tb_top_system;

    // Testbench inputs
    reg clk;
    reg rst;
    reg [7:0] s_in;

    // Testbench outputs
    wire [7:0] d_out;
    wire full;
    wire empty;

    // Instantiate Top Level Module
    top_system uut (
        .clk(clk),
        .rst(rst),
        .s_in(s_in),
        .d_out(d_out),
        .full(full),
        .empty(empty)
    );

    // Generate 100MHz clock signal (10ns period)
    always #5 clk = ~clk;
`timescale 1ns / 1ps
    initial begin
        // Initialize Signals
        clk = 0;
        rst = 1;
        s_in = 8'h00;

        // Apply global Reset for 20ns
        #20;
        rst = 0;

        // Apply consecutive fast incoming byte data streams 
        #10; s_in = 8'hA1; // Clock 1
        #10; s_in = 8'hB2; // Clock 2
        #10; s_in = 8'hC3; // Clock 3 -> Mach out should pick up data around here
        #10; s_in = 8'hD4; // Clock 4
        #10; s_in = 8'hE5; // Clock 5
        #10; s_in = 8'hF6; // Clock 6 -> Next Mach out cycle
        #10; s_in = 8'h11;
        #10; s_in = 8'h22;
        #10; s_in = 8'h33;
        
        // Let it run to witness FSM processing intermediate delayed data lines
        #100;
        
   
    end
      
endmodule
