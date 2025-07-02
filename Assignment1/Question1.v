module question1(
    input A,B,C,D,E,F,sel,
    output out,out_bar

);
wire in0 , in1;



assign in0 = A & B & C;
assign in1 = ~(D ^ E ^ F);
assign out = (sel == 0) ? in0 : in1;
assign out_bar = ~out;
endmodule