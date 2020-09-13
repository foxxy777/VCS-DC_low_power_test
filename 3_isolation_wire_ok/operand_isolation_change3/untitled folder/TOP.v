`timescale 1 ns/ 1 ps
module TOP(a,b,clk,rst,sel1,sel2,sel3,sel4,out);
input [3:0] a,b;
input clk;
input rst,sel1,sel2,sel3,sel4;
output [7:0] out;
reg [7:0] out;

reg [7:0] muxmul,muxadd,muxdiv,muxmin;

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
    muxmul <= a*b;
    muxadd <= a+b;
    muxdiv <= a/b;
    muxmin <= a-b;
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
            4'b1000:out<=muxmul;
            4'b0100:out<=muxadd;
            4'b0010:out<=muxdiv;
            4'b0001:out<=muxmin;
            default:out<=0;
        endcase
        end
    end

    endmodule
