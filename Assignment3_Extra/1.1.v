module reg_non_blocking1(clk , rst , in , out);
input in , rst, clk;
output reg out;
reg q1,q2;
always@(posedge clk) begin
  if(rst) begin
    q1<=0;
    q2<=0;
    out <=0;

end
else begin
    q1 <= in;
    q2 <= q1;
    out <= q2;
end
end
endmodule