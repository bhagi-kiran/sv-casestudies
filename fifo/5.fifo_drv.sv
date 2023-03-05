class fifo_drv;
 fifo_tx tx; //no need to call new for this
 mailbox #(fifo_tx) gen2drv;
 virtual fifo_if f_if;
 
 function new(); //edited
  this.gen2drv = fifo_cfg::gen2drv;
  this.f_if=fifo_cfg::f_if;
 endfunction
 
 //reset dut
 task reset();
 // f_if.rst <= 1'b1;
  f_if.rd  <= 1'b0;
  f_if.wr  <= 1'b0;
  f_if.data_in <= 8'd0;
  repeat(5) @(posedge f_if.clk);
  //f_if.rst <= 1'b0;
  $display("[DRV] : DUT RESET DONE ");
 endtask
 
 task run();
  forever begin
   gen2drv.get(tx);
   //take data
   tx.display("DRV");
   //driving DUT
   
   f_if.rd <= tx.rd;
   f_if.wr <= tx.wr;
   f_if.data_in <= tx.data_in;
   repeat(2) @(posedge f_if.clk);  
    //since we are in loop, event or dly should be must
  end
 endtask
endclass
