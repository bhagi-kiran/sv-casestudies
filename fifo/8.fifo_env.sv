class fifo_env;
 fifo_gen gen;
 fifo_drv drv;
 fifo_mon mon;
 fifo_scb scb;
 
 event next_gen_sco;
 
 function new();
  gen = new();
  drv = new();
  mon = new();
  scb = new();
  
  gen.next = next_gen_sco;
  scb.next = next_gen_sco;
 endfunction
 
 task pre_test();
  drv.reset();
 endtask
 
 task test();
  fork
   gen.run();
   drv.run();
   mon.run();
   scb.run();
  join_any
 endtask
 
 task post_test();
  wait(gen.done.triggered);
  $stop();
 endtask
 
 task run();
  pre_test();
  test();
  post_test();
 endtask
 
endclass
