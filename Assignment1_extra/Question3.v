module question3(
    input A,B,C,
    output F,
);
assign F = C & (A ^ B) & ~( B ^ C );
endmodule