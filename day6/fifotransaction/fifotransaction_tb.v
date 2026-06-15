class fifo_transaction;
  rand bit [7:0] data_in;
  rand bit       wr_en;
  rand bit       rd_en;
  rand bit       rst;
       bit [7:0] data_out;
       bit       full;
       bit       empty;

 
  constraint valid_cl {!(wr_en && rd_en);}
  constraint valid_rst { 
    if (rst) { wr_en == 0; 
      rd_en == 0; 
    } 
  }

  function void display();
    $display("din:%h wr:%b rd:%b rst:%b dout:%h f:%b e:%b", 
             data_in, wr_en, rd_en, rst, data_out, full, empty);
  endfunction
endclass


module tb_transaction;
  fifo_transaction t;

  initial begin
    t = new(); 
    t.wr_en = 1; t.rd_en = 0; t.rst = 0; t.data_in = 8'hAA; 
    t.display();

    t = new(); 
    t.wr_en = 0; t.rd_en = 1; t.rst = 0; t.data_out = 8'hBB; 
    t.display();

    t = new(); 
    t.rst = 1; t.wr_en = 0; t.rd_en = 0; 
    t.display();

    t = new(); 
    void'(t.randomize()); 
    t.display();

    $finish();
  end
endmodule
