module D_FF(
    input d, rstn, clk,
    output reg q,qbar
);

always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
        q <= 0;
        qbar <= 1;
    end
    else begin
        q <= d;
        qbar <= ~d;
    end
end
endmodule
