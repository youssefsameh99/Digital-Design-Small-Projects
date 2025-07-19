module dff_en_pre(
    input E , D , clk , PRE ,
    output reg Q



);
always @(posedge clk or negedge PRE) begin
    if(!PRE)
    Q <= 1;
    else if (E)
    Q <=D;
end
endmodule