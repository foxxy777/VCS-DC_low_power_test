`timescale 1 ns/ 1 ps
module TOP(a,b,clk,rst,sel1,sel2,sel3,sel4,out);
input [3:0] a,b;
input clk;
input rst,sel1,sel2,sel3,sel4;
output [7:0] out;
reg [7:0] out;

reg [7:0] muxmul,muxadd,muxdiv,muxmin;

wire [3:0] a_1,b_1,a_2,b_2,a_3,b_3,a_4,b_4;

assign a_1 =  sel1? a:0;
assign b_1 =  sel1? b:0;
assign a_2 =  sel2? a:0;
assign b_2 =  sel2? b:0;
assign a_3 =  sel3? a:0;
assign b_3 =  sel3? b:0;
assign a_4 =  sel4? a:0;
assign b_4 =  sel4? b:0;





always @(posedge clk or negedge rst)
begin
    if (!rst)
    begin
        muxmul <= 0; 
        muxadd <= 0;
        muxdiv <= 0;
        muxmin <= 0;
    end
    else 
    begin
    muxmul <= a_1*b_1;
    muxadd <= a_2+b_2;
    muxdiv <= a_3/b_3;
    muxmin <= a_4-b_4;
end
end

always @(posedge clk or negedge rst)
begin
    if (!rst)
    begin
        out <= 8'b0;
    end
    else
    begin
        casex({sel1,sel2,sel3,sel4})
            4'b1xxx:out<=muxmul;
            4'b01xx:out<=muxadd;
            4'b001x:out<=muxdiv;
            4'b0001:out<=muxmin;
            default:out<=0;
        endcase
        end
    end

    endmodule
