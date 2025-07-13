module T_FF(
    input t, rstn, clk,
    output reg q,
    output reg qbar
);

always @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
        q <= 0;
        qbar <= 1;
    end else if (t) begin
        q <= ~q;
        qbar <= ~qbar;
    end
end
endmodule
