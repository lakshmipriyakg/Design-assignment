module fifo(
    input clk, rst, wr_en, rd_en,
    input [7:0] data_in,
    output reg [7:0] data_out,
    output full, empty
);

    reg [7:0] mem [7:0];
    
    reg [2:0] wr_ptr;
    reg [2:0] rd_ptr;
     
    reg [3:0] count; 

   
    assign empty = (count == 4'd0);
    assign full  = (count == 4'd8);

    always @(posedge clk) begin
        if (rst) begin
            wr_ptr   <= 3'b000;
            rd_ptr   <= 3'b000;
            data_out <= 8'h00;
            count    <= 4'd0;
        end else begin
            
            
            if (wr_en && !full) begin
                mem[wr_ptr] <= data_in;
                wr_ptr      <= wr_ptr + 1'b1;
            end
            
            
            if (rd_en && !empty) begin
                data_out <= mem[rd_ptr];
                rd_ptr   <= rd_ptr + 1'b1;
            end

           
            if ((wr_en && !full) && !(rd_en && !empty)) begin
                count <= count + 1'b1; 
            end 
            else if ((rd_en && !empty) && !(wr_en && !full)) begin
                count <= count - 1'b1; 
            end 
        end
    end
endmodule
