class fifo_mon;
 fifo_tx tx;
 mailbox #(fifo_tx) mon2scb;
 virtual fifo_if f_if;
 
 function new();
  this.mon2scb = fifo_cfg::mon2scb;
  this.f_if = fifo_cfg::f_if;
 endfunction
 
 task run();
  tx = new();
  
   forever begin
   repeat(2) @(posedge f_if.clk);
   //after 2 clk cyc
   tx.rd = f_if.rd; //blocking for updation
   tx.wr = f_if.wr;
   tx.data_in = f_if.data_in;
   tx.data_out = f_if.data_out;
   tx.full = f_if.full;
   tx.empty = f_if.empty;
   tx.display("MON");
   mon2scb.put(tx); //sending to scoreboard
   end
   
 endtask
endclass
