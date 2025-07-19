module ALSU_tb();
reg [2:0] A , B , opcode;
reg cin , serial_in , direction , red_op_A , red_op_B , bypass_A , bypass_B;
reg clk , rst ; 
wire [5:0] out ;
wire [15:0] leds;


ALSU dut(
    .A(A) ,
    .B(B) , 
    .opcode(opcode) ,
    .cin(cin) ,
    .serial_in(serial_in) ,
    .direction(direction) ,
    .red_op_A(red_op_A) ,
    .red_op_B(red_op_B) ,
    .bypass_A(bypass_A) , 
    .bypass_B(bypass_B) ,
    .clk(clk) ,
    .rst(rst) ,
    .out(out) ,
    .leds(leds)
);


initial begin
    clk = 0;
    forever #1 clk = ~clk;
end
integer i;

initial begin
    $display("Starting test 2.1");
    rst = 1;
    A = 0;
    B = 0;
    opcode = 0;
    cin = 0;
    serial_in = 0;
    direction = 0;
    red_op_A = 0;
    red_op_B = 0;
    bypass_A = 0;
    bypass_B = 0;
    @(negedge clk);
    if(out !== 6'b0 || leds !== 16'b0) begin
        $display("Test failed: Initial state not zero");
    end
    $display("Test 2.1 passed");

    $display("Starting test 2.2");
    bypass_A = 1;
    bypass_B = 1;
    rst = 0;
    for(i = 0 ; i < 8; i = i + 1) begin
        A = $random;
        B = $random;
        opcode = $urandom_range(0, 5);
        @(negedge clk);
        @(negedge clk);
        if(out !== A) begin
            $display("Test failed: Bypass A failed, expected %b, got %b", A, out);
        end
        else begin
            $display("Test 2.2 passed: Bypass A works as expected");
        end

    end

$stop;
end
endmodule
