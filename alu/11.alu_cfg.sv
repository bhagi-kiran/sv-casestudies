class alu_cfg;
  static mailbox #(alu_tx) gen2drv=new(); //to retain the data(coz if driver doesnt exist dynamic var is destroyed)
  static mailbox #(alu_tx) mon2scb=new();
  static mailbox #(alu_tx) mon2cov=new();
  static virtual alu_if v_if; //static in nature so no constructor is needed, instantiations are done 
endclass
