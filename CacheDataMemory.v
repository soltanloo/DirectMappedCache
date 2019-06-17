module CacheDataMemory(
  clk, rst, wrEn, address, inData, outData
);
    input clk, rst, wrEn;
    input[9:0] address;
    input[127:0] inData;
    output[127:0] outData;

    reg[127:0] dataArray[1023:0];
    integer i;

    always @(posedge clk, posedge rst) begin
      if (rst) begin
        for (i = 0; i < 1024; i = i + 1) begin
          dataArray[i] <= 128'b0;
        end
      end
      else begin
        if (wrEn) begin
          dataArray[address] <= inData;
        end
      end
    end
    assign outData = dataArray[address];
endmodule // CacheDataMemory