module q4 #(parameter LAT_WIDTH = 1)(
    input aset,gate,aclr,
    input [LAT_WIDTH-1:0] data,
    output reg [LAT_WIDTH-1:0] q
);


always @(*) begin
    if(aclr) begin
        q <= 0;
    end
    else if(aset) begin
        q <= {LAT_WIDTH{1'b1}};
    end
    else if(gate) begin
        q <= data;
    end
end
endmodule



