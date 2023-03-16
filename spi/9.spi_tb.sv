module tb;
    
 spi_if _if();
  
 spi dut(_if.clk,_if.newd,_if.rst,_if.din,_if.sclk,_if.cs,_if.mosi);
 
 initial
  begin
   _if.clk <= 0;
  end
    
 always #10 _if.clk <= ~_if.clk;
  
 environment env;
    
  initial
   spi_cfg::v_if = _if;
    
  initial
   begin
    env = new();
    env.gen.count = 20;
    env.run();
   end
      
endmodule
