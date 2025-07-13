module top #(parameter SIZE = 4)(
    input [SIZE-1 :0] x,
    input [SIZE-1 :0] y,
    input [SIZE-1 :0] adder_num,
    output [SIZE-1 :0] z
);


integer i;
always @(*) begin
    for(i = 0; i <adder_num; i = i+1) begin : adder_loop
        adder inst1(.in1(x[i]),.in2(y[i]),.sum(z[i]));
    end
end
endmodule


module top #(parameter SIZE = 4)(
    input [SIZE-1 :0] x,
    input [SIZE-1 :0] y,
    input [SIZE-1 :0] adder_num,
    output [SIZE-1 :0] z
);


genvar i;
generate begin
        for(i = 0; i <adder_num; i = i+1) begin : adder_loop
        adder inst1(.in1(x[i]),.in2(y[i]),.sum(z[i]));
    end
end
endgenerate
endmodule

module top #(parameter SIZE = 4, parameter ADDER_NUM = 4)(
    input  [SIZE-1:0] x,
    input  [SIZE-1:0] y,
    output [SIZE-1:0] z
);

genvar i;
generate
    for (i = 0; i < ADDER_NUM; i = i + 1) begin : adder_loop
        adder inst1 (
            .in1(x[i]),
            .in2(y[i]),
            .sum(z[i])
        );
    end
endgenerate

endmodule


    










