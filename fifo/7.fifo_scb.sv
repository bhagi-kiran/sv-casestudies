class fifo_scb;
 fifo_tx tx;
 mailbox #(fifo_tx) mon2scb;
 
 event next;
 //to synchronize signals
 
 bit [7:0] que [$];
 //to compare with the design 
 bit [7:0] temp;
 
 function new();
  this.mon2scb = fifo_cfg::mon2scb;
 endfunction
 
 task run();
  forever begin
   mon2scb.get(tx);
   tx.display("SCO");
   //algo to compare
   if (tx.wr == 1'b1) begin
    que.push_front(tx.data_in);
    $display("[SCO] : Data Stored in Queue = %0d",tx.data_in);
   end
   
   if (tx.rd == 1'b1) begin
    if (tx.empty == 1'b0) begin
     temp = que.pop_back();
     
     if (tx.data_out == temp)
     	$display("DATA MATCH");
     else
     	$error("DATA MIS-MATCH");
    end
    else
     $display("FIFO IS EMPTY");
   end
   ->next;
  end
 endtask
endclass
