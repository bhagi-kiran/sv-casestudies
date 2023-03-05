typedef class fifo_cfg;
class fifo_gen;
 //to randomize
 fifo_tx tr1;
 mailbox #(fifo_tx) gen2drv;
 int count = 0;
  
 event next;
 event done;
 
 function new();
  tr1 = new();
  this.gen2drv = fifo_cfg::gen2drv;
 endfunction
 
 task run(); 
  for (integer i = 0; i < count; i++) begin
   assert(tr1.randomize()) else $error("randomization failed");
   gen2drv.put(tr1.copy);
   //sending copy of transaction class coz of advantages
   $display("[Packet] %0d out of %0d", i+1, count);
   tr1.display("GEN");
   @(next); //repeats when event next occurs
  end
  -> done; //triggers done when all counts are completed
 endtask : run
 
endclass : fifo_gen
