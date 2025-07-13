
module grey_encoding_tb1();

reg [2:0] A_tb;
wire [6:0] B_tb;

encoder #(1) dut0 (
    .A(A_tb),
    .B(B_tb)
);

integer i;

initial begin
    
    for (i = 0; i < 8; i = i + 1) begin
        A_tb = i;
        #10;

        case (A_tb)
            3'd0: if (B_tb == 7'b0000000) $display("Test %0d passed", i); else $display("Test %0d failed: B_tb = %b", i, B_tb);
            3'd1: if (B_tb == 7'b0000001) $display("Test %0d passed", i); else $display("Test %0d failed: B_tb = %b", i, B_tb);
            3'd2: if (B_tb == 7'b0000011) $display("Test %0d passed", i); else $display("Test %0d failed: B_tb = %b", i, B_tb);
            3'd3: if (B_tb == 7'b0000010) $display("Test %0d passed", i); else $display("Test %0d failed: B_tb = %b", i, B_tb);
            3'd4: if (B_tb == 7'b0000110) $display("Test %0d passed", i); else $display("Test %0d failed: B_tb = %b", i, B_tb);
            3'd5: if (B_tb == 7'b0000111) $display("Test %0d passed", i); else $display("Test %0d failed: B_tb = %b", i, B_tb);
            3'd6: if (B_tb == 7'b0000101) $display("Test %0d passed", i); else $display("Test %0d failed: B_tb = %b", i, B_tb);
            3'd7: if (B_tb == 7'b0000100) $display("Test %0d passed", i); else $display("Test %0d failed: B_tb = %b", i, B_tb);
        endcase
    end

    $display("Test completed.");
    $finish;
end

endmodule
