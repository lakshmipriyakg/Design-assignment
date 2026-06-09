`timescale 1ns / 1ps
module bcd_tb();
reg [3:0]A,B;
reg cin;
wire [3:0]sum;
wire cout;
bcd dut(A,B,cin,sum,cout);
initial
begin
$monitor("value of A is %b  value of B is %b  value of cin is %b  value of sum is %b  value of cout is %b",A,B,C,sum,cout);
A=3; B=6; cin=1;#10;
A=6; B=8; cin=0;#10;
A=9; B=4; cin=0;#10;
A=1; B=2; cin=1;#10;
end
endmodule
