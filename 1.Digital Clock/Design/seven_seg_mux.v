module seven_seg_mux(
    input clk,
    input [3:0] d0, d1, d2, d3,
    output reg [6:0] seg,
    output reg [3:0] an,
    output reg [3:0] digit   
);

reg [1:0] sel = 0;
reg [15:0] refresh = 0;

always @(posedge clk) begin
    refresh <= refresh + 1;
    if (refresh == 50000) begin
        refresh <= 0;
        sel <= sel + 1;
    end
end

always @(*) begin
    case(sel)
        2'b00: begin an = 4'b1000; digit = d0; end
        2'b01: begin an = 4'b0100; digit = d1; end
        2'b10: begin an = 4'b0010; digit = d2; end
        2'b11: begin an = 4'b0001; digit = d3; end 
    endcase
end

always @(*) begin
    case(digit)
        4'd0: seg = 7'b1000000;
        4'd1: seg = 7'b1111001;
        4'd2: seg = 7'b0100100;
        4'd3: seg = 7'b0110000;
        4'd4: seg = 7'b0011001;
        4'd5: seg = 7'b0010010;
        4'd6: seg = 7'b0000010;
        4'd7: seg = 7'b1111000;
        4'd8: seg = 7'b0000000;
        4'd9: seg = 7'b0010000;
        default: seg = 7'b1111111;
    endcase
end

endmodule
