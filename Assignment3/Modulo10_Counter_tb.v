module mod10_counter_tb();
reg clk_tb, rst_tb;
wire clk_div10_out_tb;

mod10_counter dut2(clk_tb , rst_tb , clk_div10_out_tb);

initial begin
    clk_tb = 0;
    forever begin
        #1 clk_tb = !clk_tb;
    end
end
initial begin
    rst_tb = 1;
    @(negedge clk_tb)
    rst_tb = 0;
        repeat (100) @(posedge clk_tb);
        $stop;
    end
endmodule
