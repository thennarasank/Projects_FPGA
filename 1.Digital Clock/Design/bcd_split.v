module bcd_split(
    input [5:0] sec,
    input [5:0] min,
    output reg [3:0] d0, d1, d2, d3
);

always @(*) begin
    d0 = sec % 10;
    d1 = sec / 10;
    d2 = min % 10;
    d3 = min / 10;
end

endmodule
