module parameterized_DFF_tb();

reg d_tb , clk_tb , rstn_tb;
wire q_tb , qbar_tb , q_golden , qbar_golden;


D_FF dut0(d_tb , rstn_tb , clk_tb , q_golden , qbar_golden);
General_FF #("DFF") dut1(d_tb , rstn_tb , clk_tb , q_tb , qbar_tb);


initial begin
    clk_tb = 0;
    forever begin
        #1 clk_tb = !clk_tb;
    end
end

initial begin

    rstn_tb = 0;
    d_tb = 0;
    @(negedge clk_tb)
    rstn_tb = 1;

    @(negedge clk_tb)

    if(q_tb == q_golden && qbar_tb == qbar_golden) $display("Reset values Success");
    else $display("reset failed");

    repeat(20) begin

        d_tb = $random % 2;
        @(negedge clk_tb)
        if(q_tb == q_golden && qbar_tb == qbar_golden) $display("Success");
        else $display("failed");




    end
    $stop;





end

















endmodule