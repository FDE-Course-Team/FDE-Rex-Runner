
module Driver ( clk, rstn, start_i, addr_o, data_i, db_o, dori_o, cs_o, en_o, 
        rw_o, rst_o );
  output [9:0] addr_o;
  input [7:0] data_i;
  output [7:0] db_o;
  output [1:0] cs_o;
  input clk, rstn, start_i;
  output dori_o, en_o, rw_o, rst_o;
  wire   \*Logic0* , n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173;
  wire   [1:0] state;
  wire   [1:0] start_history;
  assign cs_o[1] = addr_o[9];

  EDFFHQ \start_history_reg[0]  ( .D(start_i), .E(rstn), .CK(clk), .Q(
        start_history[0]) );
  EDFFHQ \start_history_reg[1]  ( .D(start_history[0]), .E(rstn), .CK(clk), 
        .Q(start_history[1]) );
  DFFRHQ en_o_reg ( .D(n173), .CK(clk), .RN(rstn), .Q(en_o) );
  DFFSHQ rst_o_reg ( .D(\*Logic0* ), .CK(clk), .SN(rstn), .Q(rst_o) );
  DFFRHQ \x_reg[0]  ( .D(n94), .CK(clk), .RN(rstn), .Q(addr_o[6]) );
  DFFRHQ \x_reg[3]  ( .D(n93), .CK(clk), .RN(rstn), .Q(addr_o[9]) );
  DFFSHQ \state_reg[0]  ( .D(n92), .CK(clk), .SN(rstn), .Q(state[0]) );
  DFFSHQ \state_reg[1]  ( .D(n89), .CK(clk), .SN(rstn), .Q(state[1]) );
  DFFSHQ \state_reg[2]  ( .D(n91), .CK(clk), .SN(rstn), .Q(rw_o) );
  DFFRHQ dori_o_reg ( .D(n73), .CK(clk), .RN(rstn), .Q(dori_o) );
  DFFRHQ \db_o_reg[7]  ( .D(n74), .CK(clk), .RN(rstn), .Q(db_o[7]) );
  DFFRHQ \y_reg[5]  ( .D(n90), .CK(clk), .RN(rstn), .Q(addr_o[5]) );
  DFFRHQ \y_reg[0]  ( .D(n86), .CK(clk), .RN(rstn), .Q(addr_o[0]) );
  DFFRHQ \db_o_reg[0]  ( .D(n81), .CK(clk), .RN(rstn), .Q(db_o[0]) );
  DFFRHQ \y_reg[1]  ( .D(n85), .CK(clk), .RN(rstn), .Q(addr_o[1]) );
  DFFRHQ \y_reg[2]  ( .D(n84), .CK(clk), .RN(rstn), .Q(addr_o[2]) );
  DFFRHQ \y_reg[3]  ( .D(n83), .CK(clk), .RN(rstn), .Q(addr_o[3]) );
  DFFRHQ \y_reg[4]  ( .D(n82), .CK(clk), .RN(rstn), .Q(addr_o[4]) );
  DFFRHQ \x_reg[1]  ( .D(n88), .CK(clk), .RN(rstn), .Q(addr_o[7]) );
  DFFRHQ \db_o_reg[1]  ( .D(n80), .CK(clk), .RN(rstn), .Q(db_o[1]) );
  DFFRHQ \x_reg[2]  ( .D(n87), .CK(clk), .RN(rstn), .Q(addr_o[8]) );
  DFFRHQ \db_o_reg[2]  ( .D(n79), .CK(clk), .RN(rstn), .Q(db_o[2]) );
  DFFRHQ \db_o_reg[5]  ( .D(n76), .CK(clk), .RN(rstn), .Q(db_o[5]) );
  DFFRHQ \db_o_reg[4]  ( .D(n77), .CK(clk), .RN(rstn), .Q(db_o[4]) );
  DFFRHQ \db_o_reg[3]  ( .D(n78), .CK(clk), .RN(rstn), .Q(db_o[3]) );
  DFFRHQ \db_o_reg[6]  ( .D(n75), .CK(clk), .RN(rstn), .Q(db_o[6]) );
  OR3 U98 ( .A(rw_o), .B(state[0]), .C(state[1]), .Y(n96) );
  INV U99 ( .A(n96), .Y(n97) );
  LOGIC_0 U100 ( .LOGIC_0_PIN(\*Logic0* ) );
  MX2 U101 ( .A(n98), .B(n99), .S0(addr_o[6]), .Y(n94) );
  NOR2B U102 ( .AN(n97), .B(n99), .Y(n98) );
  MX2 U103 ( .A(n100), .B(n101), .S0(addr_o[9]), .Y(n93) );
  OAI21 U104 ( .A0(addr_o[8]), .A1(n96), .B0(n102), .Y(n101) );
  NOR3B U105 ( .AN(addr_o[8]), .B(n99), .C(n103), .Y(n100) );
  NAND2B U106 ( .AN(n104), .B(n105), .Y(n92) );
  MX2 U107 ( .A(n106), .B(state[0]), .S0(n107), .Y(n104) );
  OAI31 U108 ( .A0(n108), .A1(cs_o[0]), .A2(n103), .B0(n109), .Y(n106) );
  INV U109 ( .A(addr_o[9]), .Y(cs_o[0]) );
  INV U110 ( .A(addr_o[8]), .Y(n108) );
  OAI2BB1 U111 ( .A0N(n107), .A1N(rw_o), .B0(n105), .Y(n91) );
  MX2 U112 ( .A(n110), .B(n111), .S0(addr_o[5]), .Y(n90) );
  OAI21 U113 ( .A0(addr_o[4]), .A1(n96), .B0(n112), .Y(n111) );
  NOR2B U114 ( .AN(n113), .B(n114), .Y(n110) );
  NAND3B U115 ( .AN(n115), .B(n116), .C(n105), .Y(n89) );
  NAND2B U116 ( .AN(n107), .B(n117), .Y(n105) );
  MX2 U117 ( .A(n97), .B(state[1]), .S0(n107), .Y(n115) );
  NOR2B U118 ( .AN(n118), .B(n119), .Y(n107) );
  INV U119 ( .A(n99), .Y(n119) );
  OAI31 U120 ( .A0(n120), .A1(n117), .A2(n121), .B0(en_o), .Y(n118) );
  XNOR2 U121 ( .A(rw_o), .B(n116), .Y(n117) );
  MX2 U122 ( .A(n122), .B(n123), .S0(addr_o[7]), .Y(n88) );
  INV U123 ( .A(n124), .Y(n123) );
  NOR3B U124 ( .AN(addr_o[6]), .B(n99), .C(n96), .Y(n122) );
  MX2 U125 ( .A(n125), .B(n126), .S0(addr_o[8]), .Y(n87) );
  INV U126 ( .A(n102), .Y(n126) );
  NOR2B U127 ( .AN(n124), .B(n127), .Y(n102) );
  NOR2B U128 ( .AN(n97), .B(addr_o[7]), .Y(n127) );
  NOR2 U129 ( .A(n99), .B(n128), .Y(n124) );
  NOR2B U130 ( .AN(n97), .B(addr_o[6]), .Y(n128) );
  NOR2 U131 ( .A(n99), .B(n103), .Y(n125) );
  NAND3 U132 ( .A(n97), .B(addr_o[7]), .C(addr_o[6]), .Y(n103) );
  NOR2 U133 ( .A(n129), .B(n130), .Y(n99) );
  NOR4BB U134 ( .AN(n97), .BN(n113), .C(n173), .D(n131), .Y(n130) );
  NOR3B U135 ( .AN(n132), .B(n133), .C(n134), .Y(n113) );
  MX2 U136 ( .A(n135), .B(n136), .S0(addr_o[0]), .Y(n86) );
  INV U137 ( .A(n114), .Y(n135) );
  MX2 U138 ( .A(n137), .B(n138), .S0(addr_o[1]), .Y(n85) );
  NOR2 U139 ( .A(n139), .B(n114), .Y(n137) );
  MX2 U140 ( .A(n140), .B(n141), .S0(addr_o[2]), .Y(n84) );
  OAI21 U141 ( .A0(addr_o[1]), .A1(n96), .B0(n142), .Y(n141) );
  INV U142 ( .A(n138), .Y(n142) );
  OAI21 U143 ( .A0(addr_o[0]), .A1(n96), .B0(n143), .Y(n138) );
  INV U144 ( .A(n136), .Y(n143) );
  NOR3 U145 ( .A(n139), .B(n144), .C(n114), .Y(n140) );
  MX2 U146 ( .A(n145), .B(n146), .S0(addr_o[3]), .Y(n83) );
  INV U147 ( .A(n147), .Y(n146) );
  NOR2B U148 ( .AN(n132), .B(n114), .Y(n145) );
  MX2 U149 ( .A(n148), .B(n149), .S0(addr_o[4]), .Y(n82) );
  INV U150 ( .A(n112), .Y(n149) );
  NOR2B U151 ( .AN(n147), .B(n150), .Y(n112) );
  NOR2 U152 ( .A(addr_o[3]), .B(n96), .Y(n150) );
  AOI2BB1 U153 ( .A0N(n132), .A1N(n96), .B0(n136), .Y(n147) );
  NOR3B U154 ( .AN(n132), .B(n134), .C(n114), .Y(n148) );
  NAND2B U155 ( .AN(n136), .B(n97), .Y(n114) );
  NOR3B U156 ( .AN(addr_o[2]), .B(n139), .C(n144), .Y(n132) );
  INV U157 ( .A(addr_o[0]), .Y(n139) );
  MX2 U158 ( .A(n151), .B(db_o[0]), .S0(n152), .Y(n81) );
  INV U159 ( .A(n153), .Y(n151) );
  AOI222 U160 ( .A0(n97), .A1(data_i[0]), .B0(addr_o[0]), .B1(n120), .C0(
        addr_o[6]), .C1(n121), .Y(n153) );
  MX2 U161 ( .A(n154), .B(db_o[1]), .S0(n152), .Y(n80) );
  OAI211 U162 ( .A0(n144), .A1(n109), .B0(n155), .C0(n116), .Y(n154) );
  AOI22 U163 ( .A0(n97), .A1(data_i[1]), .B0(addr_o[7]), .B1(n121), .Y(n155)
         );
  INV U164 ( .A(addr_o[1]), .Y(n144) );
  MX2 U165 ( .A(n156), .B(db_o[2]), .S0(n152), .Y(n79) );
  OAI211 U166 ( .A0(n157), .A1(n109), .B0(n158), .C0(n116), .Y(n156) );
  AOI22 U167 ( .A0(n97), .A1(data_i[2]), .B0(addr_o[8]), .B1(n121), .Y(n158)
         );
  INV U168 ( .A(n120), .Y(n109) );
  INV U169 ( .A(addr_o[2]), .Y(n157) );
  OAI211 U170 ( .A0(n134), .A1(n159), .B0(n160), .C0(n161), .Y(n78) );
  AOI22 U171 ( .A0(n152), .A1(db_o[3]), .B0(n162), .B1(data_i[3]), .Y(n160) );
  INV U172 ( .A(addr_o[3]), .Y(n134) );
  OAI211 U173 ( .A0(n133), .A1(n159), .B0(n163), .C0(n161), .Y(n77) );
  AOI22 U174 ( .A0(n152), .A1(db_o[4]), .B0(n162), .B1(data_i[4]), .Y(n163) );
  INV U175 ( .A(addr_o[4]), .Y(n133) );
  OAI211 U176 ( .A0(n131), .A1(n159), .B0(n164), .C0(n161), .Y(n76) );
  OAI21 U177 ( .A0(n165), .A1(n121), .B0(n166), .Y(n161) );
  INV U178 ( .A(n116), .Y(n165) );
  AOI22 U179 ( .A0(n152), .A1(db_o[5]), .B0(n162), .B1(data_i[5]), .Y(n164) );
  INV U180 ( .A(addr_o[5]), .Y(n131) );
  OAI2BB1 U181 ( .A0N(n162), .A1N(data_i[6]), .B0(n167), .Y(n75) );
  NOR2B U182 ( .AN(n159), .B(n168), .Y(n167) );
  NOR2B U183 ( .AN(db_o[6]), .B(n166), .Y(n168) );
  NAND2 U184 ( .A(n120), .B(n166), .Y(n159) );
  NOR2B U185 ( .AN(state[1]), .B(state[0]), .Y(n120) );
  INV U186 ( .A(n169), .Y(n74) );
  AOI21 U187 ( .A0(n162), .A1(data_i[7]), .B0(n170), .Y(n169) );
  MX2 U188 ( .A(n121), .B(db_o[7]), .S0(n152), .Y(n170) );
  NOR2B U189 ( .AN(state[0]), .B(state[1]), .Y(n121) );
  OAI2BB1 U190 ( .A0N(n152), .A1N(dori_o), .B0(n171), .Y(n73) );
  INV U191 ( .A(n162), .Y(n171) );
  NOR2B U192 ( .AN(n97), .B(n152), .Y(n162) );
  INV U193 ( .A(n166), .Y(n152) );
  OAI21 U194 ( .A0(rw_o), .A1(n173), .B0(n136), .Y(n166) );
  AOI21 U195 ( .A0(n97), .A1(en_o), .B0(n129), .Y(n136) );
  NOR2B U196 ( .AN(n172), .B(n116), .Y(n129) );
  NAND2 U197 ( .A(state[0]), .B(state[1]), .Y(n116) );
  NOR4BB U198 ( .AN(rw_o), .BN(start_history[1]), .C(start_i), .D(n173), .Y(
        n172) );
  INV U199 ( .A(en_o), .Y(n173) );
endmodule

