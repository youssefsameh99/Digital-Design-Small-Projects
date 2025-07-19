module fourbit_syncCounter_tb();

reg clk , set ;
wire [3:0] out;
wire [3:0] out_goldenref;
wire div_2, div_4;

four_bit_RippleCounter dut0(clk , set , out_goldenref);
fourbit_syncCounter_extended dut1(clk , set , out,div_2, div_4);

initial begin
    clk = 0;
    forever begin
        #1 clk = !clk;
    end
end

initial begin
    set = 0;
    @(negedge clk);
    set = 1;
    repeat(100) begin
    @(negedge clk);
    if(out == out_goldenref) $display("Count Success :  out = %d , out_goldenref = %d " , out , out_goldenref);
    else $display("Count Failed  :  out = %d , out_goldenref = %d " , out , out_goldenref);
    if(div_2 == out[0] && div_4 == out[1]) 
        $display("Dividers Success : div_2 = %b , div_4 = %b", div_2, div_4);
    else 
        $display("Dividers Failed : div_2 = %b , div_4 = %b", div_2, div_4);        
    end
    $stop;
end
endmodule

