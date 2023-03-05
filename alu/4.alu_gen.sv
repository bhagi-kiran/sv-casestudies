typedef class alu_cfg; //telling to find this class further
class alu_gen;
 alu_tx tx;  //creating handle to generate random numbers
 mailbox #(alu_tx) gen2drv;  //to transmit the gen numbers interclasses, we need ipc
 int count = 0;
  
 event next;
 event done;

    function new();         //constructor overriding
        tx=new();
        this.gen2drv=alu_cfg::gen2drv;  //before going to other block, data passes through config block
    endfunction : new

   task run(); 
        for (integer i = 0; i < count; i++) begin 
         assert(tx.randomize()) else $error("RANDOMIZATION FAILED");
         gen2drv.put(tx); 
         $display("[Packet] %0d out of %0d", i+1, count);
         tx.print("GEN");
         @(next);
        end
        ->done; 
    endtask : run
endclass : alu_gen
