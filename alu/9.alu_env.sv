//environment 
class alu_env;
  
//transaction handle not created coz (needed only when we need to modify values)
alu_gen gen;
alu_drv drv;
alu_mon mon;
alu_scb scb;
alu_cov cov;

event next_gen_sco;

function new();
  gen=new();
  drv=new();
  mon=new();
  scb=new();
  cov=new();
  gen.next = next_gen_sco;
  scb.next = next_gen_sco;
endfunction

task test();
 fork
    gen.run();
    drv.run();
    mon.run();
    scb.run();
    cov.run();
 join_any
endtask

task post_test();
 wait(gen.done.triggered);
 $stop();
endtask

task run();
  test();
  post_test();
endtask
endclass
