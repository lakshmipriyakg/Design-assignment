
module bcd(input [3:0]A,[3:0]B,input cin,output [3:0]S,output cout);
wire w1,w2,w3,w4;
wire [3:0]sum1;
wire [3:0]corr;
ripplecarryadder R1(.A(A),.B(B),.C(C),.sum(sum1),.cout(w1));
and(w2,sum1[1],sum1[3]);
and(w3,sum1[2],sum1[3]);
or(w4,w2,w3,w1);
assign corr={1'b0,w4,w4,1'b0};
ripplecarryadder R2(.A(sum1),.B(corr),.C(1'b0),.sum(sum),.cout(cout));

endmodule
