`timescale 1 ns/1 ps

module Testbench();

//clock & reset
reg clk_tb;
reg rst_tb;

//input signals TO DUT
reg [3:0]       mul_a_tb  ;
reg [3:0]       mul_b_tb  ;

//ouput signals FROM DUT
reg [7:0] mul_out_tb;

//clock period
parameter CLK_PERIOD    = 60;

//reset time 
parameter RST_TIME = 10000 ;

//instance of DUT 
TOP top_instance(
    .clk         (clk_tb     ), 
    .rst_n      (rst_tb     ),
    .mul_a         (mul_a_tb    ),
    .mul_b         (mul_b_tb    ),
    .mul_out (mul_out_tb)  
);


//create clock 50M
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
    mul_a_tb = 0;
    mul_b_tb = 0;
    #60 mul_a_tb = 1;mul_b_tb = 9;
    #60 mul_a_tb = 2;mul_b_tb = 8;
    #60 mul_a_tb = 3;mul_b_tb = 7;
    #60 mul_a_tb = 4;mul_b_tb = 6;
    #60 mul_a_tb = 5;mul_b_tb = 5;
    #60 mul_a_tb = 6;mul_b_tb = 4;
    #60 mul_a_tb = 7;mul_b_tb = 3;
    #60 mul_a_tb = 8;mul_b_tb = 2;
    #60 mul_a_tb = 9;mul_b_tb = 1;
    #225 

    $toggle_stop;
    $toggle_report("backward_rtl.saif",1.0e-9,"top_instance");

    $stop;
    $finish;
end

endmodule

