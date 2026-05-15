module time_counter(
    input clk,
    input rst,
    input tick_1s,
    output reg [5:0] sec,
    output reg [5:0] min
);

always @(posedge clk or posedge rst) begin
    if (rst) begin
        sec <= 0;
        min <= 0;
    end else if (tick_1s) begin
        if (sec == 59) begin
            sec <= 0;
            if (min == 59)
                min <= 0;
            else
                min <= min + 1;
        end else begin
            sec <= sec + 1;
        end
    end
end

endmodule
