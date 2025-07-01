module question4(
    input [1:0] A,
    output [3:0] D

);
assign D = (A == 2'b00) ?  4'b0001 : 
           (A == 2'b01) ?  4'b0010 :
           (A == 2'b10) ?  4'b0100 :
           (A == 2'b11) ?  4'b1000 :
                           4'b0000 ; //default
endmodule
