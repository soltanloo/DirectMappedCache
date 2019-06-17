module TB();
	reg clk = 0, rst = 0, start = 0;
	reg[14:0] address = 15'b0;
	wire done;
	wire[15:0] hitNum;
	wire[31:0] outData;
	integer i;
	DirectMappedDataCache DMDC(.clk(clk), .rst(rst), .start(start), .done(done), .address(address), .outData(outData), .hitNum(hitNum));
	    initial begin
   		#20
    		rst=1;
    		#20
   		rst=0;
   		#20
   		start=1;
   		#20
   		clk=1;
   		#20
    		clk=0;
  		#20
  		start=0;
   		#20
		for(i = 0; i < 8192; i = i + 1) begin
    			#20 begin clk=~clk; address = 1024 + i; end
			#20 clk=~clk;
			#20 clk=~clk;
			#20 clk=~clk;
			#20 clk=~clk;
			#20 clk=~clk;
			#20 clk=~clk;
			#20 clk=~clk;
			#20 clk=~clk;
		end
 	    end
endmodule