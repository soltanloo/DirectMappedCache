module MainMemory(
  address, outData
);
    input[12:0] address;
    output[127:0] outData;

    reg[31:0] dataArray[32767:0];
    integer i;

    assign outData = {dataArray[{address, 2'b00}], dataArray[{address, 2'b01}],
	dataArray[{address, 2'b10}], dataArray[{address, 2'b11}]};
    initial begin
	for(i = 0; i < 8192; i = i + 1) begin
	    dataArray[i+1024] = i;
	end
    end
endmodule // MainMemory