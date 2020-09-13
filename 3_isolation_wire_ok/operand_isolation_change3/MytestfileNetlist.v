/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : M-2016.12-SP5
// Date      : Sun Nov 17 14:51:19 2019
/////////////////////////////////////////////////////////////


module TOP_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [3:0] a;
  input [3:0] b;
  output [3:0] quotient;
  output [3:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] , \u_div/SumTmp[3][0] ,
         \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[3][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[2][1] , \u_div/PartRem[2][2] , \u_div/PartRem[3][1] ,
         n1, n2, n3, n4, n5;

  XNOR2X1 U1 ( .A(n5), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X1 U2 ( .A(n5), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  OR2X2 U3 ( .A(a[3]), .B(n5), .Y(\u_div/CryTmp[3][1] ) );
  XNOR2X1 U4 ( .A(n5), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  INVX2 U5 ( .A(b[0]), .Y(n5) );
  ADDFX1 U6 ( .A(\u_div/PartRem[2][1] ), .B(n4), .CI(\u_div/CryTmp[1][1] ), 
        .CO(\u_div/CryTmp[1][2] ), .S(\u_div/SumTmp[1][1] ) );
  OR2X2 U7 ( .A(a[1]), .B(n5), .Y(\u_div/CryTmp[1][1] ) );
  ADDFX1 U8 ( .A(\u_div/PartRem[1][3] ), .B(n2), .CI(\u_div/CryTmp[0][3] ), 
        .CO(quotient[0]) );
  ADDFX1 U9 ( .A(\u_div/PartRem[1][2] ), .B(n3), .CI(\u_div/CryTmp[0][2] ), 
        .CO(\u_div/CryTmp[0][3] ) );
  ADDFX1 U10 ( .A(\u_div/PartRem[1][1] ), .B(n4), .CI(\u_div/CryTmp[0][1] ), 
        .CO(\u_div/CryTmp[0][2] ) );
  ADDFX1 U11 ( .A(\u_div/PartRem[3][1] ), .B(n4), .CI(\u_div/CryTmp[2][1] ), 
        .CO(\u_div/CryTmp[2][2] ), .S(\u_div/SumTmp[2][1] ) );
  OR2X2 U12 ( .A(a[2]), .B(n5), .Y(\u_div/CryTmp[2][1] ) );
  ADDFX1 U13 ( .A(\u_div/PartRem[2][2] ), .B(n3), .CI(\u_div/CryTmp[1][2] ), 
        .CO(\u_div/CryTmp[1][3] ), .S(\u_div/SumTmp[1][2] ) );
  INVX2 U14 ( .A(b[1]), .Y(n4) );
  INVX2 U15 ( .A(b[2]), .Y(n3) );
  INVX2 U16 ( .A(b[3]), .Y(n2) );
  NAND2X2 U17 ( .A(b[0]), .B(n1), .Y(\u_div/CryTmp[0][1] ) );
  INVX2 U18 ( .A(a[0]), .Y(n1) );
  MX2X1 U19 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  MX2X1 U20 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  MX2X1 U21 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  MX2X1 U22 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  MX2X1 U23 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  MX2X1 U24 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1 U25 ( .A(\u_div/CryTmp[3][1] ), .B(n4), .C(n3), .D(n2), .Y(
        quotient[3]) );
  AND3X1 U26 ( .A(\u_div/CryTmp[2][2] ), .B(n3), .C(n2), .Y(quotient[2]) );
  AND2X1 U27 ( .A(\u_div/CryTmp[1][3] ), .B(n2), .Y(quotient[1]) );
endmodule


module TOP_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [3:0] A;
  input [3:0] B;
  output [7:0] PRODUCT;
  input TC;
  wire   \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][3] , \ab[1][2] ,
         \ab[1][1] , \ab[1][0] , \ab[0][3] , \ab[0][2] , \ab[0][1] ,
         \CARRYB[3][2] , \CARRYB[3][1] , \CARRYB[3][0] , \CARRYB[2][2] ,
         \CARRYB[2][1] , \CARRYB[2][0] , \SUMB[3][2] , \SUMB[3][1] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][2] , \SUMB[1][1] , \A1[4] ,
         \A1[3] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24;

  ADDFX1 S1_2_0 ( .A(\ab[2][0] ), .B(n5), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(PRODUCT[2]) );
  ADDFX1 S2_2_1 ( .A(\ab[2][1] ), .B(n4), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX1 S3_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\ab[1][3] ), .CO(\CARRYB[2][2] ), 
        .S(\SUMB[2][2] ) );
  ADDFX1 S4_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX1 S4_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(PRODUCT[3]) );
  ADDFX1 S5_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\ab[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  AND2X2 U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2 U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2 U4 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n5) );
  INVX2 U5 ( .A(n10), .Y(n16) );
  XOR2X1 U6 ( .A(\CARRYB[3][2] ), .B(\ab[3][3] ), .Y(\A1[4] ) );
  XOR2X1 U7 ( .A(\CARRYB[3][1] ), .B(\SUMB[3][2] ), .Y(\A1[3] ) );
  AND2X2 U8 ( .A(\CARRYB[3][2] ), .B(\ab[3][3] ), .Y(n6) );
  AND2X2 U9 ( .A(\SUMB[3][1] ), .B(\CARRYB[3][0] ), .Y(n7) );
  AND2X2 U10 ( .A(\CARRYB[3][1] ), .B(\SUMB[3][2] ), .Y(n8) );
  XOR2X1 U11 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1 U12 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  INVX2 U13 ( .A(A[3]), .Y(n17) );
  INVX2 U14 ( .A(A[1]), .Y(n19) );
  INVX2 U15 ( .A(A[2]), .Y(n18) );
  INVX2 U16 ( .A(A[0]), .Y(n20) );
  INVX2 U17 ( .A(B[2]), .Y(n22) );
  INVX2 U18 ( .A(B[1]), .Y(n23) );
  INVX2 U19 ( .A(B[3]), .Y(n21) );
  INVX2 U20 ( .A(B[0]), .Y(n24) );
  INVX2 U21 ( .A(n9), .Y(PRODUCT[5]) );
  XNOR2X1 U22 ( .A(n6), .B(n15), .Y(PRODUCT[7]) );
  XOR2X1 U23 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XOR2X1 U24 ( .A(\CARRYB[3][0] ), .B(\SUMB[3][1] ), .Y(PRODUCT[4]) );
  NOR2X1 U25 ( .A(n7), .B(\A1[3] ), .Y(n11) );
  CLKNAND2X2 U26 ( .A(n7), .B(\A1[3] ), .Y(n10) );
  NAND2BX1 U27 ( .AN(n11), .B(n10), .Y(n9) );
  AND2X1 U28 ( .A(n8), .B(\A1[4] ), .Y(n13) );
  NOR2X1 U29 ( .A(n8), .B(\A1[4] ), .Y(n14) );
  NOR2X1 U30 ( .A(n13), .B(n14), .Y(n12) );
  XOR2X1 U31 ( .A(n16), .B(n12), .Y(PRODUCT[6]) );
  AOI2B1X1 U32 ( .A1N(n14), .A0(n16), .B0(n13), .Y(n15) );
  NOR2X1 U33 ( .A(n17), .B(n21), .Y(\ab[3][3] ) );
  NOR2X1 U34 ( .A(n17), .B(n22), .Y(\ab[3][2] ) );
  NOR2X1 U35 ( .A(n17), .B(n23), .Y(\ab[3][1] ) );
  NOR2X1 U36 ( .A(n17), .B(n24), .Y(\ab[3][0] ) );
  NOR2X1 U37 ( .A(n21), .B(n18), .Y(\ab[2][3] ) );
  NOR2X1 U38 ( .A(n22), .B(n18), .Y(\ab[2][2] ) );
  NOR2X1 U39 ( .A(n23), .B(n18), .Y(\ab[2][1] ) );
  NOR2X1 U40 ( .A(n24), .B(n18), .Y(\ab[2][0] ) );
  NOR2X1 U41 ( .A(n21), .B(n19), .Y(\ab[1][3] ) );
  NOR2X1 U42 ( .A(n22), .B(n19), .Y(\ab[1][2] ) );
  NOR2X1 U43 ( .A(n23), .B(n19), .Y(\ab[1][1] ) );
  NOR2X1 U44 ( .A(n24), .B(n19), .Y(\ab[1][0] ) );
  NOR2X1 U45 ( .A(n21), .B(n20), .Y(\ab[0][3] ) );
  NOR2X1 U46 ( .A(n22), .B(n20), .Y(\ab[0][2] ) );
  NOR2X1 U47 ( .A(n23), .B(n20), .Y(\ab[0][1] ) );
  NOR2X1 U48 ( .A(n24), .B(n20), .Y(PRODUCT[0]) );
endmodule


module TOP ( a, b, clk, rst, sel1, sel2, sel3, sel4, out );
  input [3:0] a;
  input [3:0] b;
  output [7:0] out;
  input clk, rst, sel1, sel2, sel3, sel4;
  wire   n71, n72, n73, n74, n75, n76, n77, n78, N29, N30, N31, N32, N33, N34,
         N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48,
         N49, N51, N52, N53, N54, N55, N56, N57, N58, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n38, n40, n42, n44, n46, n48, n50, n53, n54, n55, n56, n57, n58,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69;
  wire   [3:0] a_1;
  wire   [3:0] b_1;
  wire   [3:0] a_2;
  wire   [3:0] b_2;
  wire   [3:0] a_3;
  wire   [3:0] b_3;
  wire   [3:0] a_4;
  wire   [5:0] \sub_34/carry ;
  wire   [4:1] \add_32/carry ;

  TOP_DW_div_uns_0 div_33 ( .a(a_3), .b(b_3), .quotient({N45, N44, N43, N42})
         );
  TOP_DW02_mult_0 mult_31 ( .A(a_1), .B(b_1), .TC(1'b0), .PRODUCT({N36, N35, 
        N34, N33, N32, N31, N30, N29}) );
  DFFRQX1 \out_reg[7]  ( .D(N58), .CK(n37), .RN(n35), .Q(n71) );
  DFFRHQX2 \out_reg[6]  ( .D(N57), .CK(n37), .RN(n35), .Q(n72) );
  DFFRHQX2 \out_reg[5]  ( .D(N56), .CK(n37), .RN(n35), .Q(n73) );
  DFFRHQX2 \out_reg[4]  ( .D(N55), .CK(n37), .RN(n35), .Q(n74) );
  DFFRHQX2 \out_reg[3]  ( .D(N54), .CK(n37), .RN(n35), .Q(n75) );
  DFFRHQX2 \out_reg[2]  ( .D(N53), .CK(n37), .RN(n35), .Q(n76) );
  DFFRHQX2 \out_reg[1]  ( .D(N52), .CK(n37), .RN(n35), .Q(n77) );
  DFFRHQX2 \out_reg[0]  ( .D(N51), .CK(n37), .RN(n35), .Q(n78) );
  CLKBUFX32 U70 ( .A(n71), .Y(out[7]) );
  OR2X2 U71 ( .A(n62), .B(n57), .Y(n31) );
  OR2X2 U72 ( .A(n57), .B(n64), .Y(n32) );
  OR2X2 U73 ( .A(n57), .B(n63), .Y(n33) );
  CLKINVX1 U74 ( .A(rst), .Y(n34) );
  INVX2 U75 ( .A(n34), .Y(n35) );
  INVXL U76 ( .A(clk), .Y(n36) );
  INVX4 U77 ( .A(n36), .Y(n37) );
  INVX4 U78 ( .A(n78), .Y(n38) );
  CLKINVX20 U79 ( .A(n38), .Y(out[0]) );
  INVX4 U80 ( .A(n77), .Y(n40) );
  CLKINVX20 U81 ( .A(n40), .Y(out[1]) );
  INVX4 U82 ( .A(n76), .Y(n42) );
  CLKINVX20 U83 ( .A(n42), .Y(out[2]) );
  INVX4 U84 ( .A(n75), .Y(n44) );
  CLKINVX20 U85 ( .A(n44), .Y(out[3]) );
  INVX4 U86 ( .A(n74), .Y(n46) );
  CLKINVX20 U87 ( .A(n46), .Y(out[4]) );
  INVX4 U88 ( .A(n73), .Y(n48) );
  CLKINVX20 U89 ( .A(n48), .Y(out[5]) );
  INVX4 U90 ( .A(n72), .Y(n50) );
  CLKINVX20 U91 ( .A(n50), .Y(out[6]) );
  OAI2BB1X1 U92 ( .A0N(N36), .A1N(n54), .B0(n18), .Y(N58) );
  NOR4X4 U93 ( .A(n57), .B(n54), .C(sel2), .D(sel3), .Y(n21) );
  NAND2BX2 U94 ( .AN(\sub_34/carry [4]), .B(n21), .Y(n18) );
  NOR3X4 U95 ( .A(n54), .B(sel2), .C(n56), .Y(n24) );
  INVX2 U96 ( .A(n54), .Y(n66) );
  NOR2X2 U97 ( .A(n55), .B(n54), .Y(n20) );
  NOR2X2 U98 ( .A(n56), .B(n58), .Y(a_3[3]) );
  NOR2X2 U99 ( .A(n56), .B(n59), .Y(a_3[2]) );
  NOR2X2 U100 ( .A(n56), .B(n60), .Y(a_3[1]) );
  NOR2X2 U101 ( .A(n64), .B(n56), .Y(b_3[1]) );
  NOR2X2 U102 ( .A(n65), .B(n56), .Y(b_3[0]) );
  NOR2X2 U103 ( .A(n63), .B(n56), .Y(b_3[2]) );
  NOR2X2 U104 ( .A(n65), .B(n55), .Y(b_2[0]) );
  NOR2X2 U105 ( .A(n57), .B(n61), .Y(a_4[0]) );
  NOR2X2 U106 ( .A(n62), .B(n56), .Y(b_3[3]) );
  NOR2X2 U107 ( .A(n55), .B(n61), .Y(a_2[0]) );
  NOR2X2 U108 ( .A(n66), .B(n58), .Y(a_1[3]) );
  NOR2X2 U109 ( .A(n66), .B(n60), .Y(a_1[1]) );
  NOR2X2 U110 ( .A(n66), .B(n59), .Y(a_1[2]) );
  NOR2X2 U111 ( .A(n66), .B(n61), .Y(a_1[0]) );
  NOR2X2 U112 ( .A(n63), .B(n66), .Y(b_1[2]) );
  NOR2X2 U113 ( .A(n64), .B(n66), .Y(b_1[1]) );
  NOR2X2 U114 ( .A(n62), .B(n66), .Y(b_1[3]) );
  NOR2X2 U115 ( .A(n65), .B(n66), .Y(b_1[0]) );
  OAI2BB1X1 U116 ( .A0N(N34), .A1N(n54), .B0(n18), .Y(N56) );
  OAI2BB1X1 U117 ( .A0N(N35), .A1N(n54), .B0(n18), .Y(N57) );
  CLKBUFX4 U118 ( .A(n68), .Y(n56) );
  INVX2 U119 ( .A(sel3), .Y(n68) );
  CLKBUFX4 U120 ( .A(n67), .Y(n55) );
  INVX2 U121 ( .A(sel2), .Y(n67) );
  NAND2X2 U122 ( .A(n29), .B(n30), .Y(N51) );
  AOI22XL U123 ( .A0(N37), .A1(n20), .B0(N29), .B1(n54), .Y(n29) );
  AOI22XL U124 ( .A0(N46), .A1(n21), .B0(N42), .B1(n24), .Y(n30) );
  NAND2X2 U125 ( .A(n27), .B(n28), .Y(N52) );
  AOI22XL U126 ( .A0(N38), .A1(n20), .B0(N30), .B1(n54), .Y(n27) );
  AOI22XL U127 ( .A0(N47), .A1(n21), .B0(N43), .B1(n24), .Y(n28) );
  NAND2X2 U128 ( .A(n25), .B(n26), .Y(N53) );
  AOI22XL U129 ( .A0(N39), .A1(n20), .B0(N31), .B1(n54), .Y(n25) );
  AOI22XL U130 ( .A0(N48), .A1(n21), .B0(N44), .B1(n24), .Y(n26) );
  NAND2X2 U131 ( .A(n22), .B(n23), .Y(N54) );
  AOI22XL U132 ( .A0(N40), .A1(n20), .B0(N32), .B1(n54), .Y(n22) );
  AOI22XL U133 ( .A0(N49), .A1(n21), .B0(N45), .B1(n24), .Y(n23) );
  ADDFX1 U134 ( .A(a_2[1]), .B(b_2[1]), .CI(\add_32/carry [1]), .CO(
        \add_32/carry [2]), .S(N38) );
  NOR2X2 U135 ( .A(n55), .B(n60), .Y(a_2[1]) );
  NOR2X2 U136 ( .A(n64), .B(n55), .Y(b_2[1]) );
  ADDFX1 U137 ( .A(a_4[1]), .B(n32), .CI(\sub_34/carry [1]), .CO(
        \sub_34/carry [2]), .S(N47) );
  NOR2X2 U138 ( .A(n57), .B(n60), .Y(a_4[1]) );
  ADDFX1 U139 ( .A(a_2[2]), .B(b_2[2]), .CI(\add_32/carry [2]), .CO(
        \add_32/carry [3]), .S(N39) );
  NOR2X2 U140 ( .A(n55), .B(n59), .Y(a_2[2]) );
  NOR2X2 U141 ( .A(n63), .B(n55), .Y(b_2[2]) );
  ADDFX1 U142 ( .A(a_4[2]), .B(n33), .CI(\sub_34/carry [2]), .CO(
        \sub_34/carry [3]), .S(N48) );
  NOR2X2 U143 ( .A(n57), .B(n59), .Y(a_4[2]) );
  NOR2X2 U144 ( .A(n56), .B(n61), .Y(a_3[0]) );
  OAI2BB1X1 U145 ( .A0N(N33), .A1N(n54), .B0(n19), .Y(N55) );
  AOI21BX2 U146 ( .A0(N41), .A1(n20), .B0N(n18), .Y(n19) );
  ADDFX1 U147 ( .A(a_4[3]), .B(n31), .CI(\sub_34/carry [3]), .CO(
        \sub_34/carry [4]), .S(N49) );
  NOR2X2 U148 ( .A(n57), .B(n58), .Y(a_4[3]) );
  OR2X2 U149 ( .A(n57), .B(n65), .Y(n53) );
  ADDFX1 U150 ( .A(a_2[3]), .B(b_2[3]), .CI(\add_32/carry [3]), .CO(N41), .S(
        N40) );
  NOR2X2 U151 ( .A(n55), .B(n58), .Y(a_2[3]) );
  NOR2X2 U152 ( .A(n62), .B(n55), .Y(b_2[3]) );
  INVX2 U153 ( .A(b[3]), .Y(n62) );
  INVX2 U154 ( .A(b[2]), .Y(n63) );
  INVX2 U155 ( .A(b[1]), .Y(n64) );
  INVX2 U156 ( .A(b[0]), .Y(n65) );
  INVX2 U157 ( .A(a[2]), .Y(n59) );
  INVX2 U158 ( .A(a[3]), .Y(n58) );
  INVX2 U159 ( .A(a[0]), .Y(n61) );
  INVX2 U160 ( .A(a[1]), .Y(n60) );
  CLKBUFX4 U161 ( .A(sel1), .Y(n54) );
  CLKBUFX4 U162 ( .A(n69), .Y(n57) );
  INVX2 U163 ( .A(sel4), .Y(n69) );
  AND2X1 U164 ( .A(a_2[0]), .B(b_2[0]), .Y(\add_32/carry [1]) );
  XOR2X1 U165 ( .A(b_2[0]), .B(a_2[0]), .Y(N37) );
  OR2X1 U166 ( .A(n53), .B(a_4[0]), .Y(\sub_34/carry [1]) );
  XNOR2X1 U167 ( .A(a_4[0]), .B(n53), .Y(N46) );
endmodule

