/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12-SP5
// Date      : Sun Nov 17 14:39:25 2019
/////////////////////////////////////////////////////////////


module SNPS_CLOCK_GATE_HIGH_TOP ( CLK, EN, ENCLK );
  input CLK, EN;
  output ENCLK;
  wire   net7, net9, net10, net13;
  assign net7 = CLK;
  assign ENCLK = net9;
  assign net10 = EN;

  TLATNX2 latch ( .D(net10), .GN(net7), .Q(net13) );
  CLKAND2X4 main_gate ( .A(net13), .B(net7), .Y(net9) );
endmodule


module TOP_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  XOR2X1 U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1 U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module TOP ( clk, rst, increase, count );
  output [7:0] count;
  input clk, rst, increase;
  wire   n13, n14, n15, n16, n17, n18, n19, n20, N2, N3, N4, N5, N6, N7, N8,
         N9, net19, n1, n2, n11, n12;

  SNPS_CLOCK_GATE_HIGH_TOP clk_gate_count_reg ( .CLK(clk), .EN(increase), 
        .ENCLK(net19) );
  TOP_DW01_inc_0 add_23 ( .A({count[7:1], n12}), .SUM({N9, N8, N7, N6, N5, N4, 
        N3, N2}) );
  DFFRHQX2 \count_reg[6]  ( .D(N8), .CK(net19), .RN(n2), .Q(n14) );
  DFFRHQX2 \count_reg[5]  ( .D(N7), .CK(net19), .RN(n2), .Q(n15) );
  DFFRHQX2 \count_reg[4]  ( .D(N6), .CK(net19), .RN(n2), .Q(n16) );
  DFFRHQX2 \count_reg[3]  ( .D(N5), .CK(net19), .RN(n2), .Q(n17) );
  DFFRHQX2 \count_reg[2]  ( .D(N4), .CK(net19), .RN(n2), .Q(n18) );
  DFFRHQX2 \count_reg[1]  ( .D(N3), .CK(net19), .RN(n2), .Q(n19) );
  DFFRHQX2 \count_reg[7]  ( .D(N9), .CK(net19), .RN(n2), .Q(n13) );
  DFFRHQX2 \count_reg[0]  ( .D(N2), .CK(net19), .RN(n2), .Q(n20) );
  INVX2 U3 ( .A(rst), .Y(n1) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  CLKBUFX20 U5 ( .A(n20), .Y(count[0]) );
  CLKBUFX20 U6 ( .A(n13), .Y(count[7]) );
  CLKBUFX20 U7 ( .A(n19), .Y(count[1]) );
  CLKBUFX20 U8 ( .A(n18), .Y(count[2]) );
  CLKBUFX20 U9 ( .A(n17), .Y(count[3]) );
  CLKBUFX20 U10 ( .A(n16), .Y(count[4]) );
  CLKBUFX20 U11 ( .A(n15), .Y(count[5]) );
  CLKBUFX20 U12 ( .A(n14), .Y(count[6]) );
  INVXL U13 ( .A(count[0]), .Y(n11) );
  INVX2 U14 ( .A(n11), .Y(n12) );
endmodule

