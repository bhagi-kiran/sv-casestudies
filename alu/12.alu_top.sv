module alu_top();
logic clk,rst;
alu_if a_if(clk,rst);
alu_test tb();
alu a1 (a_if.a,a_if.b,a_if.sel,clk,rst,a_if.out);

initial 
 begin
 clk=0; rst = 1;
 #20 rst = 0;
 end
 
always #5 clk=~clk;
 /*
initial
 begin
 rst=1;
 #20 rst=0;
 end*/
 
initial
 begin
 alu_cfg::v_if = a_if; //connecting the virtual interface with physical interface
 end
 
endmodule
