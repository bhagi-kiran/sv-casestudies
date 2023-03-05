module fifo_top();
 logic clk, rst;
 fifo_if ftop_if(clk, rst);
 fifo_tb tb();
 //in plc of fifo_tb was alu_tb so it showed two top modules fifo_tb and fifo_top
 fifo inst1(clk, rst, ftop_if.rd, ftop_if.wr, ftop_if.data_in, ftop_if.data_out, ftop_if.full, ftop_if.empty);
 
 initial begin  //if any error watch this space
  clk = 1'b0; rst = 1'b1;
  #5
  rst = 1'b0;
 end
  
 always #5 clk = ~clk;
 
 initial begin
  fifo_cfg::f_if = ftop_if;
 end
 
endmodule
