module mux2to1_tb();

reg D0_tb,D1_tb,D2_tb,S0_tb,S1_tb;
wire Y_dut,Y_dut2;

mux2to1_assign DUT1(D0_tb,D1_tb,D2_tb,S0_tb,S1_tb,Y_dut);

mux2to1_case DUT2(D0_tb,D1_tb,D2_tb,S0_tb,S1_tb,Y_dut2);


integer i;

initial begin
for(i=0;i<20;i=i+1) begin
    D0_tb = $random;
    D1_tb = $random;
    D2_tb = $random;
    S0_tb = $random;
    S1_tb = $random;
    #10;

end
$stop;
end
initial begin 
    $monitor("D0_tb = %b , D1_tb = %b , S0_tb = %b , S1_tb = %b " , D0_tb,D1_tb,D2_tb,S0_tb,S1_tb );
end



endmodule