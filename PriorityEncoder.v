//------------------------------------------------------------------------------
// Module Name: priorityencoder
// Description: This module implements a 4-to-2 priority encoder. It encodes the
//              position of the highest-priority active input (from x[3] to x[0])
//              into a 2-bit binary output 'y'. The highest index has the highest
//              priority (x[3] > x[2] > x[1] > x[0]).
//
// Input:
//   x - 4-bit input vector, where only one or more bits may be high
//
// Output:
//   y - 2-bit encoded output representing the index of the highest-priority '1'
//       Bit Priority: 
//         x[3] -> y = 2'b11
//         x[2] -> y = 2'b10
//         x[1] -> y = 2'b01
//         x[0] -> y = 2'b00
//------------------------------------------------------------------------------

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
