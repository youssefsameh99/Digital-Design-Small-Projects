module fourbit_syncCounter_tb();

reg clk , set ;
wire [3:0] out;
wire [3:0] out_goldenref;

four_bit_RippleCounter dut0(clk , set , out_goldenref);
fourbit_syncCounter dut1(clk , set , out);

initial begin
    clk = 0;
    forever begin
        #1 clk = !clk;
    end
end

initial begin
    set = 0;
    @(negedge clk);
    if(out == out_goldenref)
    $display("Set test complete");
    else $display("Set test failed");
    set = 1;
    repeat(100) begin
    @(negedge clk);
    if(out == out_goldenref) $display("Count Success :  out = %d , out_goldenref = %d " , out , out_goldenref);
    else $display("Count Failed  :  out = %d , out_goldenref = %d " , out , out_goldenref);
    end
    $stop;
end
endmodule

