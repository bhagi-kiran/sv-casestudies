program alu_test(); //test :init was tb now replaced
 
 alu_env env;

 initial begin
  env = new();
  env.gen.count = 25;
  env.run();
 end
endprogram
