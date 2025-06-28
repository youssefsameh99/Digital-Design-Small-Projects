//------------------------------------------------------------------------------
// Module Name: mux2to1
// Description: This module implements a 2-to-1 multiplexer. It selects one of
//              the two input signals (in0 or in1) based on the value of the
//              selection line 'sel'.
//
// Inputs:
//   in0 - First input
//   in1 - Second input
//   sel - Select line (0 selects in0, 1 selects in1)
//
// Output:
//   out - Output that reflects the selected input
//------------------------------------------------------------------------------


module mux2to1(
    input in0,in1,sel,
    output out

);

assign out = (sel==0)?  in0 : in1;
endmodule

