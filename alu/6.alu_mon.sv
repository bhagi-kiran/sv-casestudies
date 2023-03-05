class alu_mon;
 alu_tx tx;
 mailbox #(alu_tx) mon2scb;
 mailbox #(alu_tx) mon2cov;
 virtual alu_if v_if;
 
      function new();  //constructor overriding
        this.mon2scb=alu_cfg::mon2scb;
        this.mon2cov=alu_cfg::mon2cov;
        this.v_if=alu_cfg::v_if;
      endfunction : new
        
        task run();
         tx=new();
        
         forever   //instead of mentioning repeat num (which creates conflict in case of packets 16 and repeat no 20 so)
          begin
           wait (!v_if.rst)
           
           @(posedge v_if.clk)
           tx.a = v_if.a;   //conversion of pin level information to packet level information
           tx.b = v_if.b;
           tx.sel = v_if.sel;
           tx.out=v_if.out;
           tx.print("MON");
           mon2cov.put(tx);
           mon2scb.put(tx);
           
          end
        endtask : run
endclass
