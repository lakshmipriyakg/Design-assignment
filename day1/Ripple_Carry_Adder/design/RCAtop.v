`timescale 1ns / 1ps
module ripplecarryadder(input [3:0]A,[3:0]B,cin,output [3:0]S,cout);
wire w1,w2,w3;
Fulladd f1(A[0],B[0],cin,S[0],w1);
Fulladd f2(A[1],B[1],w1,S[1],w2);
Fulladd f3(A[2],B[2],w2,S[2],w3);
Fulladd f4(A[3],B[3],w3,S[3],cout);
endmodule
