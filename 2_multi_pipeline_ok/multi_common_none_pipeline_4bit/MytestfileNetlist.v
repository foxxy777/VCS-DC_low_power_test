/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12-SP5
// Date      : Sun Nov 17 14:42:41 2019
/////////////////////////////////////////////////////////////


module TOP_DW01_add_0 ( A, B, CI, SUM, CO );
  input [7:0] A;
  input [7:0] B;
  output [7:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:1] carry;

  ADDFX1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  ADDFX1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  XOR3XL U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .Y(SUM[7]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module TOP ( clk, x, y, result, rst );
  input [3:0] x;
  input [3:0] y;
  output [7:0] result;
  input clk, rst;
  wire   n117, n118, n119, n120, n121, n122, n123, n124, N17, N18, N19, N20,
         N21, N22, N23, N24, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45,
         n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59,
         n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115;
  wire   [1:0] state;
  wire   [2:0] count;
  wire   [7:0] P;
  wire   [7:0] T;
  wire   [3:0] y_reg;

  TOP_DW01_add_0 add_32_aco ( .A(P), .B({n79, n78, n77, n76, n75, n74, n72, 
        n73}), .CI(1'b0), .SUM({N24, N23, N22, N21, N20, N19, N18, N17}) );
  DFFQXL \T_reg[7]  ( .D(n57), .CK(n96), .Q(T[7]) );
  DFFQXL \y_reg_reg[2]  ( .D(n65), .CK(n94), .Q(y_reg[2]) );
  DFFQXL \y_reg_reg[1]  ( .D(n66), .CK(n94), .Q(y_reg[1]) );
  DFFQXL \y_reg_reg[3]  ( .D(n68), .CK(n94), .Q(y_reg[3]) );
  DFFQX2 \T_reg[1]  ( .D(n62), .CK(n94), .Q(T[1]) );
  DFFQX2 \T_reg[2]  ( .D(n61), .CK(n94), .Q(T[2]) );
  DFFQX2 \T_reg[0]  ( .D(n63), .CK(n94), .Q(T[0]) );
  DFFQX2 \count_reg[2]  ( .D(n70), .CK(n94), .Q(count[2]) );
  DFFQX2 \count_reg[0]  ( .D(n56), .CK(n96), .Q(count[0]) );
  DFFQX2 \P_reg[0]  ( .D(n54), .CK(n96), .Q(P[0]) );
  DFFQX2 \state_reg[1]  ( .D(n69), .CK(n94), .Q(state[1]) );
  DFFQX2 \count_reg[1]  ( .D(n55), .CK(n96), .Q(count[1]) );
  DFFQXL \T_reg[3]  ( .D(n60), .CK(n94), .Q(T[3]) );
  DFFQXL \P_reg[7]  ( .D(n47), .CK(n94), .Q(P[7]) );
  DFFQXL \y_reg_reg[0]  ( .D(n67), .CK(n94), .Q(y_reg[0]) );
  DFFQXL \T_reg[4]  ( .D(n59), .CK(n96), .Q(T[4]) );
  DFFQXL \T_reg[5]  ( .D(n58), .CK(n96), .Q(T[5]) );
  DFFQXL \T_reg[6]  ( .D(n64), .CK(n96), .Q(T[6]) );
  DFFQXL \P_reg[6]  ( .D(n48), .CK(n95), .Q(P[6]) );
  DFFQXL \P_reg[5]  ( .D(n49), .CK(n95), .Q(P[5]) );
  DFFQXL \P_reg[4]  ( .D(n50), .CK(n95), .Q(P[4]) );
  DFFQXL \P_reg[3]  ( .D(n51), .CK(n95), .Q(P[3]) );
  DFFQXL \P_reg[2]  ( .D(n52), .CK(n95), .Q(P[2]) );
  DFFQXL \P_reg[1]  ( .D(n53), .CK(n95), .Q(P[1]) );
  DFFQXL \state_reg[0]  ( .D(n71), .CK(n94), .Q(state[0]) );
  DFFHQX2 \result_reg[1]  ( .D(n45), .CK(n96), .Q(n123) );
  DFFHQX2 \result_reg[0]  ( .D(n46), .CK(n96), .Q(n124) );
  DFFHQX2 \result_reg[7]  ( .D(n39), .CK(n95), .Q(n117) );
  DFFHQX2 \result_reg[6]  ( .D(n40), .CK(n95), .Q(n118) );
  DFFHQX2 \result_reg[5]  ( .D(n41), .CK(n95), .Q(n119) );
  DFFHQX2 \result_reg[4]  ( .D(n42), .CK(n95), .Q(n120) );
  DFFHQX2 \result_reg[3]  ( .D(n43), .CK(n95), .Q(n121) );
  DFFHQX2 \result_reg[2]  ( .D(n44), .CK(n95), .Q(n122) );
  AND2X2 U72 ( .A(T[1]), .B(n89), .Y(n72) );
  AND2X2 U73 ( .A(T[0]), .B(n89), .Y(n73) );
  AND2X2 U74 ( .A(T[2]), .B(n89), .Y(n74) );
  AND2X2 U75 ( .A(T[3]), .B(n89), .Y(n75) );
  AND2X2 U76 ( .A(T[4]), .B(n89), .Y(n76) );
  AND2X2 U77 ( .A(T[5]), .B(n89), .Y(n77) );
  AND2X2 U78 ( .A(T[6]), .B(n89), .Y(n78) );
  AND2X2 U79 ( .A(n89), .B(T[7]), .Y(n79) );
  OAI2B2XL U80 ( .A1N(result[0]), .A0(n22), .B0(n92), .B1(n110), .Y(n46) );
  OAI2B2XL U81 ( .A1N(result[1]), .A0(n22), .B0(n92), .B1(n109), .Y(n45) );
  OAI2B2XL U82 ( .A1N(result[4]), .A0(n22), .B0(n92), .B1(n106), .Y(n42) );
  OAI2B2XL U83 ( .A1N(result[5]), .A0(n22), .B0(n92), .B1(n105), .Y(n41) );
  OAI2B2XL U84 ( .A1N(result[6]), .A0(n22), .B0(n92), .B1(n104), .Y(n40) );
  OAI2B2XL U85 ( .A1N(result[7]), .A0(n22), .B0(n92), .B1(n103), .Y(n39) );
  OAI2B2XL U86 ( .A1N(result[2]), .A0(n22), .B0(n92), .B1(n108), .Y(n44) );
  OAI2B2XL U87 ( .A1N(result[3]), .A0(n22), .B0(n92), .B1(n107), .Y(n43) );
  NAND2X2 U88 ( .A(rst), .B(n92), .Y(n22) );
  NOR2X2 U89 ( .A(n100), .B(state[1]), .Y(n38) );
  NAND3XL U90 ( .A(n111), .B(n112), .C(count[2]), .Y(n34) );
  INVX2 U91 ( .A(n93), .Y(n98) );
  INVX4 U92 ( .A(n91), .Y(n99) );
  BUFX5 U93 ( .A(clk), .Y(n94) );
  NAND2X2 U94 ( .A(n91), .B(n35), .Y(n71) );
  BUFX5 U95 ( .A(clk), .Y(n95) );
  NAND3BX2 U96 ( .AN(n90), .B(n92), .C(n97), .Y(n35) );
  OAI2B2X1 U97 ( .A1N(N18), .A0(n93), .B0(n109), .B1(n99), .Y(n53) );
  OAI2B2X1 U98 ( .A1N(N19), .A0(n93), .B0(n108), .B1(n99), .Y(n52) );
  OAI2B2X1 U99 ( .A1N(N20), .A0(n93), .B0(n107), .B1(n99), .Y(n51) );
  OAI2B2X1 U100 ( .A1N(N21), .A0(n93), .B0(n106), .B1(n99), .Y(n50) );
  OAI2B2X1 U101 ( .A1N(N22), .A0(n93), .B0(n105), .B1(n99), .Y(n49) );
  OAI2B2X1 U102 ( .A1N(N23), .A0(n93), .B0(n104), .B1(n99), .Y(n48) );
  OAI22X1 U103 ( .A0(n99), .A1(n115), .B0(n93), .B1(n114), .Y(n64) );
  OAI22X1 U104 ( .A0(n99), .A1(n114), .B0(n93), .B1(n113), .Y(n58) );
  OAI22X1 U105 ( .A0(n99), .A1(n113), .B0(n93), .B1(n102), .Y(n59) );
  AOI21X1 U106 ( .A0(n111), .A1(n38), .B0(n91), .Y(n25) );
  INVX2 U107 ( .A(n38), .Y(n97) );
  CLKBUFX4 U108 ( .A(n24), .Y(n93) );
  NAND2X2 U109 ( .A(n38), .B(n99), .Y(n24) );
  OAI21X1 U110 ( .A0(n97), .A1(n34), .B0(n35), .Y(n69) );
  CLKBUFX4 U111 ( .A(n26), .Y(n91) );
  AOI21X1 U112 ( .A0(n34), .A1(n38), .B0(n90), .Y(n26) );
  CLKBUFX4 U113 ( .A(clk), .Y(n96) );
  INVX2 U114 ( .A(n88), .Y(n89) );
  OAI32XL U115 ( .A0(n36), .A1(count[2]), .A2(n93), .B0(n37), .B1(n101), .Y(
        n70) );
  INVX2 U116 ( .A(count[2]), .Y(n101) );
  NAND2X2 U117 ( .A(count[1]), .B(count[0]), .Y(n36) );
  OA21X1 U118 ( .A0(n97), .A1(count[1]), .B0(n25), .Y(n37) );
  OAI32XL U119 ( .A0(n111), .A1(count[1]), .A2(n93), .B0(n25), .B1(n112), .Y(
        n55) );
  OAI2B2X1 U120 ( .A1N(N17), .A0(n93), .B0(n110), .B1(n99), .Y(n54) );
  OAI2B2X1 U121 ( .A1N(N24), .A0(n93), .B0(n103), .B1(n99), .Y(n47) );
  OAI22X1 U122 ( .A0(n99), .A1(n111), .B0(count[0]), .B1(n93), .Y(n56) );
  OAI2BB2X2 U123 ( .B0(n93), .B1(n115), .A0N(T[7]), .A1N(n91), .Y(n57) );
  INVX2 U124 ( .A(count[0]), .Y(n111) );
  OAI21X1 U125 ( .A0(n99), .A1(n102), .B0(n27), .Y(n60) );
  AOI22XL U126 ( .A0(x[3]), .A1(n90), .B0(T[2]), .B1(n98), .Y(n27) );
  INVX2 U127 ( .A(state[0]), .Y(n100) );
  INVX2 U128 ( .A(count[1]), .Y(n112) );
  INVX2 U129 ( .A(P[0]), .Y(n110) );
  INVX2 U130 ( .A(T[3]), .Y(n102) );
  CLKBUFX4 U131 ( .A(n23), .Y(n92) );
  NAND2X2 U132 ( .A(state[1]), .B(n100), .Y(n23) );
  CLKBUFX4 U133 ( .A(n28), .Y(n90) );
  NOR2X2 U134 ( .A(state[0]), .B(state[1]), .Y(n28) );
  OAI2BB1X1 U135 ( .A0N(y_reg[0]), .A1N(n91), .B0(n33), .Y(n67) );
  AOI22XL U136 ( .A0(y[0]), .A1(n90), .B0(y_reg[1]), .B1(n98), .Y(n33) );
  OAI2BB1X1 U137 ( .A0N(n91), .A1N(y_reg[1]), .B0(n32), .Y(n66) );
  AOI22XL U138 ( .A0(y[1]), .A1(n90), .B0(y_reg[2]), .B1(n98), .Y(n32) );
  OAI2BB1X1 U139 ( .A0N(n91), .A1N(y_reg[2]), .B0(n31), .Y(n65) );
  AOI22XL U140 ( .A0(y[2]), .A1(n90), .B0(y_reg[3]), .B1(n98), .Y(n31) );
  OAI2BB1X1 U141 ( .A0N(n91), .A1N(T[2]), .B0(n29), .Y(n61) );
  AOI22XL U142 ( .A0(x[2]), .A1(n90), .B0(T[1]), .B1(n98), .Y(n29) );
  OAI2BB1X1 U143 ( .A0N(n91), .A1N(T[1]), .B0(n30), .Y(n62) );
  AOI22XL U144 ( .A0(x[1]), .A1(n90), .B0(T[0]), .B1(n98), .Y(n30) );
  INVX2 U145 ( .A(P[1]), .Y(n109) );
  INVX2 U146 ( .A(P[2]), .Y(n108) );
  INVX2 U147 ( .A(P[3]), .Y(n107) );
  INVX2 U148 ( .A(P[4]), .Y(n106) );
  INVX2 U149 ( .A(P[5]), .Y(n105) );
  INVX2 U150 ( .A(P[6]), .Y(n104) );
  INVX2 U151 ( .A(P[7]), .Y(n103) );
  INVX2 U152 ( .A(T[5]), .Y(n114) );
  INVX2 U153 ( .A(T[4]), .Y(n113) );
  INVX2 U154 ( .A(T[6]), .Y(n115) );
  AO22X2 U155 ( .A0(n91), .A1(y_reg[3]), .B0(y[3]), .B1(n90), .Y(n68) );
  AO22X2 U156 ( .A0(n91), .A1(T[0]), .B0(x[0]), .B1(n90), .Y(n63) );
  INVX2 U157 ( .A(y_reg[0]), .Y(n88) );
  CLKBUFX20 U158 ( .A(n124), .Y(result[0]) );
  CLKBUFX20 U159 ( .A(n123), .Y(result[1]) );
  CLKBUFX20 U160 ( .A(n122), .Y(result[2]) );
  CLKBUFX20 U161 ( .A(n121), .Y(result[3]) );
  CLKBUFX20 U162 ( .A(n120), .Y(result[4]) );
  CLKBUFX20 U163 ( .A(n119), .Y(result[5]) );
  CLKBUFX20 U164 ( .A(n118), .Y(result[6]) );
  CLKBUFX20 U165 ( .A(n117), .Y(result[7]) );
endmodule

