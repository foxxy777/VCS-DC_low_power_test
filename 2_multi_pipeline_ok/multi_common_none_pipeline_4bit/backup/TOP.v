`timescale 1 ns/1 ps

module TOP(clk, x, y, result,rst);
input clk;
input [7:0] x, y;
output [15:0] result;
reg [15:0] result;
parameter s0 = 0, s1 = 1, s2 = 2;
reg [2:0] count = 0;
reg [1:0] state = 0;
reg [15:0] P, T;
reg [7:0] y_reg;
always @(posedge clk) begin
    case (state)
        s0: begin
            count <= 0;
            P <= 0;
            y_reg <= y;
            T <= {{8{1'b0}}, x};
            state <= s1;
        end
        s1: begin
            if(count == 3'b111)
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
