module fourbit_syncCounter(
    input clk , set,
    output reg [3:0] out
);

always@(posedge clk or negedge set) begin
    if(~set)
    out <= 4'b1111;
    else
    out <= out + 1;
end
endmodule

