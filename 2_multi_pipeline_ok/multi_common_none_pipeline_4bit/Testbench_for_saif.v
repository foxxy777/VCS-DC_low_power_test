`timescale 1 ns/1 ps

module Testbench();

//clock & reset
reg clk_tb;
reg rst_tb;

//input signals TO DUT
reg [3:0]       x_tb  ;
reg [3:0]       y_tb  ;

//ouput signals FROM DUT
reg [7:0] result_tb;

//clock period
parameter CLK_PERIOD    = 10;

//reset time 
parameter RST_TIME = 1000 ;

//instance of DUT 
TOP top_instance(
    .clk         (clk_tb     ), 
    .rst      (rst_tb     ),
    .x         (x_tb    ),
    .y         (y_tb    ),
    .result (result_tb)  
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

     x_tb = 0; y_tb = 0;
    #70 x_tb = 1;y_tb = 9;
    #70 x_tb = 2;y_tb = 8;
    #70 x_tb = 3;y_tb = 7;
    #70 x_tb = 4;y_tb = 6;
    #70 x_tb = 5;y_tb = 5;
    #70 x_tb = 6;y_tb = 4;
    #70 x_tb = 7;y_tb = 3;
    #70 x_tb = 8;y_tb = 2;
    #70 x_tb = 9;y_tb = 1;
    #135 

    $toggle_stop;
    $toggle_report("backward_rtl.saif",1.0e-9,"top_instance");

    $stop;
    $finish;
end

endmodule

