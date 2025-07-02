module question2(
    input [2:0] D,
    input A,B,C,sel,
    output reg out,out_bar
);

reg in0,in1;




always @(*) begin
    in0 = (D[0] & D[1]) | (D[2]);
    in1 = ~(A ^ B ^ C);
   if (sel == 0) begin
    out = in0;
   end
    else begin
        out = in1;
    end
    out_bar = ~out;
end



endmodule