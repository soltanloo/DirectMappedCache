module Controller(
  clk, rst, start, done, address, wrEn, hit, hitNum
);
    input clk, rst, start, hit;
    input[14:0] address;
    output reg done, wrEn;
    output reg[15:0] hitNum;

    parameter [1:0] IDLE = 0, START = 1, READ = 2, LOAD = 3;
    reg[1:0] ps, ns;

    always @(address) begin
	hitNum <= hit ? hitNum + 1 : hitNum;
    end

    always @(ps, start, hit) begin
      case (ps)
        IDLE: ns <= start ? START : IDLE;
        START: ns <= start ? START : READ;
        READ: ns <= hit ? READ : LOAD;
        LOAD: ns <= READ;
        default: ns <= ps;
      endcase
    end

    always @(ps, start, hit) begin
      done <= 0; wrEn <= 0;
      case (ps)
        IDLE: done <= 1;
        LOAD: wrEn <= 1;
        default: begin end
      endcase
    end

    always @(posedge clk, posedge rst) begin
      if (rst) begin
        ps <= IDLE;
	hitNum <= 16'b0;
      end
      else begin
        ps <= ns;
      end
    end

endmodule // Controller