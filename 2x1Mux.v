module mux2to1(
    input in0,in1,sel,
    output out

);

assign out = (sel==0)?  in0 : in1;
endmodule

