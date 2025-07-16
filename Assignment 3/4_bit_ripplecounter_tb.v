module four_bit_RippleCounter_tb;

    reg clk_tb, rstn_tb;
    wire [3:0] out_tb;

    four_bit_RippleCounter dut (
        .clk(clk_tb),
        .rstn(rstn_tb),
        .out(out_tb)
    );

    initial begin
        clk_tb = 0;
        forever #1 clk_tb = ~clk_tb;  
    end


    initial begin
        rstn_tb = 0;
        #2;             
        rstn_tb = 1;    

        repeat (100) begin
            @(posedge clk_tb);
        end

        $stop; 
    end


endmodule
