module paramerized_shiftreg#(
    parameter LOAD_AVALUE = 1,
    parameter SHIFT_DIRECTION = "LEFT" ,
    parameter LOAD_SVALUE = 1 , 
    parameter SHIFT_WIDTH = 2 
)(
    input sclr , sset , shiftin , load , clock , enable , aclr , aset , 
    input [SHIFT_WIDTH-1 : 0] data , 
    output reg [SHIFT_WIDTH-1 : 0] q ,
    output reg shiftout
);

always @(posedge clock or posedge aclr or posedge aset) begin 
    if(aclr)
        q <= 0;
    else if(aset)
        q <= LOAD_AVALUE;
    else if(enable) begin
        if(sclr)
        q <= 0;
        else if(sset)
        q <= LOAD_SVALUE;
        else if(load)
        q <= data;
        else begin
        case(SHIFT_DIRECTION)
        "LEFT" : begin
            q <= {q[SHIFT_WIDTH-2:0] , shiftin}; 
            shiftout <= q[SHIFT_WIDTH-1];
        end
        "RIGHT" : begin
         q <= {shiftin , q[SHIFT_WIDTH-1:1]};
         shiftout <= q[0];
        end


        endcase
        end


    end








end




endmodule