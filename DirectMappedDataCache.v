module DirectMappedDataCache(
  clk, rst, start, done, address, outData, hitNum
);
    input clk, rst, start;
    input[14:0] address;
    output done;
    output[15:0] hitNum;
    output[31:0] outData;

    wire hit, wrEn;

    Datapath DP(.clk(clk), .rst(rst), .wrEn(wrEn), .address(address), .hit(hit), .outData(outData));
    Controller CU(.clk(clk), .rst(rst), .start(start), .done(done), .address(address), .wrEn(wrEn), .hit(hit), .hitNum(hitNum));

endmodule // DirectMappedDataCache