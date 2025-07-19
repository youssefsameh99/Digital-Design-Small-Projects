module gray_counter_tb();
    reg clk, rst;
    wire [1:0] gray_out;

    gray_counter dut(clk, rst, gray_out);

    initial begin
        clk = 0;
        forever #1 clk = ~clk;
    end 
    initial begin
        rst = 1;
        @(negedge clk);
        rst = 0;
        repeat(100) @(negedge clk);
        $stop;
    end
endmodule
  