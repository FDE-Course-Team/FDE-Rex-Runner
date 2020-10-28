
module Driver ( clk, rstn, start_i, addr_o, data_i, db_o, dori_o, cs_o, en_o, 
        rw_o, rst_o );
  output [9:0] addr_o;
  input [7:0] data_i;
  output [7:0] db_o;
  output [1:0] cs_o;
  input clk, rstn, start_i;
  output dori_o, en_o, rw_o, rst_o;
  wire   \*Logic0* , n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112, n113, n114, n115, n116, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145, n146, n147, n148, n149, n150,
         n151, n152, n153, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n164, n165, n166, n167, n168, n169, n170, n171, n172,
         n173, n174, n175, n176, n177, n178, n179;
  wire   [1:0] state;
  wire   [1:0] start_history;
  assign cs_o[1] = addr_o[9];

  EDFFHQ \start_history_reg[0]  ( .D(start_i), .E(rstn), .CK(clk), .Q(
        start_history[0]) );
  EDFFHQ \start_history_reg[1]  ( .D(start_history[0]), .E(rstn), .CK(clk), 
        .Q(start_history[1]) );
  DFFRHQ en_o_reg ( .D(n179), .CK(clk), .RN(rstn), .Q(en_o) );
  DFFSHQ rst_o_reg ( .D(\*Logic0* ), .CK(clk), .SN(rstn), .Q(rst_o) );
  DFFRHQ \x_reg[0]  ( .D(n88), .CK(clk), .RN(rstn), .Q(addr_o[6]) );
  DFFRHQ \x_reg[1]  ( .D(n75), .CK(clk), .RN(rstn), .Q(addr_o[7]) );
  DFFRHQ \x_reg[3]  ( .D(n87), .CK(clk), .RN(rstn), .Q(addr_o[9]) );
  DFFSHQ \state_reg[0]  ( .D(n86), .CK(clk), .SN(rstn), .Q(state[0]) );
  DFFSHQ \state_reg[1]  ( .D(n83), .CK(clk), .SN(rstn), .Q(state[1]) );
  DFFSHQ \state_reg[2]  ( .D(n84), .CK(clk), .SN(rstn), .Q(rw_o) );
  DFFRHQ \y_reg[5]  ( .D(n85), .CK(clk), .RN(rstn), .Q(addr_o[5]) );
  DFFRHQ \y_reg[0]  ( .D(n82), .CK(clk), .RN(rstn), .Q(addr_o[0]) );
  DFFRHQ \y_reg[1]  ( .D(n81), .CK(clk), .RN(rstn), .Q(addr_o[1]) );
  DFFRHQ \y_reg[2]  ( .D(n80), .CK(clk), .RN(rstn), .Q(addr_o[2]) );
  DFFRHQ \y_reg[3]  ( .D(n79), .CK(clk), .RN(rstn), .Q(addr_o[3]) );
  DFFRHQ \y_reg[4]  ( .D(n78), .CK(clk), .RN(rstn), .Q(addr_o[4]) );
  DFFRHQ \x_reg[2]  ( .D(n176), .CK(clk), .RN(rstn), .Q(addr_o[8]) );
  DFFRHQ \db_o_reg[0]  ( .D(n77), .CK(clk), .RN(rstn), .Q(db_o[0]) );
  DFFRHQ \db_o_reg[2]  ( .D(n73), .CK(clk), .RN(rstn), .Q(db_o[2]) );
  DFFRHQ \db_o_reg[6]  ( .D(n178), .CK(clk), .RN(rstn), .Q(db_o[6]) );
  DFFRHQ \db_o_reg[5]  ( .D(n70), .CK(clk), .RN(rstn), .Q(db_o[5]) );
  DFFRHQ \db_o_reg[4]  ( .D(n71), .CK(clk), .RN(rstn), .Q(db_o[4]) );
  DFFRHQ \db_o_reg[3]  ( .D(n72), .CK(clk), .RN(rstn), .Q(db_o[3]) );
  DFFRHQ \db_o_reg[7]  ( .D(n177), .CK(clk), .RN(rstn), .Q(db_o[7]) );
  DFFRHQ dori_o_reg ( .D(n76), .CK(clk), .RN(rstn), .Q(dori_o) );
  DFFRHQ \db_o_reg[1]  ( .D(n74), .CK(clk), .RN(rstn), .Q(db_o[1]) );
  INV U91 ( .A(n150), .Y(n89) );
  INV U92 ( .A(n171), .Y(n90) );
  LOGIC_0 U93 ( .LOGIC_0_PIN(\*Logic0* ) );
  MX2 U94 ( .A(n91), .B(n92), .S0(n93), .Y(n176) );
  NOR2B U95 ( .AN(n94), .B(n95), .Y(n92) );
  INV U96 ( .A(n96), .Y(n91) );
  OR2 U97 ( .A(n97), .B(n98), .Y(n177) );
  MX2 U98 ( .A(n99), .B(db_o[7]), .S0(n100), .Y(n98) );
  NOR2B U99 ( .AN(data_i[7]), .B(n101), .Y(n97) );
  INV U100 ( .A(n102), .Y(n178) );
  AOI221 U101 ( .A0(db_o[6]), .A1(n90), .B0(data_i[6]), .B1(n103), .C0(n104), 
        .Y(n102) );
  MX2 U102 ( .A(n105), .B(n106), .S0(n107), .Y(n88) );
  NOR2B U103 ( .AN(n89), .B(n105), .Y(n106) );
  MX2 U104 ( .A(n109), .B(n110), .S0(cs_o[0]), .Y(n87) );
  NOR3B U105 ( .AN(n94), .B(n93), .C(n95), .Y(n110) );
  OAI2BB1 U106 ( .A0N(n93), .A1N(n89), .B0(n96), .Y(n109) );
  AOI21 U107 ( .A0(n111), .A1(n89), .B0(n112), .Y(n96) );
  MX2 U108 ( .A(n113), .B(state[0]), .S0(n114), .Y(n86) );
  OAI31 U109 ( .A0(n93), .A1(cs_o[0]), .A2(n95), .B0(n115), .Y(n113) );
  NAND3B U110 ( .AN(n111), .B(n89), .C(addr_o[6]), .Y(n95) );
  INV U111 ( .A(addr_o[9]), .Y(cs_o[0]) );
  MX2 U112 ( .A(n116), .B(n117), .S0(n118), .Y(n85) );
  NOR2B U113 ( .AN(n119), .B(n120), .Y(n117) );
  OAI2BB1 U114 ( .A0N(n120), .A1N(n121), .B0(n122), .Y(n116) );
  MX2 U115 ( .A(n123), .B(rw_o), .S0(n114), .Y(n84) );
  NAND2 U116 ( .A(n124), .B(n125), .Y(n83) );
  MX2 U117 ( .A(n126), .B(n127), .S0(n114), .Y(n125) );
  AOI2BB1 U118 ( .A0N(n179), .A1N(n128), .B0(n94), .Y(n114) );
  NOR2B U119 ( .AN(n115), .B(n99), .Y(n128) );
  NOR2B U120 ( .AN(n129), .B(n123), .Y(n115) );
  INV U121 ( .A(n130), .Y(n123) );
  NOR2B U122 ( .AN(n130), .B(n108), .Y(n126) );
  AOI2BB1 U123 ( .A0N(n131), .A1N(n132), .B0(n133), .Y(n130) );
  NOR2B U124 ( .AN(state[0]), .B(n127), .Y(n131) );
  MX2 U125 ( .A(n134), .B(n121), .S0(n135), .Y(n82) );
  MX2 U126 ( .A(n136), .B(n137), .S0(n138), .Y(n81) );
  NOR2B U127 ( .AN(n121), .B(n135), .Y(n137) );
  INV U128 ( .A(n139), .Y(n136) );
  MX2 U129 ( .A(n140), .B(n141), .S0(n142), .Y(n80) );
  NOR3B U130 ( .AN(n121), .B(n138), .C(n135), .Y(n141) );
  OAI2BB1 U131 ( .A0N(n138), .A1N(n121), .B0(n139), .Y(n140) );
  AOI21 U132 ( .A0(n135), .A1(n121), .B0(n134), .Y(n139) );
  MX2 U133 ( .A(n143), .B(n144), .S0(n145), .Y(n79) );
  NOR2B U134 ( .AN(n146), .B(n147), .Y(n144) );
  MX2 U135 ( .A(n148), .B(n119), .S0(n120), .Y(n78) );
  NOR3B U136 ( .AN(n146), .B(n147), .C(n145), .Y(n119) );
  INV U137 ( .A(n122), .Y(n148) );
  AOI21 U138 ( .A0(n145), .A1(n121), .B0(n143), .Y(n122) );
  OAI21 U139 ( .A0(n146), .A1(n147), .B0(n149), .Y(n143) );
  INV U140 ( .A(n121), .Y(n147) );
  NOR2 U141 ( .A(n134), .B(n150), .Y(n121) );
  OR2 U142 ( .A(n151), .B(n152), .Y(n77) );
  MX2 U143 ( .A(n153), .B(db_o[0]), .S0(n100), .Y(n152) );
  OAI221 U144 ( .A0(n107), .A1(n154), .B0(n135), .B1(n129), .C0(n155), .Y(n153) );
  INV U145 ( .A(n133), .Y(n155) );
  INV U146 ( .A(addr_o[0]), .Y(n135) );
  NOR2B U147 ( .AN(data_i[0]), .B(n101), .Y(n151) );
  OAI2BB1 U148 ( .A0N(dori_o), .A1N(n90), .B0(n101), .Y(n76) );
  MX2 U149 ( .A(n112), .B(n156), .S0(n111), .Y(n75) );
  NOR3B U150 ( .AN(n108), .B(n105), .C(n107), .Y(n156) );
  INV U151 ( .A(n94), .Y(n105) );
  OAI2BB1 U152 ( .A0N(n107), .A1N(n108), .B0(n94), .Y(n112) );
  AOI2BB1 U153 ( .A0N(n157), .A1N(n158), .B0(n134), .Y(n94) );
  INV U154 ( .A(n149), .Y(n134) );
  NOR4BB U155 ( .AN(addr_o[5]), .BN(n146), .C(n120), .D(n145), .Y(n158) );
  NOR3B U156 ( .AN(addr_o[0]), .B(n138), .C(n142), .Y(n146) );
  INV U157 ( .A(addr_o[6]), .Y(n107) );
  OR2 U158 ( .A(n159), .B(n160), .Y(n74) );
  MX2 U159 ( .A(n161), .B(db_o[1]), .S0(n100), .Y(n160) );
  OAI221 U160 ( .A0(n111), .A1(n154), .B0(n138), .B1(n129), .C0(n162), .Y(n161) );
  INV U161 ( .A(addr_o[1]), .Y(n138) );
  INV U162 ( .A(addr_o[7]), .Y(n111) );
  NOR2B U163 ( .AN(data_i[1]), .B(n101), .Y(n159) );
  OR2 U164 ( .A(n163), .B(n164), .Y(n73) );
  MX2 U165 ( .A(n165), .B(db_o[2]), .S0(n100), .Y(n164) );
  OAI221 U166 ( .A0(n93), .A1(n154), .B0(n142), .B1(n129), .C0(n162), .Y(n165)
         );
  INV U167 ( .A(addr_o[2]), .Y(n142) );
  INV U168 ( .A(addr_o[8]), .Y(n93) );
  NOR2B U169 ( .AN(data_i[2]), .B(n101), .Y(n163) );
  INV U170 ( .A(n103), .Y(n101) );
  OAI211 U171 ( .A0(n145), .A1(n166), .B0(n167), .C0(n168), .Y(n72) );
  AOI22 U172 ( .A0(data_i[3]), .A1(n103), .B0(db_o[3]), .B1(n90), .Y(n168) );
  INV U173 ( .A(addr_o[3]), .Y(n145) );
  OAI211 U174 ( .A0(n120), .A1(n166), .B0(n167), .C0(n169), .Y(n71) );
  AOI22 U175 ( .A0(data_i[4]), .A1(n103), .B0(db_o[4]), .B1(n90), .Y(n169) );
  INV U176 ( .A(addr_o[4]), .Y(n120) );
  OAI211 U177 ( .A0(n118), .A1(n166), .B0(n167), .C0(n170), .Y(n70) );
  AOI22 U178 ( .A0(data_i[5]), .A1(n103), .B0(db_o[5]), .B1(n90), .Y(n170) );
  NOR2 U179 ( .A(n150), .B(n90), .Y(n103) );
  INV U180 ( .A(n108), .Y(n150) );
  OAI2BB1 U181 ( .A0N(n154), .A1N(n162), .B0(n171), .Y(n167) );
  INV U182 ( .A(n100), .Y(n171) );
  NOR2B U183 ( .AN(n124), .B(n133), .Y(n162) );
  INV U184 ( .A(n99), .Y(n154) );
  INV U185 ( .A(n104), .Y(n166) );
  NOR2 U186 ( .A(n129), .B(n90), .Y(n104) );
  NOR2B U187 ( .AN(n172), .B(n149), .Y(n100) );
  AOI2BB1 U188 ( .A0N(n108), .A1N(n157), .B0(n179), .Y(n149) );
  INV U189 ( .A(en_o), .Y(n179) );
  NOR3B U190 ( .AN(start_history[1]), .B(n124), .C(start_i), .Y(n157) );
  INV U191 ( .A(n173), .Y(n124) );
  NOR3B U192 ( .AN(state[0]), .B(n127), .C(n132), .Y(n173) );
  INV U193 ( .A(rw_o), .Y(n132) );
  NOR3 U194 ( .A(state[1]), .B(rw_o), .C(state[0]), .Y(n108) );
  OAI31 U195 ( .A0(n133), .A1(n174), .A2(n99), .B0(en_o), .Y(n172) );
  NOR3 U196 ( .A(state[1]), .B(n175), .C(rw_o), .Y(n99) );
  NOR3 U197 ( .A(n175), .B(n127), .C(rw_o), .Y(n133) );
  INV U198 ( .A(state[0]), .Y(n175) );
  INV U199 ( .A(n174), .Y(n129) );
  NOR3 U200 ( .A(state[0]), .B(n127), .C(rw_o), .Y(n174) );
  INV U201 ( .A(state[1]), .Y(n127) );
  INV U202 ( .A(addr_o[5]), .Y(n118) );
endmodule

