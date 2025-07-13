module encoder #(parameter USE_GREY = 1)(
    input [2:0] A,
    output reg [6:0] B
);

always @(*) begin
    if (USE_GREY) begin
        B[6:3] = 4'b0000;
        B[2]   = A[2];
        B[1]   = A[2] ^ A[1];
        B[0]   = A[1] ^ A[0];
    end else begin
        case (A)
            3'b000: B = 7'b0000000;
            3'b001: B = 7'b0000001;
            3'b010: B = 7'b0000010;
            3'b011: B = 7'b0000100;
            3'b100: B = 7'b0001000;
            3'b101: B = 7'b0010000;
            3'b110: B = 7'b0100000;
            3'b111: B = 7'b1000000;
            default: B = 7'b0000000;
        endcase
    end
end

endmodule
