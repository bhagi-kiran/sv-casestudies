program fifo_tb();
    
 fifo_env env;
    
 initial begin
  env = new();
  env.gen.count = 20;
  env.run();
 end
 
endprogram
