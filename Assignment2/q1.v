module N_bitALU #(parameter N = 4, OPCODE = 2'b00)(
    input [N-1:0] in0, in1,
    output [N-1:0] out

);
assign out = (OPCODE == 2'b00 ) ? (in0 + in1) :
             (OPCODE == 2'b01 ) ? (in0 | in1) :
             (OPCODE == 2'b10 ) ? (in0 - in1) :
             (in0 ^ in1) ;
            
endmodule