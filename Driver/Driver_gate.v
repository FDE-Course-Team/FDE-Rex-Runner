
module Driver ( clk, rstn, start_i, data_i, db_o, dori_o, cs_o, en_o, rw_o, 
        rst_o, state );
  input [7:0] data_i;
  output [7:0] db_o;
  output [3:0] cs_o;
  output [2:0] state;
  input clk, rstn, start_i;
  output dori_o, en_o, rw_o, rst_o;
  wire   \*Logic0* , N44, N45, N46, N47, N94, N113, n69, n70, n71, n72, n73,
         n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87,
         n88, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177;
  wire   [4:0] x;
  wire   [1:0] start_history;
  wire   [5:0] y;
  assign rw_o = \*Logic0* ;
  assign cs_o[3] = N113;

  EDFFHQ \start_history_reg[0]  ( .D(start_i), .E(rstn), .CK(clk), .Q(
        start_history[0]) );
  EDFFHQ \start_history_reg[1]  ( .D(start_history[0]), .E(rstn), .CK(clk), 
        .Q(start_history[1]) );
  DFFHQ rst_o_reg ( .D(n177), .CK(clk), .Q(rst_o) );
  DFFHQ en_o_reg ( .D(N94), .CK(clk), .Q(en_o) );
  DFFHQ \state_reg[1]  ( .D(n80), .CK(clk), .Q(state[1]) );
  DFFHQ \state_reg[0]  ( .D(n81), .CK(clk), .Q(state[0]) );
  DFFHQ \state_reg[2]  ( .D(n83), .CK(clk), .Q(state[2]) );
  DFFHQ \y_reg[5]  ( .D(n82), .CK(clk), .Q(y[5]) );
  DFFHQ \y_reg[0]  ( .D(n79), .CK(clk), .Q(y[0]) );
  DFFHQ \y_reg[1]  ( .D(n78), .CK(clk), .Q(y[1]) );
  DFFHQ \y_reg[2]  ( .D(n77), .CK(clk), .Q(y[2]) );
  DFFHQ \y_reg[3]  ( .D(n76), .CK(clk), .Q(y[3]) );
  DFFHQ \y_reg[4]  ( .D(n75), .CK(clk), .Q(y[4]) );
  DFFHQ \x_reg[4]  ( .D(n88), .CK(clk), .Q(x[4]) );
  DFFHQ \x_reg[0]  ( .D(n87), .CK(clk), .Q(x[0]) );
  DFFHQ \x_reg[1]  ( .D(n86), .CK(clk), .Q(x[1]) );
  DFFHQ \x_reg[2]  ( .D(n85), .CK(clk), .Q(x[2]) );
  DFFHQ \x_reg[3]  ( .D(n84), .CK(clk), .Q(x[3]) );
  DFFHQ \db_o_reg[0]  ( .D(n74), .CK(clk), .Q(db_o[0]) );
  DFFHQ \db_o_reg[1]  ( .D(n73), .CK(clk), .Q(db_o[1]) );
  DFFHQ \db_o_reg[2]  ( .D(n72), .CK(clk), .Q(db_o[2]) );
  DFFHQ dori_o_reg ( .D(n176), .CK(clk), .Q(dori_o) );
  DFFHQ \db_o_reg[7]  ( .D(n175), .CK(clk), .Q(db_o[7]) );
  DFFHQ \db_o_reg[6]  ( .D(n174), .CK(clk), .Q(db_o[6]) );
  DFFHQ \db_o_reg[5]  ( .D(n69), .CK(clk), .Q(db_o[5]) );
  DFFHQ \db_o_reg[4]  ( .D(n70), .CK(clk), .Q(db_o[4]) );
  DFFHQ \db_o_reg[3]  ( .D(n71), .CK(clk), .Q(db_o[3]) );
  AND2 U96 ( .A(x[1]), .B(x[0]), .Y(n92) );
  AND2 U97 ( .A(x[2]), .B(n92), .Y(n93) );
  AND2 U98 ( .A(x[3]), .B(n93), .Y(n94) );
  BUF U99 ( .I(n100), .O(n95) );
  BUF U100 ( .I(n99), .O(n96) );
  BUF U101 ( .I(n121), .O(n97) );
  LOGIC_0 U102 ( .LOGIC_0_PIN(\*Logic0* ) );
  XOR2 U103 ( .A(x[1]), .B(x[0]), .Y(N44) );
  XOR2 U104 ( .A(x[2]), .B(n92), .Y(N45) );
  XOR2 U105 ( .A(x[3]), .B(n93), .Y(N46) );
  XOR2 U106 ( .A(x[4]), .B(n94), .Y(N47) );
  INV U107 ( .A(n98), .Y(n174) );
  AOI221 U108 ( .A0(db_o[6]), .A1(n96), .B0(data_i[6]), .B1(n95), .C0(n101), 
        .Y(n98) );
  INV U109 ( .A(n102), .Y(n175) );
  AOI222 U110 ( .A0(db_o[7]), .A1(n96), .B0(data_i[7]), .B1(n95), .C0(n103), 
        .C1(n104), .Y(n102) );
  INV U111 ( .A(n105), .Y(n176) );
  AOI21 U112 ( .A0(dori_o), .A1(n96), .B0(n95), .Y(n105) );
  OAI2BB2 U113 ( .B0(n106), .B1(n107), .A0N(N47), .A1N(n108), .Y(n88) );
  MX2 U114 ( .A(n109), .B(n108), .S0(n110), .Y(n87) );
  OAI2BB2 U115 ( .B0(n106), .B1(n111), .A0N(N44), .A1N(n108), .Y(n86) );
  OAI2BB2 U116 ( .B0(n106), .B1(n112), .A0N(N45), .A1N(n108), .Y(n85) );
  OAI2BB2 U117 ( .B0(n106), .B1(n113), .A0N(N46), .A1N(n108), .Y(n84) );
  NOR3B U118 ( .AN(n106), .B(n177), .C(n114), .Y(n108) );
  INV U119 ( .A(n109), .Y(n106) );
  OAI21 U120 ( .A0(n115), .A1(n116), .B0(n117), .Y(n83) );
  MX2 U121 ( .A(n118), .B(n119), .S0(n120), .Y(n82) );
  NOR2B U122 ( .AN(n97), .B(n122), .Y(n119) );
  OAI2BB1 U123 ( .A0N(n123), .A1N(n97), .B0(n124), .Y(n118) );
  NAND2 U124 ( .A(n125), .B(n117), .Y(n81) );
  MX2 U125 ( .A(n126), .B(n127), .S0(n116), .Y(n125) );
  AOI31 U126 ( .A0(N113), .A1(x[2]), .A2(n128), .B0(n129), .Y(n127) );
  NOR3B U127 ( .AN(n130), .B(n111), .C(n110), .Y(n128) );
  NAND3B U128 ( .AN(n131), .B(n117), .C(n132), .Y(n80) );
  MX2 U129 ( .A(n133), .B(n114), .S0(n116), .Y(n132) );
  OAI31 U130 ( .A0(n134), .A1(n177), .A2(n135), .B0(n116), .Y(n117) );
  OAI21 U131 ( .A0(n136), .A1(n137), .B0(n109), .Y(n116) );
  NOR2B U132 ( .AN(n138), .B(n139), .Y(n109) );
  NOR4BB U133 ( .AN(en_o), .BN(y[5]), .C(n114), .D(n122), .Y(n139) );
  OR3 U134 ( .A(n140), .B(n141), .C(n123), .Y(n122) );
  NOR4BB U135 ( .AN(n142), .BN(n143), .C(n129), .D(n134), .Y(n136) );
  AOI2BB1 U136 ( .A0N(n126), .A1N(n133), .B0(n115), .Y(n134) );
  MX2 U137 ( .A(n144), .B(n97), .S0(n145), .Y(n79) );
  INV U138 ( .A(n146), .Y(n144) );
  MX2 U139 ( .A(n147), .B(n148), .S0(n149), .Y(n78) );
  NOR2B U140 ( .AN(n97), .B(n145), .Y(n148) );
  MX2 U141 ( .A(n150), .B(n151), .S0(n152), .Y(n77) );
  NOR3B U142 ( .AN(n97), .B(n149), .C(n145), .Y(n151) );
  INV U143 ( .A(n153), .Y(n150) );
  AOI21 U144 ( .A0(n149), .A1(n97), .B0(n147), .Y(n153) );
  OAI2BB1 U145 ( .A0N(n145), .A1N(n97), .B0(n146), .Y(n147) );
  MX2 U146 ( .A(n154), .B(n155), .S0(n141), .Y(n76) );
  NOR2B U147 ( .AN(n97), .B(n140), .Y(n155) );
  MX2 U148 ( .A(n156), .B(n157), .S0(n123), .Y(n75) );
  NOR3B U149 ( .AN(n97), .B(n141), .C(n140), .Y(n157) );
  INV U150 ( .A(n124), .Y(n156) );
  AOI21 U151 ( .A0(n141), .A1(n97), .B0(n154), .Y(n124) );
  OAI2BB1 U152 ( .A0N(n140), .A1N(n97), .B0(n146), .Y(n154) );
  NAND3B U153 ( .AN(n152), .B(y[1]), .C(y[0]), .Y(n140) );
  NOR3B U154 ( .AN(n146), .B(n114), .C(n177), .Y(n121) );
  INV U155 ( .A(n158), .Y(n74) );
  AOI222 U156 ( .A0(db_o[0]), .A1(n96), .B0(n104), .B1(n159), .C0(data_i[0]), 
        .C1(n95), .Y(n158) );
  OAI221 U157 ( .A0(n143), .A1(n110), .B0(n160), .B1(n145), .C0(n142), .Y(n159) );
  INV U158 ( .A(y[0]), .Y(n145) );
  INV U159 ( .A(x[0]), .Y(n110) );
  INV U160 ( .A(n161), .Y(n73) );
  AOI222 U161 ( .A0(db_o[1]), .A1(n96), .B0(n104), .B1(n162), .C0(data_i[1]), 
        .C1(n95), .Y(n161) );
  OAI221 U162 ( .A0(n143), .A1(n111), .B0(n160), .B1(n149), .C0(n163), .Y(n162) );
  INV U163 ( .A(y[1]), .Y(n149) );
  INV U164 ( .A(x[1]), .Y(n111) );
  INV U165 ( .A(n164), .Y(n72) );
  AOI222 U166 ( .A0(db_o[2]), .A1(n96), .B0(n104), .B1(n165), .C0(data_i[2]), 
        .C1(n95), .Y(n164) );
  OAI221 U167 ( .A0(n143), .A1(n112), .B0(n160), .B1(n152), .C0(n163), .Y(n165) );
  INV U168 ( .A(y[2]), .Y(n152) );
  INV U169 ( .A(x[2]), .Y(n112) );
  OAI211 U170 ( .A0(n141), .A1(n166), .B0(n167), .C0(n168), .Y(n71) );
  AOI22 U171 ( .A0(data_i[3]), .A1(n95), .B0(db_o[3]), .B1(n96), .Y(n168) );
  INV U172 ( .A(y[3]), .Y(n141) );
  OAI211 U173 ( .A0(n123), .A1(n166), .B0(n167), .C0(n169), .Y(n70) );
  AOI22 U174 ( .A0(data_i[4]), .A1(n95), .B0(db_o[4]), .B1(n96), .Y(n169) );
  INV U175 ( .A(y[4]), .Y(n123) );
  OAI211 U176 ( .A0(n120), .A1(n166), .B0(n167), .C0(n170), .Y(n69) );
  AOI22 U177 ( .A0(data_i[5]), .A1(n95), .B0(db_o[5]), .B1(n96), .Y(n170) );
  NOR2B U178 ( .AN(n104), .B(n114), .Y(n100) );
  INV U179 ( .A(n130), .Y(n114) );
  OAI2BB1 U180 ( .A0N(n143), .A1N(n163), .B0(n104), .Y(n167) );
  NOR2 U181 ( .A(n135), .B(n131), .Y(n163) );
  INV U182 ( .A(n101), .Y(n166) );
  NOR2B U183 ( .AN(n104), .B(n160), .Y(n101) );
  NOR2 U184 ( .A(n177), .B(n96), .Y(n104) );
  NOR2 U185 ( .A(n146), .B(n171), .Y(n99) );
  AOI31 U186 ( .A0(n160), .A1(n142), .A2(n143), .B0(n137), .Y(n171) );
  INV U187 ( .A(n103), .Y(n143) );
  NOR3 U188 ( .A(state[2]), .B(n126), .C(state[1]), .Y(n103) );
  INV U189 ( .A(n135), .Y(n142) );
  NOR3 U190 ( .A(n133), .B(n126), .C(state[2]), .Y(n135) );
  INV U191 ( .A(n129), .Y(n160) );
  NOR3 U192 ( .A(state[2]), .B(n133), .C(state[0]), .Y(n129) );
  INV U193 ( .A(state[1]), .Y(n133) );
  OAI2BB1 U194 ( .A0N(en_o), .A1N(n130), .B0(n138), .Y(n146) );
  AOI31 U195 ( .A0(n172), .A1(n173), .A2(n131), .B0(n177), .Y(n138) );
  NOR3B U196 ( .AN(state[1]), .B(n126), .C(n115), .Y(n131) );
  INV U197 ( .A(state[2]), .Y(n115) );
  INV U198 ( .A(state[0]), .Y(n126) );
  INV U199 ( .A(start_i), .Y(n173) );
  NOR2B U200 ( .AN(start_history[1]), .B(n137), .Y(n172) );
  NOR3 U201 ( .A(state[2]), .B(state[0]), .C(state[1]), .Y(n130) );
  INV U202 ( .A(y[5]), .Y(n120) );
  NOR2B U203 ( .AN(n113), .B(n107), .Y(cs_o[2]) );
  INV U204 ( .A(x[3]), .Y(n113) );
  NOR2B U205 ( .AN(x[3]), .B(x[4]), .Y(cs_o[1]) );
  NOR2B U206 ( .AN(n107), .B(x[3]), .Y(cs_o[0]) );
  NOR2B U207 ( .AN(n137), .B(n177), .Y(N94) );
  INV U208 ( .A(rstn), .Y(n177) );
  INV U209 ( .A(en_o), .Y(n137) );
  NOR2B U210 ( .AN(x[3]), .B(n107), .Y(N113) );
  INV U211 ( .A(x[4]), .Y(n107) );
endmodule

