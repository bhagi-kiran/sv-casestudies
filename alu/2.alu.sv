module alu(input [7:0] a,b,
        input [1:0] sel,
        input clk,rst,
        output reg [7:0] out);
        
always@(posedge clk)
  begin
    if(rst)
      out<=0;
    else
      begin
        case(sel)
          2'b00: out = a+b; //addition
          2'b01: out = a-b; //subtraction
          2'b10: out = a*b; //multiplication
          2'b11: out = a/b; //division
          default: out = a+b;          
        endcase
      end
  end
endmodule