module datalatch(
    input CLR, D, G,
    output reg Q

);

always @(*) begin
    if(!CLR) begin
        Q <= 0;
    end
    else if (G) begin
        Q <= D;
    end

end
endmodule