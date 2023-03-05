class alu_drv;
        alu_tx tx;
        mailbox #(alu_tx) gen2drv;
        virtual alu_if v_if; //to make it type compatible
        
        function new();
        this.gen2drv=alu_cfg::gen2drv;
        this.v_if=alu_cfg::v_if;
        endfunction
        
        task run();
         forever begin
          wait(!v_if.rst) //until rst, no transaction takes place
          gen2drv.get(tx);
          tx.print("DRV");
        
          v_if.a <= tx.a;  //conversion of packet level information to pin level information
          v_if.b <= tx.b;
          v_if.sel <= tx.sel;
          @(posedge v_if.clk);
        end
        endtask
endclass
