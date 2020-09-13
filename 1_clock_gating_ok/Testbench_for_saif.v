`timescale 1 ns/1 ps

module Testbench();

//clock & reset
reg clk_tb;
reg rst_tb;

reg [2:0]       increase_tb  ;
reg [7:0]       count_tb;      

parameter CLK_PERIOD = 10;
parameter RST_TIME= 1000;

TOP top_instance(
    .clk(clk_tb),
    .rst(rst_tb),
    .increase(increase_tb),
    .count(count_tb)
    );


initial
begin
    $set_toggle_region (top_instance);
    $toggle_start;
    clk_tb = 0;
    forever
    #(CLK_PERIOD/2)
    clk_tb=~clk_tb;
end

//set reset signal for first time
initial
begin
    rst_tb = 0;
    #2;
    rst_tb = 1;
    #(CLK_PERIOD*RST_TIME);
    rst_tb = 0;
end

//change of din0
initial
begin
    increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 increase_tb = 0;
    #10 increase_tb = 1;
    #10 

   $toggle_stop;
   $toggle_report("backward_rtl.saif",1.0e-9,"top_instance");

    $stop;
    $finish;
end

endmodule

