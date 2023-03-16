class monitor;
 transaction tr;
 mailbox #(bit [11:0]) mon2scb;
 bit [11:0] srx; //////send
  
 
  
 virtual spi_if v_if;
  
  
 function new();
  this.mon2scb = spi_cfg::mon2scb;
  this.v_if = spi_cfg::v_if;
 endfunction
  
 task run();    
  forever 
   begin
    @(posedge v_if.sclk);
    wait(v_if.cs == 1'b0); ///start of transaction
    @(posedge v_if.sclk);
      
    for(int i= 0; i<= 11; i++) 
     begin 
      @(posedge v_if.sclk);
      srx[i] = v_if.mosi;         
     end
      
    wait(v_if.cs == 1'b1);  ///end of transaction
      
    $display("[MON] : DATA SENT : %0d", srx);
    mon2scb.put(srx);
   end    
 endtask

endclass
