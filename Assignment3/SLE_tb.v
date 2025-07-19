module SLE_tb();

reg CLK , ALn , LAT , EN , ADn , SLn , SD , D;
wire Q;
reg prev_Q;
SLE dut(
    .CLK(CLK),
    .ALn(ALn),
    .LAT(LAT),
    .EN(EN),
    .ADn(ADn),
    .SLn(SLn),
    .SD(SD),
    .D(D),
    .Q(Q)
);

initial begin
    CLK = 0 ;
    forever begin
        #1 CLK = ~ CLK;
    end
end
    
initial begin
    ADn = 1 ; 
    ALn = 0 ;
    EN = 0;
    D = 0;
    SLn = 0;
    SD = 0;
    ADn = 0;
    LAT = 0;
   @(posedge CLK);

@(negedge CLK);
    LAT = 0;
    ALn = 1;
    repeat(20) begin
    EN = $random;
    D = $random;
    SLn = $random;
    SD = $random;
    ADn = $random;
    @(negedge CLK);
    end


    @(posedge CLK);
    ALn = 0 ;
    @(posedge CLK);

    ALn = 1;
    LAT = 1;
    $display("Starting Tests with LAT = 1");
     ALn = 1 ;
    LAT = 1;
     repeat ( 20 ) begin 
         D = $random ;
         EN = $random ;
        SLn= $random ;
        SD= $random ;
        
        @(negedge CLK);
  end 
  $stop;
    end
endmodule
