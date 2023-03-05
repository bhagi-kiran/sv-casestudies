class alu_cov;
alu_tx tx;
mailbox #(alu_tx) mon2cov;
 
 covergroup alu_cg;
 alu_a : coverpoint tx.a {bins a [10] = {[0:50]};
                          }
 alu_b : coverpoint tx.b {bins b [] = {[0:$]};
                          }
 alu_sel : coverpoint tx.sel {bins sel[] = {[0:$]};
                              }
 endgroup : alu_cg
 
 function new();
   alu_cg=new();  //
   this.mon2cov = alu_cfg::mon2cov;
 endfunction
 
 task run();
   forever
    begin
      $display ("alu_cov::run");
      mon2cov.get(tx); //this was missed
      alu_cg.sample();
    end
 endtask : run
endclass : alu_cov
  