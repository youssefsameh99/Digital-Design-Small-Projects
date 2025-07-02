module NbitALU #(parameter N=4)(
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



module sevensegment(
    input enable,
    input [3:0] in1, in0,
    input [1:0] opcode,
    output reg a, b, c, d, e, f, g
);

    wire [3:0] alu_out;

    NbitALU #(.N(4)) alu (
        .in1(in1),
        .in0(in0),
        .opcode(opcode),
        .out(alu_out)
    );

    always @(*) begin
        if (enable) begin
            case (alu_out)
                4'h0: {a,b,c,d,e,f,g} = 7'b1111110;
                4'h1: {a,b,c,d,e,f,g} = 7'b0110000;
                4'h2: {a,b,c,d,e,f,g} = 7'b1101101;
                4'h3: {a,b,c,d,e,f,g} = 7'b1111001;
                4'h4: {a,b,c,d,e,f,g} = 7'b0110011;
                4'h5: {a,b,c,d,e,f,g} = 7'b1011011;
                4'h6: {a,b,c,d,e,f,g} = 7'b1011111;
                4'h7: {a,b,c,d,e,f,g} = 7'b1110000;
                4'h8: {a,b,c,d,e,f,g} = 7'b1111111;
                4'h9: {a,b,c,d,e,f,g} = 7'b1111011;
                4'hA: {a,b,c,d,e,f,g} = 7'b1110111;
                4'hB: {a,b,c,d,e,f,g} = 7'b0011111;
                4'hC: {a,b,c,d,e,f,g} = 7'b1001110;
                4'hD: {a,b,c,d,e,f,g} = 7'b0111101;
                4'hE: {a,b,c,d,e,f,g} = 7'b1001111;
                4'hF: {a,b,c,d,e,f,g} = 7'b1000111;
                default: {a,b,c,d,e,f,g} = 7'b0000000; 
            endcase
        end else begin
            {a,b,c,d,e,f,g} = 7'b0000000; 
        end
    end

endmodule

