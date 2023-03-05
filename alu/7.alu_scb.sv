//scoreboard (need class handle to operate on packet, need mailbox to read values)
class alu_scb;
alu_tx tx;
mailbox #(alu_tx) mon2scb;

event next;

function new();
 this.mon2scb=alu_cfg::mon2scb;
 endfunction
 
 task run();
   forever
    begin
      mon2scb.get(tx);
     // $display("a=%0d , b=%0d , sel=%0d , out=%0d",tx.a,tx.b,tx.sel,tx.out);
      tx.print("SCB");
      case (tx.sel)
        2'b00:begin
              if(tx.a+tx.b==tx.out)
                $display("ADDITION TEST PASS");
              else
                $display("ADDITION TEST FAIL");
              end
        2'b01:begin
              if(tx.a-tx.b==tx.out)
                $display("SUBTRACTION TEST PASS");
              else
                $display("SUBTRACTION TEST FAIL");
              end
        2'b10:begin
              if(tx.a*tx.b==tx.out)
                $display("MULTIPLICATION TEST PASS");
              else
                $display("MULTIPLICATION TEST FAIL");
              end
        2'b11:begin
              if(tx.a/tx.b==tx.out)
                $display("DIVISION TEST PASS");
              else
                $display("DIVISION TEST FAIL");
              end
        default: $display("NO VALUE MATCH");
        
      endcase
    -> next;
    end
  endtask
endclass
