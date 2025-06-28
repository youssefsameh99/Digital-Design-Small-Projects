//------------------------------------------------------------------------------
// Module Name: NbitALU
// Description: This module implements a simple N-bit Arithmetic Logic Unit (ALU)
//              that performs operations on two N-bit input values based on a 
//              2-bit opcode.
//
// Parameters:
//   N - Bit-width of the input and output buses (default is 3)
//
// Inputs:
//   in1    - First N-bit operand
//   in0    - Second N-bit operand
//   opcode - 2-bit control signal to select the operation:
//              00 -> Addition (in1 + in0)
//              01 -> Bitwise OR (in1 | in0)
//              10 -> Subtraction (in1 - in0)
//              11 -> Bitwise XOR (in1 ^ in0)
//
// Output:
//   out - N-bit result of the selected operation
//------------------------------------------------------------------------------


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
