module q2(
    input D,E,PRE,CLK,
    output reg q
);

always @ (posedge CLK or negedge PRE) begin
    if(~PRE)
    q = 1'b0;
    else if (E == 1) begin
        q <= D;
        
    end

  
end
endmodule