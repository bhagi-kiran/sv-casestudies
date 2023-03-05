module fifo(clk, rst, rd, wr, data_in, data_out, full, empty);
 input clk, rst; //global signals
 input rd, wr; //ctrl signals
 input [7:0] data_in; //data bus for ip
 output reg [7:0] data_out; //data bus for op
 output full, empty; //output flags
 
 reg [7:0] mem [31:0]; //memory with depth 32
 reg [4:0] rd_ptr;  //to access mem locations
 reg [4:0] wr_ptr;
 
 always @ (posedge clk) begin
  if (rst) begin
   data_out <= 8'b0;
   rd_ptr <= 5'b0;
   wr_ptr <= 5'b0;
   //resetting all memory locations
   for (integer i = 0; i <= 31; i = i + 1) begin
    mem[i] <= 8'b0;
   end
  end
  
  else begin
   if ( (wr==1'b1) && (full == 1'b0) ) begin 
    mem[wr_ptr] <= data_in;
    wr_ptr <= wr_ptr + 1;
   end
   
   if ( (rd==1'b1) && (empty==1'b0)) begin
    data_out <= mem[rd_ptr];
    rd_ptr <= rd_ptr + 1;
   end
  end
 end
 
 assign empty = ( (wr_ptr - rd_ptr) == 0) ? 1'b1 : 1'b0;
 assign full = ( (wr_ptr - rd_ptr) == 31) ? 1'b1 : 1'b0;
 
 
endmodule
