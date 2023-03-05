class alu_tx;
//example of tx packet
//and also using rand keyword to make generator block,
//to generate stimulus
rand bit [7:0] a;
rand bit [7:0] b;
rand bit [1:0] sel;
     bit [7:0] out; //output doesnt come under stimulus
     
//adding constraints acc to spec
constraint a_notequals_b {a!=b;
                          a>b;}  //to resolve conflict of (if b>a, then subtraction gives signed negative which is not req for now)
constraint b_notequals_zero {b!=0;} // to resolve conflict of (dividing by b=0 gives infinite which is not req for now)

function void print(input string tag = "");
   begin
     $display("[%0s] : a = %0d\tb = %0d\tsel = %0d\tout = %0d @ %0t",tag,a,b,sel,out,$time);
   end
endfunction

endclass
