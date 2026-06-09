`timescale 1ns / 1ps

module usr_tb;

    reg        clk;
    reg        rst;
    reg        sin;
    reg        load;
    reg  [1:0] mod;
    reg  [3:0] pin;
    wire       sout;
    wire [3:0] pout;

    usr uut (
        .clk  (clk),
        .rst  (rst),
        .sin  (sin),
        .load (load),
        .mod  (mod),
        .pin  (pin),
        .sout (sout),
        .pout (pout)
    );

    initial clk = 0;
    always #5 clk = ~clk;

    task apply_clk;
        input [63:0] cycle_num;
        begin
            @(posedge clk); #1;
            $display("Cycle %0d | mod=%b load=%b sin=%b pin=%b | sout=%b pout=%b",
                      cycle_num, mod, load, sin, pin, sout, pout);
        end
    endtask

    integer i;

    initial begin
        rst = 1; sin = 0; load = 0; mod = 2'b00; pin = 4'b0000;
        @(posedge clk); #1;
        rst = 0;

        $display("\n--- TEST 1: SISO (mod=00) ---");
        mod  = 2'b00;
        load = 0;
        sin = 1; apply_clk(1);
        sin = 0; apply_clk(2);
        sin = 1; apply_clk(3);
        sin = 1; apply_clk(4);
        sin = 0;
        apply_clk(5);
        apply_clk(6);
        apply_clk(7);
        apply_clk(8);

        $display("\n--- TEST 2: SIPO (mod=01) ---");
        rst = 1; @(posedge clk); #1; rst = 0;
        mod  = 2'b01;
        load = 0;
        sin = 1; apply_clk(1);
        sin = 0; apply_clk(2);
        sin = 1; apply_clk(3);
        sin = 0; apply_clk(4);

        $display("\n--- TEST 3: PISO (mod=10) ---");
        rst = 1; @(posedge clk); #1; rst = 0;
        mod  = 2'b10;
        pin  = 4'b1101;
        load = 1; apply_clk(1);
        load = 0;
        sin  = 0;
        for (i = 2; i <= 5; i = i + 1)
            apply_clk(i);

        $display("\n--- TEST 4: PIPO (mod=11) ---");
        rst = 1; @(posedge clk); #1; rst = 0;
        mod  = 2'b11;
        pin  = 4'b1010;
        load = 1; apply_clk(1);
        pin  = 4'b0101;
        apply_clk(2);
        load = 0;
        apply_clk(3);

        $display("\n--- TEST 5: Synchronous Reset ---");
        mod  = 2'b01;
        sin  = 1;
        apply_clk(1);
        apply_clk(2);
        rst = 1; apply_clk(3);
        rst = 0;

        $display("\n--- Simulation complete ---");
    
    end

    initial begin
        $dumpfile("usr_tb.vcd");
        $dumpvars(0, usr_tb);
    end

endmodule
