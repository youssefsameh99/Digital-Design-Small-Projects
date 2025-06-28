module NbitALU #(parameter N=3)(
    input [N-1:0] in1,in0,
    input [1:0] opcode,
    output reg [N-1:0] out
);
    always @(*) begin
        case (opcode)
        2'b00 : out = in1 + in0;
        2'b01 : out = in1 | in0;
        2'b10 : out = in1 - in0;
        2'b11 : out = in1 ^ in0;         
        endcase
    end
endmodule
