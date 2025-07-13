module alu(
input [3:0] A,B,
input[1:0] opcode,
input rst,clk,
output reg [7:0] out


);

reg [3:0] A_reg;
reg [3:0] B_reg;
reg opcode_reg;
wire [7:0] alu_out;

always @(posedge clk or posedge rst) begin
    if(rst) begin
        A_reg <= 0;
        B_reg <= 0;
        opcode_reg <= 0;
    end
    else begin
        A_reg <= A;
        B_reg <= B;
        opcode_reg <= opcode;
    end    
end

assign alu_out = (opcode == 2'b00) ? (A_reg + B_reg) : (opcode == 2'b01) ? (A_reg * B_reg) : (opcode == 2'b10) ? (A_reg | B_reg) : (A_reg & B_reg);

always @(posedge clk or posedge rst) begin
    if(rst) begin
        out <= 0;
    end
    else begin
        out <= alu_out ;
    end    
end




endmodule