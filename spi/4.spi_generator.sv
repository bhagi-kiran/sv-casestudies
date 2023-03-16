typedef class spi_cfg;
class generator;
  
 transaction tr;
 mailbox #(transaction) gen2drv;
 event done;
 int count = 0;
 event drvnext;
 event sconext;
  
 function new();
  this.gen2drv = spi_cfg::gen2drv; 
 endfunction
  
 task run();
  tr = new();
  repeat(count) begin
   assert(tr.randomize) else $error("[GEN] :Randomization Failed");
   gen2drv.put(tr.copy);
   tr.display("GEN");
   @(drvnext);
   @(sconext);
  end
   -> done;
 endtask
 
endclass
