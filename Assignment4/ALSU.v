module ALSU #(parameter INPUT_PRIORITY = "A" , parameter FULL_ADDER = "ON")(
    input [2:0] A , B , opcode,
    input cin , serial_in , direction , red_op_A , red_op_B , bypass_A , bypass_B,
    input clk , rst , 
    output reg [5:0] out , 
    output reg [15:0] leds
);

wire [2:0] A_d, B_d, opcode_d;
wire cin_d, serial_in_d, direction_d, red_op_A_d, red_op_B_d, bypass_A_d, bypass_B_d;






D_FF dff_A[2:0] (.d(A), .rst(rst), .clk(clk), .q(A_d));
D_FF dff_B[2:0] (.d(B), .rst(rst), .clk(clk), .q(B_d));
D_FF dff_opcode[2:0] (.d(opcode), .rst(rst), .clk(clk), .q(opcode_d));
D_FF dff_cin(.d(cin), .rst(rst), .clk(clk), .q(cin_d));
D_FF dff_serial_in(.d(serial_in), .rst(rst), .clk   (clk), .q(serial_in_d));
D_FF dff_direction(.d(direction), .rst(rst), .clk(clk), .q(direction_d));
D_FF dff_red_op_A(.d(red_op_A), .rst(rst), .clk(clk), .q(red_op_A_d));
D_FF dff_red_op_B(.d(red_op_B), .rst(rst), .clk(clk), .q(red_op_B_d));
D_FF dff_bypass_A(.d(bypass_A), .rst(rst), .clk(clk), .q(bypass_A_d));
D_FF dff_bypass_B(.d(bypass_B), .rst(rst), .clk(clk), .q(bypass_B_d));


always @(posedge clk or posedge rst) begin
    if (rst) begin
        out  <= 6'b0;
        leds <= 16'b0;
    end else begin

         if (opcode_d == 3'b110 || opcode_d == 3'b111) begin
            leds <= ~leds;
        end
        if ((red_op_A_d || red_op_B_d) && (opcode_d != 3'b000 && opcode_d != 3'b001)) begin
            leds <= ~leds;
        end

        if (bypass_A_d || bypass_B_d) begin
            if (bypass_A_d && bypass_B_d)
                out <= (INPUT_PRIORITY == "A") ? A_d : B_d;
            else if (bypass_A_d)
                out <= A_d;
            else
                out <= B_d;
        end else begin
            case (opcode_d)
                3'b000: begin
                    if (red_op_A_d && red_op_B_d)
                        out <= (INPUT_PRIORITY == "A") ? {5'b0, &A_d} : {5'b0, &B_d};
                    else if (red_op_A_d)
                        out <= {5'b0, &A_d};
                    else if (red_op_B_d)
                        out <= {5'b0, &B_d};
                    else
                        out <= A_d & B_d;
                end
                3'b001: begin
                    if (red_op_A_d && red_op_B_d)
                        out <= (INPUT_PRIORITY == "A") ? {5'b0, ^A_d} : {5'b0, ^B_d};
                    else if (red_op_A_d)
                        out <= {5'b0, ^A_d};
                    else if (red_op_B_d)
                        out <= {5'b0, ^B_d};
                    else
                        out <= A_d ^ B_d;
                end
                3'b010: out <= (FULL_ADDER == "ON") ? (A_d + B_d + cin_d) : (A_d + B_d);
                3'b011: out <= A_d * B_d;
                3'b100: out <= direction_d ? {out[4:0], serial_in_d} : {serial_in_d, out[5:1]};
                3'b101: out <= direction_d ? {out[4:0], out[5]} : {out[0], out[5:1]};
                default: begin
                    out <= 6'b0;
                end
            endcase
        end
    end
end

endmodule

