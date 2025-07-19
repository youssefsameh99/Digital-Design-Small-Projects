module SLE(
    input D , CLK , EN , ALn , ADn , SLn , SD , LAT ,
    output reg Q

);
reg Q_FF , Q_LAT;

always @(posedge CLK or negedge ALn or negedge ADn) begin
    if(!ALn) begin
        Q_FF <= !ADn;
    end
    else if(!LAT) begin
            if(EN) begin
                if(!SLn)
                Q_FF <= SD;
                else
                Q_FF <= D;
            end
        end
end

always @(*) begin
    if (LAT) begin
        if (~ALn)
            Q_LAT = ~ADn;
        else if (CLK && EN) begin
            if (~SLn)
                Q_LAT = SD;
            else
                Q_LAT = D;
        end
    end
end


always@(*)begin
    Q = (LAT==1) ? Q_LAT : Q_FF;
end
    

endmodule
