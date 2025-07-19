module four_bit_RippleCounter (
    input clk, rstn,
    output [3:0] out
);

    wire [3:0] q, qbar;
    D_FF ff0 (
        .d(qbar[0]),
        .rstn(rstn),
        .clk(clk),
        .q(q[0]),
        .qbar(qbar[0])
    );

    genvar i;
    generate
        for (i = 1; i < 4; i = i + 1) begin : dff_chain
            D_FF ff (
                .d(qbar[i]),
                .rstn(rstn),
                .clk(q[i-1]),
                .q(q[i]),
                .qbar(qbar[i])
            );
        end
    endgenerate

    assign out = qbar; 

endmodule
