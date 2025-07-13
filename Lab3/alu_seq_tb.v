module alu_tb();

reg [3:0] A_tb,B_tb;
reg[1:0] opcode_tb;
reg rst_tb,clk_tb;
wire [7:0] out_tb;

alu dut0(A_tb,B_tb,opcode_tb,rst_tb,clk_tb,out_tb);

initial begin
    clk_tb = 0;
    forever begin
        #1 clk_tb = ~clk_tb;
    end
end

initial begin
    rst_tb = 1;
    A_tb = 0;
    B_tb = 0;
    opcode_tb = 0;
    @(negedge clk_tb);
    rst_tb = 0;
    repeat (20) begin
        A_tb = $random;
        B_tb = $random;
        opcode_tb = $random;
        @(negedge clk_tb);
        @(negedge clk_tb);
        case(opcode_tb)
        2'b00 : if(out_tb == (A_tb + B_tb)) $display("success"); else $display("failed");
        2'b01 : if(out_tb == (A_tb * B_tb)) $display("success"); else $display("failed");
        2'b10 : if(out_tb == (A_tb | B_tb)) $display("success"); else $display("failed");
        default: if(out_tb == (A_tb & B_tb)) $display("success"); else $display("failed");
        endcase

    end
$stop;
end
endmodule




