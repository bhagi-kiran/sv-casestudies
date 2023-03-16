class scoreboard;
 mailbox #(bit [11:0]) drv2scb, mon2scb;
 bit [11:0] ds;
 bit [11:0] ms;
 event sconext;
  
 function new();
  this.drv2scb = spi_cfg::drv2scb;
  this.mon2scb = spi_cfg::mon2scb;
 endfunction
  
 task run();
  forever
   begin    
    drv2scb.get(ds);
    mon2scb.get(ms);
    $display("[SCO] : DRV : %0d MON : %0d", ds, ms);
    if(ds == ms)
     $display("[SCO] : DATA MATCHED");
    else
     $display("[SCO] : DATA MISMATCHED");
    ->sconext;     
   end
 endtask
   
endclass
