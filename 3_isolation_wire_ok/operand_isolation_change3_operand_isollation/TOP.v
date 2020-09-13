`timescale 1 ns/ 1 ps
module TOP(a,b,clk,rst,sel1,sel2,sel3,sel4,out);
input [3:0] a,b;
input clk;
input rst,sel1,sel2,sel3,sel4;
output [7:0] out;
reg [7:0] out;

wire [3:0] a_1,b_1,a_2,b_2,a_3,b_3,a_4,b_4;

assign a_1 =  (sel1==1'b1)? a:0;
assign b_1 =  (sel1==1'b1)? b:0;
assign a_2 =  (sel1==0 && sel2==1'b1)? a:0;
assign b_2 =  (sel1==0 && sel2==1'b1)? b:0;
assign a_3 =  (sel1==0 && sel2==0 && sel3==1'b1)? a:0;
assign b_3 =  (sel1==0 && sel2==0 && sel3==1'b1)? b:0;
assign a_4 =  (sel1==0 && sel2==0 && sel3==0 && sel4==1'b1)?a:0;
assign b_4 =  (sel1==0 && sel2==0 && sel3==0 && sel4==1'b1)?b:0;



always @(posedge clk or negedge rst)
begin
    if (!rst)
    begin
        out <= 8'b0;
    end
    else
    begin
        casex({sel1,sel2,sel3,sel4})
            4'b1xxx:out<=a_1*b_1;
            4'b01xx:out<=a_2+b_2;
            4'b001x:out<=a_3/b_3;
            4'b0001:out<=a_4-b_4;
            default:out<=0;
        endcase
        end
    end

    endmodule
