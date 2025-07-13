module N_bitALU #(parameter N = 4, OPCODE = 2'b00)(
    input [N-1:0] in0, in1,
    input clk , rst,
    output reg [N-1:0] out
);
wire [N-1:0] alu_out;

assign alu_out = (OPCODE == 2'b00 ) ? (in0 + in1) :
                 (OPCODE == 2'b01 ) ? (in0 | in1) :
                 (OPCODE == 2'b10 ) ? (in0 - in1) :
                 (in0 ^ in1) ;


always @( posedge clk or posedge rst) begin
    if(rst) begin
        out <= 0;
    end
    else begin
        out <= alu_out;
    end
end

endmodule