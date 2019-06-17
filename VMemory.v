module VMemory(
  clk, rst, wrEn, address, inValidity, isValid
);
    input clk, rst, wrEn, inValidity;
    input[9:0] address;
    output isValid;

    reg[1023:0] validArray;
    
    always @(posedge clk, posedge rst) begin
      if (rst) begin
        validArray <= 1024'b0;
      end
      else begin
        if (wrEn) begin
          validArray[address] <= inValidity;
        end
      end
    end
    assign isValid = validArray[address];
endmodule // VMemory