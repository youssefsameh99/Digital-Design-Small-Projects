module UPDOWN_Counter #(width=4)(
    input clk,reset,en_load,
    input [width-1:0] load,
    input up_ndown,
    output cnt[width-1:0];

);

always @(posedge clk) begin
    if(~rst) 
    cnt = 0;
    else if(en_load)
    cnt = load;
    else if(up_ndown)
    cnt = cnt + 1'b1;
    else 
    cnt = cnt - 1'b1;


end







endmodule