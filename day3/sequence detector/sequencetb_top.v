`timescale 1ns / 1ps
module sequence_detector_tb();
reg clk_tb,rst_tb,din_tb;
wire det_tb;
sequence_detector dut(clk_tb,rst_tb,din_tb,det_tb);
initial
begin
{clk_tb,rst_tb,din_tb}=0;
end
always #5 clk_tb=~clk_tb;
initial
begin
rst_tb=1;
#10;
rst_tb=0;
#10;
din_tb=1;
#10;
din_tb=1;
#10;
din_tb=1;
#10;
din_tb=0;
#10;
din_tb=1;
#10;
din_tb=1;
#10;
din_tb=1;
#10;
din_tb=0;
end

endmodule
