module Datapath(
  clk, rst, wrEn, address, hit, outData
);
    input clk, rst, wrEn;
    input[14:0] address;
    output hit;
    output[31:0] outData;

    wire[127:0] memOut;

    Cache CACH(.clk(clk), .rst(rst), .wrEn(wrEn), .address(address), .inData(memOut), .outData(outData), .hit(hit));
    MainMemory MM(.address(address[14:2]), .outData(memOut));

endmodule // Datapath