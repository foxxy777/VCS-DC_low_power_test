/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12-SP5
// Date      : Sun Nov 17 14:44:03 2019
/////////////////////////////////////////////////////////////


module TOP_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;

  wire   [7:1] carry;

  ADDFX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX1 U1_1 ( .A(A[1]), .B(1'b0), .CI(1'b0), .S(SUM[1]) );
  XOR3XL U1_7 ( .A(1'b0), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  ADDFX1 U1_6 ( .A(1'b0), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(1'b0), .CO(carry[3]), .S(SUM[2]) );
  XOR2X1 U1 ( .A(1'b0), .B(A[0]), .Y(SUM[0]) );
endmodule


module TOP ( mul_a, mul_b, clk, rst_n, mul_out );
  input [3:0] mul_a;
  input [3:0] mul_b;
  output [7:0] mul_out;
  input clk, rst_n;
  wire   n36, n37, n38, n39, n40, n41, n42, n43, N6, N7, N8, N9, N11, N12, N13,
         N14, N16, N17, N18, N19, N21, N22, N23, N24, N25, N26, N27, N28, N29,
         N30, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47,
         N48, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35;
  wire   [7:0] add23;
  wire   [7:0] add01;
  wire   [7:0] stored3;
  wire   [7:0] stored2;
  wire   [7:0] stored1;
  wire   [7:0] stored0;
  wire   [7:1] \add_38/carry ;
  wire   [7:1] \add_37/carry ;

  TOP_DW01_add_0 add_40 ( .A({1'b0, 1'b0, add01[5:0]}), .B({add23[7:2], 1'b0, 
        1'b0}), .CI(1'b0), .SUM({N48, N47, N46, N45, N44, N43, N42, N41}) );
  DFFRQX2 \stored3_reg[5]  ( .D(N23), .CK(n25), .RN(n23), .Q(stored3[5]) );
  DFFRQX2 \stored3_reg[4]  ( .D(N22), .CK(n25), .RN(n23), .Q(stored3[4]) );
  DFFRQX2 \stored1_reg[3]  ( .D(N13), .CK(n25), .RN(n23), .Q(stored1[3]) );
  DFFRQX2 \stored1_reg[2]  ( .D(N12), .CK(n25), .RN(n23), .Q(stored1[2]) );
  DFFRQX2 \add01_reg[5]  ( .D(N30), .CK(n27), .RN(n24), .Q(add01[5]) );
  DFFRQX2 \add01_reg[4]  ( .D(N29), .CK(n27), .RN(n23), .Q(add01[4]) );
  DFFRQX2 \add01_reg[3]  ( .D(N28), .CK(n27), .RN(n24), .Q(add01[3]) );
  DFFRQX2 \add01_reg[2]  ( .D(N27), .CK(n27), .RN(rst_n), .Q(add01[2]) );
  DFFRQX2 \add01_reg[1]  ( .D(N26), .CK(n27), .RN(rst_n), .Q(add01[1]) );
  DFFRQX2 \add01_reg[0]  ( .D(N25), .CK(n27), .RN(rst_n), .Q(add01[0]) );
  DFFRQX2 \stored3_reg[3]  ( .D(N21), .CK(n25), .RN(n23), .Q(stored3[3]) );
  DFFRQX2 \stored1_reg[1]  ( .D(N11), .CK(n25), .RN(n23), .Q(stored1[1]) );
  DFFRQX2 \stored3_reg[6]  ( .D(N24), .CK(n25), .RN(n23), .Q(stored3[6]) );
  DFFRQX2 \stored1_reg[4]  ( .D(N14), .CK(n25), .RN(n23), .Q(stored1[4]) );
  DFFRQX2 \stored2_reg[3]  ( .D(N17), .CK(n25), .RN(n23), .Q(stored2[3]) );
  DFFRQX2 \stored0_reg[1]  ( .D(N7), .CK(n26), .RN(n24), .Q(stored0[1]) );
  DFFRQX2 \stored2_reg[5]  ( .D(N19), .CK(n25), .RN(n23), .Q(stored2[5]) );
  DFFRQX2 \stored2_reg[4]  ( .D(N18), .CK(n25), .RN(n23), .Q(stored2[4]) );
  DFFRQX2 \stored0_reg[3]  ( .D(N9), .CK(n26), .RN(n24), .Q(stored0[3]) );
  DFFRQX2 \stored0_reg[2]  ( .D(N8), .CK(n26), .RN(n24), .Q(stored0[2]) );
  DFFRQX2 \add23_reg[7]  ( .D(N40), .CK(n26), .RN(n24), .Q(add23[7]) );
  DFFRQX2 \add23_reg[6]  ( .D(N39), .CK(n26), .RN(n24), .Q(add23[6]) );
  DFFRQX2 \add23_reg[5]  ( .D(N38), .CK(n26), .RN(n24), .Q(add23[5]) );
  DFFRQX2 \add23_reg[4]  ( .D(N37), .CK(n26), .RN(n24), .Q(add23[4]) );
  DFFRQX2 \add23_reg[3]  ( .D(N36), .CK(n26), .RN(n24), .Q(add23[3]) );
  DFFRQX2 \add23_reg[2]  ( .D(N35), .CK(n26), .RN(n24), .Q(add23[2]) );
  DFFRQX2 \stored2_reg[2]  ( .D(N16), .CK(n25), .RN(n23), .Q(N35) );
  DFFRQX2 \stored0_reg[0]  ( .D(N6), .CK(n26), .RN(n24), .Q(N25) );
  DFFRHQX2 \mul_out_reg[3]  ( .D(N44), .CK(n27), .RN(n23), .Q(n40) );
  DFFRHQX2 \mul_out_reg[2]  ( .D(N43), .CK(n27), .RN(n24), .Q(n41) );
  DFFRHQX2 \mul_out_reg[1]  ( .D(N42), .CK(n27), .RN(n24), .Q(n42) );
  DFFRHQX2 \mul_out_reg[0]  ( .D(N41), .CK(n27), .RN(n24), .Q(n43) );
  DFFRHQX2 \mul_out_reg[7]  ( .D(N48), .CK(n25), .RN(n24), .Q(n36) );
  DFFRHQX2 \mul_out_reg[6]  ( .D(N47), .CK(n26), .RN(n23), .Q(n37) );
  DFFRHQX2 \mul_out_reg[5]  ( .D(N46), .CK(clk), .RN(n24), .Q(n38) );
  DFFRHQX2 \mul_out_reg[4]  ( .D(N45), .CK(clk), .RN(n23), .Q(n39) );
  CLKBUFX4 U46 ( .A(rst_n), .Y(n23) );
  BUFX5 U47 ( .A(clk), .Y(n25) );
  CLKBUFX4 U48 ( .A(rst_n), .Y(n24) );
  CLKBUFX4 U49 ( .A(clk), .Y(n26) );
  CLKBUFX4 U50 ( .A(clk), .Y(n27) );
  NOR2X2 U51 ( .A(n28), .B(n35), .Y(N9) );
  NOR2X2 U52 ( .A(n28), .B(n33), .Y(N19) );
  NOR2X2 U53 ( .A(n28), .B(n34), .Y(N14) );
  NOR2X2 U54 ( .A(n28), .B(n32), .Y(N24) );
  NOR2X2 U55 ( .A(n35), .B(n31), .Y(N6) );
  NOR2X2 U56 ( .A(n35), .B(n30), .Y(N7) );
  NOR2X2 U57 ( .A(n35), .B(n29), .Y(N8) );
  NOR2X2 U58 ( .A(n31), .B(n33), .Y(N16) );
  NOR2X2 U59 ( .A(n30), .B(n33), .Y(N17) );
  NOR2X2 U60 ( .A(n29), .B(n33), .Y(N18) );
  NOR2X2 U61 ( .A(n31), .B(n34), .Y(N11) );
  NOR2X2 U62 ( .A(n30), .B(n34), .Y(N12) );
  NOR2X2 U63 ( .A(n29), .B(n34), .Y(N13) );
  NOR2X2 U64 ( .A(n31), .B(n32), .Y(N21) );
  NOR2X2 U65 ( .A(n30), .B(n32), .Y(N22) );
  NOR2X2 U66 ( .A(n29), .B(n32), .Y(N23) );
  INVX2 U67 ( .A(mul_a[3]), .Y(n28) );
  INVX2 U68 ( .A(mul_b[0]), .Y(n35) );
  INVX2 U69 ( .A(mul_a[0]), .Y(n31) );
  INVX2 U70 ( .A(mul_a[1]), .Y(n30) );
  INVX2 U71 ( .A(mul_a[2]), .Y(n29) );
  INVX2 U72 ( .A(mul_b[2]), .Y(n33) );
  INVX2 U73 ( .A(mul_b[1]), .Y(n34) );
  INVX2 U74 ( .A(mul_b[3]), .Y(n32) );
  ADDFX1 U75 ( .A(stored1[3]), .B(stored0[3]), .CI(\add_37/carry [3]), .CO(
        \add_37/carry [4]), .S(N28) );
  ADDFX1 U76 ( .A(stored3[5]), .B(stored2[5]), .CI(\add_38/carry [5]), .CO(
        \add_38/carry [6]), .S(N38) );
  ADDFX1 U77 ( .A(stored1[2]), .B(stored0[2]), .CI(\add_37/carry [2]), .CO(
        \add_37/carry [3]), .S(N27) );
  ADDFX1 U78 ( .A(stored3[4]), .B(stored2[4]), .CI(\add_38/carry [4]), .CO(
        \add_38/carry [5]), .S(N37) );
  CLKBUFX20 U83 ( .A(n39), .Y(mul_out[4]) );
  CLKBUFX20 U84 ( .A(n38), .Y(mul_out[5]) );
  CLKBUFX20 U85 ( .A(n37), .Y(mul_out[6]) );
  CLKBUFX20 U86 ( .A(n36), .Y(mul_out[7]) );
  CLKBUFX20 U87 ( .A(n43), .Y(mul_out[0]) );
  CLKBUFX20 U88 ( .A(n42), .Y(mul_out[1]) );
  CLKBUFX20 U89 ( .A(n41), .Y(mul_out[2]) );
  CLKBUFX20 U90 ( .A(n40), .Y(mul_out[3]) );
  AND2X1 U91 ( .A(\add_37/carry [4]), .B(stored1[4]), .Y(N30) );
  XOR2X1 U92 ( .A(stored1[4]), .B(\add_37/carry [4]), .Y(N29) );
  AND2X1 U93 ( .A(stored1[1]), .B(stored0[1]), .Y(\add_37/carry [2]) );
  XOR2X1 U94 ( .A(stored0[1]), .B(stored1[1]), .Y(N26) );
  AND2X1 U95 ( .A(\add_38/carry [6]), .B(stored3[6]), .Y(N40) );
  XOR2X1 U96 ( .A(stored3[6]), .B(\add_38/carry [6]), .Y(N39) );
  AND2X1 U97 ( .A(stored3[3]), .B(stored2[3]), .Y(\add_38/carry [4]) );
  XOR2X1 U98 ( .A(stored2[3]), .B(stored3[3]), .Y(N36) );
endmodule

