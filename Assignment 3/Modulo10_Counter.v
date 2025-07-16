module mod10_counter(
    input clk , rst,
    output reg clk_div10_out

);
reg [3:0]count;

always@(posedge clk or posedge rst) begin
    
    if(rst) begin
    clk_div10_out <= 0;
    count <= 0;
    end

    else if (count == 4) begin
    clk_div10_out <= ~clk_div10_out;
    count <= 0;
    end

    else count <= count + 1;

    end

endmodule