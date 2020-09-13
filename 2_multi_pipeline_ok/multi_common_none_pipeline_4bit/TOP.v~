`timescale 1 ns/1 ps

module TOP(clk, x, y, result,rst);
input clk,rst;
input [3:0] x, y;
output [7:0] result;
reg [7:0] result;
parameter s0 = 0, s1 = 1, s2 = 2;
reg [2:0] count = 0;
reg [1:0] state = 0;
reg [7:0] P, T;
reg [3:0] y_reg;
always @(posedge clk)
begin
    if(!rst)
    begin
        result <= 0 ;
    end
    case (state)
        s0: begin
            count <= 0;
            P <= 0;
            y_reg <= y;
            T <= {{8{1'b0}}, x};
            state <= s1;
        end
        s1: begin
            if(count == 3'b100)
            state <= s2;
            else begin
                if(y_reg[0] == 1'b1)
                P <= P + T;
                else
                P <= P;
                y_reg <= y_reg >> 1;
                T <= T << 1;
                count <= count + 1;
                state <= s1;
            end
        end
        s2: begin
            result <= P;
            state <= s0;
        end
        default: ;
    endcase
end
endmodule
