`timescale 1ns / 1ps
module block_memory_generator(
    input wire clk,
    input wire arstn,          
    input wire wrenb,          
    input wire [2:0] wraddress,
    input wire [2:0] rdaddress,
    input wire [7:0] data_in,  
    output reg [7:0] data_out  
);
    reg [7:0] memory[0:7];
    integer i;

   
    always @(posedge clk or negedge arstn) begin
        if (!arstn) begin
         for (i = 0; i < 8; i = i + 1) begin
           memory[i] <= 8'b0;
           
             data_out <= 8'b0;
            end
            end
        else
        begin
            if (wrenb)
                memory[wraddress] <= data_in;
                else
         data_out <= memory[rdaddress];
        end
    end

endmodule


