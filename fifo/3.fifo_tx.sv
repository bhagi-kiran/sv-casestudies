class fifo_tx;
 rand bit 	rd, wr;
 rand bit [7:0] data_in;
      bit [7:0] data_out;
      bit 	empty, full;
 
 constraint rd_ne_wr {
 	rd != wr;
 	rd dist {0:/50, 1:/50};
 	wr dist {0:/50, 1:/50};
 	}
 	
 constraint data_constr {
 	data_in > 1;
 	data_in < 10;
 	}
 	
 function void display(input string tag = "");
 //used to send string from the class we are calling
 //so that we get the better idea
 //strategy inspired from UVM
  $display($time,,,"[%0s] : RD = %0b\tWR = %0b\tDATAWR = %0d\tDATARD = %0d\tEMPTY = %0b\tFULL = %0b",tag,rd,wr,data_in,data_out,empty,full);
 endfunction
 
 function fifo_tx copy();
 //to perform deepcopy
 copy = new();
 copy.rd	= this.rd;
 copy.wr	= this.wr;
 copy.data_in	= this.data_in;
 copy.data_out	= this.data_out; 
 copy.empty	= this.empty;
 copy.full	= this.full;
 return copy;
 endfunction
 
endclass
