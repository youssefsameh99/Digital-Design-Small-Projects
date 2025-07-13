module demux1to4_tb();
    reg D_tb;
    reg [1:0] S_tb;
    wire [3:0] Y_tb;
    reg [3:0] Y_expected;

    demux1to4 dut0(.D(D_tb), .S(S_tb), .Y(Y_tb));

    integer i;
    initial begin
        D_tb = 1;
        for(i = 0; i < 4; i = i + 1) begin
            S_tb = i;
            Y_expected = D_tb << i;
            #10;
            if (Y_tb == Y_expected) begin
                $display("Success");
            end else begin
                $display("Test %0d failed: Y_tb = %b, Expected = %b", i, Y_tb, Y_expected);
            end
        end
        $finish;
    end
endmodule
