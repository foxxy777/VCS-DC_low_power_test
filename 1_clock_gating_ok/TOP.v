`timescale 1 ns/ 1 ps

module TOP(clk,rst,increase,count);
input clk;
input rst;
/*input signals*/
input increase;
/*output signals*/
output [7:0] count;


/*define intermediate signals*/
reg [7:0] count;

always  @(posedge clk or negedge rst)
begin
    if(!rst)
         begin
             count <=  3'b0;
         end
    else if(increase)
         begin
             count <=  count+1;
         end
end

endmodule

