module priorityencoder(
    input [3:0] x,
    output reg [1:0] y
);

always @(*) begin
    case (x) 
    4'b1xxx : y = 2'b11;
    4'b01xx : y = 2'b10;
    4'b001x : y = 2'b01;
    4'b000x : y = 2'b00;
        
    endcase
end
endmodule