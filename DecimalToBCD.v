//------------------------------------------------------------------------------
// Module Name: DecimaltoBCD
// Description: This module converts a one-hot encoded decimal digit input
//              (D0 to D9) into its corresponding 4-bit Binary Coded Decimal (BCD)
//              output (Y3 to Y0). Only one of the input lines D0–D9 should be high
//              at a time to represent the decimal digits 0 to 9.
//
// Inputs:
//   D0 to D9 - One-hot encoded decimal digit inputs (only one should be '1')
// Outputs:
//   Y3 to Y0 - 4-bit BCD representation of the active decimal input
//------------------------------------------------------------------------------

module DecimaltoBCD(
    input D0,D1,D2,D3,D4,D5,D6,D7,D8,D9,
    output reg Y0,Y1,Y2,Y3

);
always @(*) begin
    case ({D9,D8,D7,D6,D5,D4,D3,D2,D1,D0})
    10'b0000_0000_01 : {Y3,Y2,Y1,Y0} = 4'b0000;
    10'b0000_0000_10 : {Y3,Y2,Y1,Y0} = 4'b0001;
    10'b0000_0001_00 : {Y3,Y2,Y1,Y0} = 4'b0010;
    10'b0000_0010_00 : {Y3,Y2,Y1,Y0} = 4'b0011;
    10'b0000_0100_00 : {Y3,Y2,Y1,Y0} = 4'b0100;
    10'b0000_1000_00 : {Y3,Y2,Y1,Y0} = 4'b0101;
    10'b0001_0000_00 : {Y3,Y2,Y1,Y0} = 4'b0110;
    10'b0010_0000_00 : {Y3,Y2,Y1,Y0} = 4'b0111;
    10'b0100_0000_00 : {Y3,Y2,Y1,Y0} = 4'b1001;
    10'b1000_0000_00 : {Y3,Y2,Y1,Y0} = 4'b1010;
    default          : {Y3,Y2,Y1,Y0} = 4'b0000;
    endcase
end
endmodule
