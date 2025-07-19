module dff_en_pre_tb();

reg PRE , clk , E , D;
wire Q;
reg prev_Q;

dff_en_pre dut(
    .E(E) , 
    .clk(clk) , 
    .D(D) ,
    .PRE(PRE) , 
    .Q(Q)
);
initial begin 
    clk = 0;
    forever
    #1 clk = !clk;
end
initial begin
    PRE = 0 ;
    D = 0;
    E = 0;
    @(negedge clk);
    if(Q == 1)
    $display("PRE check success : PRE = %d  , D = %d , E = %d , Q = %d" , PRE , D , E , Q);
    else $display("PRE check Failed : PRE = %d  , D = %d , E = %d , Q = %d" , PRE , D , E , Q);
    PRE = 1;
    prev_Q = Q;
    repeat(20) begin
        D = $random;
        E = $random;
        @(negedge clk);
        if(E) begin
            if(Q == D) $display("Success : PRE = %d  , D = %d , E = %d , Q = %d" , PRE , D , E , Q);
            else $display("Failed : PRE = %d  , D = %d , E = %d , Q = %d" , PRE , D , E , Q);
        end
        else begin
            if (Q == prev_Q) $display("Success : PRE = %d  , D = %d , E = %d , Q = %d" , PRE , D , E , Q);
            else $display("Failed : PRE = %d  , D = %d , E = %d , Q = %d" , PRE , D , E , Q);
        end
        prev_Q = Q;
    end
    $stop;
end

endmodule
