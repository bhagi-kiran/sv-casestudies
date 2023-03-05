interface fifo_if(input logic clk,input logic rst);
 logic 	     rd, wr;
 logic [7:0] data_in;
 logic [7:0] data_out;
 logic full, empty;
endinterface
