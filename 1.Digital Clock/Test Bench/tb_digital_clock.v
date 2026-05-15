`timescale 1ns/1ps

module tb_digital_clock;
reg clk;
reg rst;
wire [6:0] seg;
wire [3:0] an;
wire [5:0] sec;
wire [5:0] min;
wire [3:0] digit = dut.u4.digit;
wire [1:0] sel   = dut.u4.sel;

// DUT (NO tick_1s port)
digitalclock_top dut (
    .clk(clk),
    .rst(rst),
    .seg(seg),
    .an(an)
);
//  Tap internal signals for waveform
assign sec = dut.sec;
assign min = dut.min;

// Clock (100 MHz ? 10ns)
always #5 clk = ~clk;

initial begin
    #30;

    force dut.tick_1s = 0;
    forever begin
        #50  force dut.tick_1s = 1;  
        #10  force dut.tick_1s = 0;
    end
end

initial begin
    clk = 0;
    rst = 1;
    #20;
    rst = 0;

    #10000;

    $finish;
end
  initial begin
    $monitor("clk=%b sel=%d digit=%d seg=%d", clk, dut.u4.sel, dut.u4.digit, seg);
end

initial begin
    $monitor("Time=%0t | MIN=%0d SEC=%0d", $time, min, sec);
  
end

endmodule
