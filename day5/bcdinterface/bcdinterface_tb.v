
interface bcd_if;
  logic [3:0] A;
  logic [3:0] B;
  logic cin;
  logic [3:0] Sum;
  logic cout;
endinterface

module tb;
  
  bcd_if bif();
  
  bcd_adder dut (
    .A(bif.A),
    .B(bif.B),
    .cin(bif.cin),
    .Sum(bif.Sum),
    .cout(bif.cout)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
  end

  initial begin
  
    bif.A = 4'd0; bif.B = 4'd0; bif.cin = 1'b0;
    #10;
    
    bif.A = 4'd04; bif.B = 4'd04; bif.cin = 1'b0;
    #10;

    bif.A = 4'd07; bif.B = 4'd06; bif.cin = 1'b0;
    #10;
   
    bif.A = 4'd09; bif.B = 4'd09; bif.cin = 1'b1;
    #10;
    
    $finish;
  end

endmodule
