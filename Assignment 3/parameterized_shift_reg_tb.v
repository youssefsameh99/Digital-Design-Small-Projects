`timescale 1ns / 1ps

module paramerized_shiftreg_tb;

    // Parameters
    parameter LOAD_AVALUE = 2;
    parameter LOAD_SVALUE = 4;
    parameter SHIFT_DIRECTION = "LEFT";
    parameter SHIFT_WIDTH = 8;

    // DUT Signals
    reg sclr, sset, shiftin, load, clock, enable, aclr, aset;
    reg [SHIFT_WIDTH-1:0] data;
    wire [SHIFT_WIDTH-1:0] q;
    wire shiftout;

    // Instantiate DUT
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

    // Clock Generation
    initial begin
        clock = 0;
        forever #1 clock = ~clock;
    end

    // Stimulus and Test Cases
    initial begin
        // -------- Test 2.1: Asynchronous Clear and Set --------
        $display("Starting Test 2.1: Async Clear + Set");

        aclr = 1;   // Active
        aset = 1;   // Active
        // Randomize other signals
        repeat (5) begin
            sclr    = $random;
            sset    = $random;
            shiftin = $random;
            load    = $random;
            enable  = $random;
            data    = $random;
            @(negedge clock);
        end

        if (q == 0)
            $display("Test 2.1 SUCCESS: q = %0h", q);
        else
            $display("Test 2.1 FAILED : q = %0h", q);

        // -------- Test 2.2: Asynchronous Set --------
        $display("Starting Test 2.2: Async Set");

        aclr = 0;   // Inactive
        aset = 1;   // Active
        repeat (5) begin
            sclr    = $random;
            sset    = $random;
            shiftin = $random;
            load    = $random;
            enable  = $random;
            data    = $random;
            @(negedge clock);
        end

        if (q == LOAD_AVALUE)
            $display("Test 2.2 SUCCESS: q = %0h", q);
        else
            $display("Test 2.2 FAILED : q = %0h", q);

        // -------- Test 2.3: Synchronous Clear --------
        $display("Starting Test 2.3: Sync Clear");

        aclr = 0;
        aset = 0;
        sclr = 1;   // Active
        sset = 1;   // Ignored if sclr takes priority (depends on logic order)
        enable = 1; // Must be enabled
        repeat (5) begin
            shiftin = $random;
            load    = $random;
            data    = $random;
            @(negedge clock);
        end

        if (q == 0)
            $display("Test 2.3 SUCCESS: q = %0h", q);
        else
            $display("Test 2.3 FAILED : q = %0h", q);

        // -------- Test 2.4: Synchronous Set --------
        $display("Starting Test 2.4: Sync Set");

        aclr = 0;
        aset = 0;
        sclr = 0;
        sset = 1;   // Active
        enable = 1; // Must be enabled
        repeat (5) begin
            shiftin = $random;
            load    = $random;
            data    = $random;
            @(negedge clock);
        end

        if (q == LOAD_AVALUE)
            $display("Test 2.4 SUCCESS: q = %0h", q);
        else
            $display("Test 2.4 FAILED : q = %0h", q);

        $display("All tests complete.");
        #10 $stop;
    end

endmodule
