`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.05.2026 12:54:54
// Design Name: 
// Module Name: digitalclock_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module digitalclock_top(
    input clk,
    input rst,
    output [6:0] seg,
    output [3:0] an
);

wire tick_1s;
wire [5:0] sec, min;
wire [3:0] d0, d1, d2, d3;

// Add clock divider
clk_div_1hz u1 (
    .clk(clk),
    .rst(rst),
    .tick_1s(tick_1s)
);

// Time counter
time_counter u2 (
    .clk(clk),
    .rst(rst),
    .tick_1s(tick_1s),
    .sec(sec),
    .min(min)
);
// BCD split
bcd_split u3 (
    .sec(sec),
    .min(min),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3)
);

// 7-seg display
seven_seg_mux u4 (
    .clk(clk),
    .d0(d0),
    .d1(d1),
    .d2(d2),
    .d3(d3),
    .seg(seg),
    .an(an)
);
endmodule
