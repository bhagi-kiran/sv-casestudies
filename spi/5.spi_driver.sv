class driver;
  
 virtual spi_if v_if;
 transaction tr;
 mailbox #(transaction) gen2drv;
 mailbox #(bit [11:0]) drv2scb;
 event drvnext;
  
 bit [11:0] din;
 
  
  
 
  
 function new();
  this.gen2drv=spi_cfg::gen2drv;
  this.drv2scb=spi_cfg::drv2scb;
  this.v_if=spi_cfg::v_if;
 endfunction
  
 task reset();
  v_if.rst <= 1'b1;
  v_if.cs <= 1'b1;
  v_if.newd <= 1'b0;
  v_if.din <= 1'b0;
  v_if.mosi <= 1'b0;
  repeat(10) @(posedge v_if.clk);
   v_if.rst <= 1'b0;
   repeat(5) @(posedge v_if.clk);
    $display("[DRV] : RESET DONE");
 endtask
  
 task run();
  forever begin
   gen2drv.get(tr);
   @(posedge v_if.sclk);
   v_if.newd <= 1'b1;
   v_if.din <= tr.din;
   drv2scb.put(tr.din);
   @(posedge v_if.sclk);
   v_if.newd <= 1'b0;
   wait(v_if.cs == 1'b1);
   $display("[DRV] : DATA SENT TO DAC : %0d",tr.din);
   ->drvnext;
  end   
 endtask

endclass
