module paramerized_shiftreg_tb;

    parameter LOAD_AVALUE = 2;
    parameter LOAD_SVALUE = 4;
    parameter SHIFT_DIRECTION = "LEFT";
    parameter SHIFT_WIDTH = 8;

    reg sclr, sset, shiftin, load, clock, enable, aclr, aset;
    reg [SHIFT_WIDTH-1:0] data;
    wire [SHIFT_WIDTH-1:0] q;
    wire shiftout;

    paramerized_shiftreg #(
        .LOAD_AVALUE(LOAD_AVALUE),
        .SHIFT_DIRECTION(SHIFT_DIRECTION),
        .LOAD_SVALUE(LOAD_SVALUE),
        .SHIFT_WIDTH(SHIFT_WIDTH)
    ) dut (
        .sclr(sclr),
        .sset(sset),
        .shiftin(shiftin),
        .load(load),
        .clock(clock),
        .enable(enable),
        .aclr(aclr),
        .aset(aset),
        .data(data),
        .q(q),
        .shiftout(shiftout)
    );

    initial begin
        clock = 0;
        forever #1 clock = ~clock;
    end
integer i;
    initial begin
        
        $display("Starting Test 2.1: Async Clear + Set");
        aclr = 1;   
        aset = 1;   

        for (i = 0; i < 5; i = i + 1) begin
            sclr    = $random;
            sset    = $random;
            shiftin = $random;
            load    = $random;
            enable  = $random;
            data    = $random;
            @(negedge clock);

            if (q == 0)
                $display("Test 2.1 PASSED: case[%0d]", i);
            else
                $display("Test 2.1 FAILED: case[%0d]", i);
        end

        $display("Starting Test 2.2: Async Set Only");
        aclr = 0;
        aset = 1;

        for (i = 0; i < 5; i = i + 1) begin
            sclr    = $random;
            sset    = $random;
            shiftin = $random;
            load    = $random;
            enable  = $random;
            data    = $random;
            @(negedge clock);

            if (q == LOAD_AVALUE)
                $display("Test 2.2 PASSED: case[%0d]", i);
            else
                $display("Test 2.2 FAILED: case[%0d]", i);
        end

        $display("Starting Test 2.3: Sync Clear");
        aclr = 0;
        aset = 0;
        enable = 1;
        sclr = 1;
        sset = 1;

        for (i = 0; i < 5; i = i + 1) begin
            shiftin = $random;
            load    = $random;
            data    = $random;
            @(negedge clock);

            if (q == 0)
                $display("Test 2.3 PASSED: case[%0d]", i);
            else
                $display("Test 2.3 FAILED: case[%0d]", i);
        end

        $display("Starting Test 2.4: Sync Set");
        aclr = 0;
        aset = 0;
        enable = 1;
        sclr = 0;
        sset = 1;

        for (i = 0; i < 5; i = i + 1) begin
            shiftin = $random;
            load    = $random;
            data    = $random;
            @(negedge clock);

            if (q == LOAD_SVALUE)
                $display("Test 2.4 PASSED: case[%0d]", i);
            else
                $display("Test 2.4 FAILED: case[%0d]", i);
        end

        $display("Starting Test 2.5: Load Functionality");
        aclr = 0;
        aset = 0;
        sclr = 0;
        sset = 0;
        enable = 1;
        load = 1;


        for (i = 0; i < 5; i = i + 1) begin
            data = $random;
            @(negedge clock);

            if (q == data)
                $display("Test 2.5 PASSED: case[%0d] , data = %d , q = %d", i , data , q);
            else
                $display("Test 2.5 Failed : case[%0d] , data = %d , q = %d", i , data , q);
        end

         $display("Starting Test 2.6: Shifting Functionality");
        aclr = 0;
        aset = 0;
        sclr = 0;
        sset = 0;
        load = 0;
        enable = 1;

        load = 1;
        data = 8'b10101010; 
        @(negedge clock);
        load = 0;

        $display("Initial q = %b", q);
        for (i = 0; i < 6; i = i + 1) begin
            shiftin = i[1]; //We will enter 2 0's then 2 1's then 2 0's
            @(negedge clock);
            $display("Test 2.6 case[%0d]: shiftin = %b, q = %b, shiftout = %b", i, shiftin, q, shiftout);
        end


        $display("All tests complete.");
        #10 $stop;
    end

endmodule