
module General_FF #(parameter FF_TYPE = "DFF")(
    input d, rstn, clk,
    output reg q, qbar
);

generate
    if (FF_TYPE == "DFF") begin 
        always @ (posedge clk or negedge rstn) begin
            if (!rstn) begin
                q <= 0;
                qbar <= 1;
            end else begin
                q <= d;
                qbar <= ~d;
            end
        end
    end else if (FF_TYPE == "TFF") begin
        always @ (posedge clk or negedge rstn) begin
            if (!rstn) begin
                q <= 0;
                qbar <= 1;
            end else if (d) begin
                q <= ~q;
                qbar <= ~qbar;
            end
        end
    end 
endgenerate

endmodule

