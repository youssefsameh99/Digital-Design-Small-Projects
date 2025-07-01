module parity(
    input [7:0] A,
    output [8:0] out_with_parity 

);

wire evenparity_bit ;

assign evenparity_bit =  ^A ;

assign out_with_parity = {A , evenparity_bit};

endmodule