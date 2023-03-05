class fifo_cfg;
 static mailbox #(fifo_tx) gen2drv = new();
 static mailbox #(fifo_tx) mon2scb = new();
 static virtual fifo_if f_if;
endclass
