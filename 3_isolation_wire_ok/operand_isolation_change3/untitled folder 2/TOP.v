`timescale 1 ns/ 1 ps
module TOP(a,b,clk,rst,sel1,sel2,sel3,sel4,out);
input [3:0] a,b;
input clk;
input rst,sel1,sel2,sel3,sel4;
output [7:0] out;
reg [7:0] out;

always @(posedge clk or negedge rst)
begin
    if (!rst)
    begin
        out <= 8'b0;
    end
    else
    begin
        casex({sel1,sel2,sel3,sel4})
            4'b1xxx:out<=a*b;
            4'b01xx:out<=a+b;
            4'b001x:out<=a/b;
            4'b0001:out<=a-b;
            default:out<=0;
        endcase
        end
    end

    endmodule
