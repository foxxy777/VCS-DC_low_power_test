`timescale 1 ns/1 ps

module Testbench();

//clock & reset
reg clk_tb;
reg rst_tb;

reg [3:0] a_tb;
reg [3:0] b_tb;

reg      sel1_tb;
reg      sel2_tb;
reg      sel3_tb;
reg      sel4_tb;
reg [7:0]       out_tb;      



parameter CLK_PERIOD = 10;
parameter RST_TIME= 1000;

TOP top_instance(
    .clk(clk_tb),
    .rst(rst_tb),
    .a(a_tb),
    .b(b_tb),
    .sel1(sel1_tb),
    .sel2(sel2_tb),
    .sel3(sel3_tb),
    .sel4(sel4_tb),
    .out(out_tb)
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
    a_tb=8;b_tb=2;
    #20 sel1_tb=1;sel2_tb=0;sel3_tb=0;sel4_tb=0;
    #20 sel1_tb=1;sel2_tb=1;sel3_tb=0;sel4_tb=0;
    #20 sel1_tb=1;sel2_tb=0;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=1;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=1;sel2_tb=1;sel3_tb=0;sel4_tb=0;
    #20 sel1_tb=1;sel2_tb=0;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=1;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=1;sel2_tb=1;sel3_tb=0;sel4_tb=0;
    #20 sel1_tb=1;sel2_tb=0;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=1;sel2_tb=0;sel3_tb=0;sel4_tb=1;
   
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=0;sel2_tb=1;sel3_tb=0;sel4_tb=1;
  
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=0;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=1;sel4_tb=0;
   
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
    #20 sel1_tb=0;sel2_tb=0;sel3_tb=0;sel4_tb=1;
  
  
    
    
    #10 

    $toggle_stop;
    $toggle_report("backward_rtl.saif",1.0e-9,"top_instance");

    $stop;
    $finish;
end

endmodule

