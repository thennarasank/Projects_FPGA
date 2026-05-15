module clk_div_1hz(
    input clk,
    input rst,
    output reg tick_1s
);

reg [26:0] count;

always @(posedge clk or posedge rst) begin
    if (rst) begin
        count <= 0;
        tick_1s <= 0;
    end else begin
        if (count == 50_000_000 - 1) begin
            count <= 0;
            tick_1s <= 1;
        end else begin
            count <= count + 1;
            tick_1s <= 0;
        end
    end
end

endmodule
