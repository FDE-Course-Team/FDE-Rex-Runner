
module Driver ( clk, rstn, start_i, addr_o, data_i, db_o, dori_o, cs_o, en_o, 
        rw_o, rst_o, state );
  output [9:0] addr_o;
  input [7:0] data_i;
  output [7:0] db_o;
  output [1:0] cs_o;
  output [2:0] state;
  input clk, rstn, start_i;
  output dori_o, en_o, rw_o, rst_o;
  wire   \*Logic0* , N92, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82,
         n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133, n134, n135, n136, n137, n138, n139, n140, n141,
         n142, n143, n144, n145, n146, n147, n148, n149, n150, n151, n152,
         n153, n154, n155, n156, n157, n158, n159, n160, n161, n162, n163,
         n164, n165, n166, n167, n168, n169, n170, n171, n172, n173, n174,
         n175, n176, n177, n178, n179, n180, n181;
  wire   [1:0] start_history;
  assign rw_o = \*Logic0* ;
  assign cs_o[1] = addr_o[9];

  EDFFHQ \start_history_reg[0]  ( .D(start_i), .E(rstn), .CK(clk), .Q(
        start_history[0]) );
  EDFFHQ \start_history_reg[1]  ( .D(start_history[0]), .E(rstn), .CK(clk), 
        .Q(start_history[1]) );
  DFFHQ rst_o_reg ( .D(n181), .CK(clk), .Q(rst_o) );
  DFFHQ en_o_reg ( .D(N92), .CK(clk), .Q(en_o) );
  DFFHQ \y_reg[5]  ( .D(n87), .CK(clk), .Q(addr_o[5]) );
  DFFHQ \y_reg[0]  ( .D(n84), .CK(clk), .Q(addr_o[0]) );
  DFFHQ \y_reg[1]  ( .D(n83), .CK(clk), .Q(addr_o[1]) );
  DFFHQ \y_reg[2]  ( .D(n82), .CK(clk), .Q(addr_o[2]) );
  DFFHQ \y_reg[3]  ( .D(n81), .CK(clk), .Q(addr_o[3]) );
  DFFHQ \y_reg[4]  ( .D(n80), .CK(clk), .Q(addr_o[4]) );
  DFFHQ \state_reg[1]  ( .D(n85), .CK(clk), .Q(state[1]) );
  DFFHQ \state_reg[2]  ( .D(n88), .CK(clk), .Q(state[2]) );
  DFFHQ \x_reg[0]  ( .D(n91), .CK(clk), .Q(addr_o[6]) );
  DFFHQ \x_reg[1]  ( .D(n90), .CK(clk), .Q(addr_o[7]) );
  DFFHQ \x_reg[2]  ( .D(n89), .CK(clk), .Q(addr_o[8]) );
  DFFHQ \x_reg[3]  ( .D(n92), .CK(clk), .Q(addr_o[9]) );
  DFFHQ \state_reg[0]  ( .D(n86), .CK(clk), .Q(state[0]) );
  DFFHQ \db_o_reg[7]  ( .D(n180), .CK(clk), .Q(db_o[7]) );
  DFFHQ dori_o_reg ( .D(n79), .CK(clk), .Q(dori_o) );
  DFFHQ \db_o_reg[0]  ( .D(n78), .CK(clk), .Q(db_o[0]) );
  DFFHQ \db_o_reg[1]  ( .D(n77), .CK(clk), .Q(db_o[1]) );
  DFFHQ \db_o_reg[2]  ( .D(n76), .CK(clk), .Q(db_o[2]) );
  DFFHQ \db_o_reg[6]  ( .D(n179), .CK(clk), .Q(db_o[6]) );
  DFFHQ \db_o_reg[3]  ( .D(n75), .CK(clk), .Q(db_o[3]) );
  DFFHQ \db_o_reg[4]  ( .D(n74), .CK(clk), .Q(db_o[4]) );
  DFFHQ \db_o_reg[5]  ( .D(n73), .CK(clk), .Q(db_o[5]) );
  INV U96 ( .A(n161), .Y(n93) );
  BUF U97 ( .I(n97), .O(n94) );
  BUF U98 ( .I(n123), .O(n95) );
  LOGIC_0 U99 ( .LOGIC_0_PIN(\*Logic0* ) );
  INV U100 ( .A(n96), .Y(n179) );
  AOI221 U101 ( .A0(db_o[6]), .A1(n94), .B0(data_i[6]), .B1(n98), .C0(n99), 
        .Y(n96) );
  INV U102 ( .A(n100), .Y(n180) );
  AOI222 U103 ( .A0(db_o[7]), .A1(n94), .B0(data_i[7]), .B1(n98), .C0(n101), 
        .C1(n102), .Y(n100) );
  MX2 U104 ( .A(n103), .B(n104), .S0(addr_o[9]), .Y(n92) );
  OAI2BB1 U105 ( .A0N(n105), .A1N(n106), .B0(n107), .Y(n104) );
  NOR3B U106 ( .AN(n108), .B(n105), .C(n109), .Y(n103) );
  MX2 U107 ( .A(n110), .B(n111), .S0(addr_o[6]), .Y(n91) );
  NOR2B U108 ( .AN(n106), .B(n111), .Y(n110) );
  MX2 U109 ( .A(n108), .B(n112), .S0(addr_o[7]), .Y(n90) );
  MX2 U110 ( .A(n113), .B(n114), .S0(addr_o[8]), .Y(n89) );
  INV U111 ( .A(n107), .Y(n114) );
  AOI21 U112 ( .A0(n109), .A1(n106), .B0(n112), .Y(n107) );
  OAI2BB1 U113 ( .A0N(n115), .A1N(n106), .B0(n116), .Y(n112) );
  INV U114 ( .A(n111), .Y(n116) );
  NOR2B U115 ( .AN(n108), .B(n109), .Y(n113) );
  NOR3B U116 ( .AN(n106), .B(n115), .C(n111), .Y(n108) );
  OAI21 U117 ( .A0(n117), .A1(n118), .B0(n119), .Y(n88) );
  MX2 U118 ( .A(n120), .B(n121), .S0(addr_o[5]), .Y(n87) );
  OAI2BB1 U119 ( .A0N(n122), .A1N(n95), .B0(n124), .Y(n121) );
  NOR2B U120 ( .AN(n95), .B(n125), .Y(n120) );
  NAND2 U121 ( .A(n126), .B(n119), .Y(n86) );
  MX2 U122 ( .A(n127), .B(n128), .S0(n118), .Y(n126) );
  AOI31 U123 ( .A0(addr_o[8]), .A1(addr_o[7]), .A2(n129), .B0(n130), .Y(n128)
         );
  NOR3B U124 ( .AN(addr_o[6]), .B(cs_o[0]), .C(n131), .Y(n129) );
  INV U125 ( .A(addr_o[9]), .Y(cs_o[0]) );
  INV U126 ( .A(n132), .Y(n85) );
  NOR3B U127 ( .AN(n119), .B(n133), .C(n134), .Y(n132) );
  MX2 U128 ( .A(state[1]), .B(n135), .S0(n118), .Y(n134) );
  OAI31 U129 ( .A0(n136), .A1(n181), .A2(n137), .B0(n118), .Y(n119) );
  OAI21 U130 ( .A0(n138), .A1(n139), .B0(n111), .Y(n118) );
  NOR2B U131 ( .AN(n140), .B(n141), .Y(n111) );
  NOR4BB U132 ( .AN(en_o), .BN(n135), .C(n142), .D(n125), .Y(n141) );
  NAND3B U133 ( .AN(n143), .B(addr_o[3]), .C(addr_o[4]), .Y(n125) );
  NOR4BB U134 ( .AN(n144), .BN(n145), .C(n130), .D(n136), .Y(n138) );
  NOR2B U135 ( .AN(state[2]), .B(n146), .Y(n136) );
  MX2 U136 ( .A(n95), .B(n147), .S0(addr_o[0]), .Y(n84) );
  MX2 U137 ( .A(n148), .B(n149), .S0(addr_o[1]), .Y(n83) );
  NOR2B U138 ( .AN(n95), .B(n150), .Y(n148) );
  MX2 U139 ( .A(n151), .B(n152), .S0(addr_o[2]), .Y(n82) );
  OAI2BB1 U140 ( .A0N(n153), .A1N(n95), .B0(n154), .Y(n152) );
  INV U141 ( .A(n149), .Y(n154) );
  OAI2BB1 U142 ( .A0N(n150), .A1N(n95), .B0(n155), .Y(n149) );
  NOR3B U143 ( .AN(n95), .B(n153), .C(n150), .Y(n151) );
  MX2 U144 ( .A(n156), .B(n157), .S0(addr_o[3]), .Y(n81) );
  NOR2B U145 ( .AN(n95), .B(n143), .Y(n156) );
  MX2 U146 ( .A(n158), .B(n159), .S0(addr_o[4]), .Y(n80) );
  INV U147 ( .A(n124), .Y(n159) );
  AOI21 U148 ( .A0(n160), .A1(n95), .B0(n157), .Y(n124) );
  OAI2BB1 U149 ( .A0N(n143), .A1N(n95), .B0(n155), .Y(n157) );
  NOR3B U150 ( .AN(n95), .B(n160), .C(n143), .Y(n158) );
  NAND3 U151 ( .A(addr_o[2]), .B(addr_o[1]), .C(addr_o[0]), .Y(n143) );
  NOR2B U152 ( .AN(n106), .B(n147), .Y(n123) );
  INV U153 ( .A(n155), .Y(n147) );
  NOR2B U154 ( .AN(n135), .B(n181), .Y(n106) );
  OAI2BB1 U155 ( .A0N(dori_o), .A1N(n94), .B0(n161), .Y(n79) );
  INV U156 ( .A(n98), .Y(n161) );
  INV U157 ( .A(n162), .Y(n78) );
  AOI222 U158 ( .A0(db_o[0]), .A1(n94), .B0(n102), .B1(n163), .C0(data_i[0]), 
        .C1(n98), .Y(n162) );
  OAI221 U159 ( .A0(n144), .A1(n115), .B0(n164), .B1(n150), .C0(n145), .Y(n163) );
  INV U160 ( .A(addr_o[0]), .Y(n150) );
  INV U161 ( .A(addr_o[6]), .Y(n115) );
  INV U162 ( .A(n165), .Y(n77) );
  AOI222 U163 ( .A0(db_o[1]), .A1(n94), .B0(n102), .B1(n166), .C0(data_i[1]), 
        .C1(n98), .Y(n165) );
  OAI221 U164 ( .A0(n144), .A1(n109), .B0(n164), .B1(n153), .C0(n167), .Y(n166) );
  INV U165 ( .A(addr_o[1]), .Y(n153) );
  INV U166 ( .A(addr_o[7]), .Y(n109) );
  INV U167 ( .A(n168), .Y(n76) );
  AOI222 U168 ( .A0(db_o[2]), .A1(n94), .B0(n102), .B1(n169), .C0(data_i[2]), 
        .C1(n98), .Y(n168) );
  OAI221 U169 ( .A0(n144), .A1(n105), .B0(n164), .B1(n170), .C0(n167), .Y(n169) );
  INV U170 ( .A(addr_o[2]), .Y(n170) );
  INV U171 ( .A(addr_o[8]), .Y(n105) );
  OAI211 U172 ( .A0(n160), .A1(n171), .B0(n172), .C0(n173), .Y(n75) );
  AOI22 U173 ( .A0(data_i[3]), .A1(n98), .B0(db_o[3]), .B1(n94), .Y(n173) );
  INV U174 ( .A(addr_o[3]), .Y(n160) );
  OAI211 U175 ( .A0(n122), .A1(n171), .B0(n172), .C0(n174), .Y(n74) );
  AOI22 U176 ( .A0(data_i[4]), .A1(n98), .B0(db_o[4]), .B1(n94), .Y(n174) );
  INV U177 ( .A(addr_o[4]), .Y(n122) );
  OAI211 U178 ( .A0(n142), .A1(n171), .B0(n172), .C0(n175), .Y(n73) );
  AOI22 U179 ( .A0(data_i[5]), .A1(n93), .B0(db_o[5]), .B1(n94), .Y(n175) );
  NOR2B U180 ( .AN(n102), .B(n131), .Y(n98) );
  OAI2BB1 U181 ( .A0N(n144), .A1N(n167), .B0(n102), .Y(n172) );
  NOR2B U182 ( .AN(n145), .B(n133), .Y(n167) );
  INV U183 ( .A(n137), .Y(n145) );
  INV U184 ( .A(n101), .Y(n144) );
  INV U185 ( .A(n99), .Y(n171) );
  NOR2B U186 ( .AN(n102), .B(n164), .Y(n99) );
  INV U187 ( .A(n130), .Y(n164) );
  NOR2B U188 ( .AN(rstn), .B(n94), .Y(n102) );
  NOR2B U189 ( .AN(n176), .B(n155), .Y(n97) );
  OAI21 U190 ( .A0(n139), .A1(n131), .B0(n140), .Y(n155) );
  AOI31 U191 ( .A0(n177), .A1(n178), .A2(n133), .B0(n181), .Y(n140) );
  INV U192 ( .A(rstn), .Y(n181) );
  NOR2B U193 ( .AN(n146), .B(n117), .Y(n133) );
  INV U194 ( .A(state[2]), .Y(n117) );
  INV U195 ( .A(start_i), .Y(n178) );
  NOR2B U196 ( .AN(start_history[1]), .B(n139), .Y(n177) );
  INV U197 ( .A(n135), .Y(n131) );
  NOR3B U198 ( .AN(n127), .B(state[2]), .C(state[1]), .Y(n135) );
  INV U199 ( .A(en_o), .Y(n139) );
  OAI31 U200 ( .A0(n137), .A1(n130), .A2(n101), .B0(en_o), .Y(n176) );
  NOR3B U201 ( .AN(state[0]), .B(state[2]), .C(state[1]), .Y(n101) );
  NOR3B U202 ( .AN(state[1]), .B(state[2]), .C(state[0]), .Y(n130) );
  NOR2B U203 ( .AN(n146), .B(state[2]), .Y(n137) );
  NOR2B U204 ( .AN(state[1]), .B(n127), .Y(n146) );
  INV U205 ( .A(state[0]), .Y(n127) );
  INV U206 ( .A(addr_o[5]), .Y(n142) );
  NOR2B U207 ( .AN(rstn), .B(en_o), .Y(N92) );
endmodule

