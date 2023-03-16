class spi_cfg;
  static mailbox #(transaction) gen2drv=new(); 
  static mailbox #(bit [11:0]) drv2scb=new();
 // static mailbox #(bit [11:0]) mbx=new(); 
  static mailbox #(bit [11:0]) mon2scb=new();
  static virtual spi_if v_if; 
endclass
