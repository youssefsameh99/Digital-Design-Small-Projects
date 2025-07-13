module q1_tb3();
reg [3:0] in0_tb,in1_tb;
wire [3:0] out_tb;


N_bitALU #(4,2'b11) dut3(in0_tb,in1_tb,out_tb);

integer i;

initial begin
    for(i = 0 ; i < 20 ; i = i + 1) begin
        in0_tb = $random;
        in1_tb = $random;
        #10;
        if(out_tb == (in0_tb ^ in1_tb)) begin
            $display("Success");
end
else begin
    $display("Error - Incorrect ALU Output");

end
end
$stop;
end
initial begin
    $monitor("in0_tb = %b, in1_tb = %b, out_tb = %b" , in0_tb , in1_tb , out_tb);

end

endmodule