
module Driver ( clk, rstn, start_i, addr_o, data_i, db_o, dori_o, cs_o, en_o, 
        rw_o, rst_o );
  output [9:0] addr_o;
  input [7:0] data_i;
  output [7:0] db_o;
  output [1:0] cs_o;
  input clk, rstn, start_i;
  output dori_o, en_o, rw_o, rst_o;
  wire   \*Logic0* , n180, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n97, n98, n99,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173, n174, n175, n176, n177,
         n178;
  wire   [7:0] ins;
  wire   [1:0] state;
  wire   [1:0] start_history;
  assign cs_o[1] = addr_o[9];

  DFFRHQ \start_history_reg[0]  ( .D(start_i), .CK(clk), .RN(rstn), .Q(
        start_history[0]) );
  DFFRHQ \start_history_reg[1]  ( .D(start_history[0]), .CK(clk), .RN(rstn), 
        .Q(start_history[1]) );
  DFFRHQ en_o_reg ( .D(n178), .CK(clk), .RN(rstn), .Q(en_o) );
  DFFSHQ rst_o_reg ( .D(\*Logic0* ), .CK(clk), .SN(rstn), .Q(rst_o) );
  DFFRHQ \x_reg[0]  ( .D(n95), .CK(clk), .RN(rstn), .Q(addr_o[6]) );
  DFFRHQ \x_reg[2]  ( .D(n78), .CK(clk), .RN(rstn), .Q(addr_o[8]) );
  DFFRHQ \x_reg[3]  ( .D(n94), .CK(clk), .RN(rstn), .Q(addr_o[9]) );
  DFFSHQ \state_reg[2]  ( .D(n92), .CK(clk), .SN(rstn), .Q(rw_o) );
  DFFRHQ \state_reg[1]  ( .D(n91), .CK(clk), .RN(rstn), .Q(state[1]) );
  DFFRHQ \y_reg[5]  ( .D(n90), .CK(clk), .RN(rstn), .Q(addr_o[5]) );
  DFFSHQ \state_reg[0]  ( .D(n93), .CK(clk), .SN(rstn), .Q(state[0]) );
  DFFRHQ \x_reg[1]  ( .D(n177), .CK(clk), .RN(rstn), .Q(addr_o[7]) );
  DFFRHQ \y_reg[0]  ( .D(n89), .CK(clk), .RN(rstn), .Q(addr_o[0]) );
  DFFRHQ \y_reg[1]  ( .D(n88), .CK(clk), .RN(rstn), .Q(addr_o[1]) );
  DFFRHQ \y_reg[2]  ( .D(n87), .CK(clk), .RN(rstn), .Q(addr_o[2]) );
  DFFRHQ \y_reg[3]  ( .D(n86), .CK(clk), .RN(rstn), .Q(addr_o[3]) );
  DFFRHQ \y_reg[4]  ( .D(n85), .CK(clk), .RN(rstn), .Q(addr_o[4]) );
  DFFRHQ dori_o_reg ( .D(n75), .CK(clk), .RN(rstn), .Q(n180) );
  DFFRHQ \ins_reg[6]  ( .D(n81), .CK(clk), .RN(rstn), .Q(ins[6]) );
  DFFRHQ \ins_reg[0]  ( .D(n79), .CK(clk), .RN(rstn), .Q(ins[0]) );
  DFFRHQ \ins_reg[2]  ( .D(n76), .CK(clk), .RN(rstn), .Q(ins[2]) );
  DFFRHQ \ins_reg[1]  ( .D(n77), .CK(clk), .RN(rstn), .Q(ins[1]) );
  DFFRHQ \ins_reg[7]  ( .D(n80), .CK(clk), .RN(rstn), .Q(ins[7]) );
  DFFRHQ \ins_reg[3]  ( .D(n84), .CK(clk), .RN(rstn), .Q(ins[3]) );
  DFFRHQ \ins_reg[4]  ( .D(n83), .CK(clk), .RN(rstn), .Q(ins[4]) );
  DFFRHQ \ins_reg[5]  ( .D(n82), .CK(clk), .RN(rstn), .Q(ins[5]) );
  OR3 U107 ( .A(state[1]), .B(rw_o), .C(state[0]), .Y(n97) );
  INV U108 ( .A(n97), .Y(n98) );
  INV U109 ( .A(n180), .Y(n99) );
  INV U110 ( .A(n99), .Y(dori_o) );
  INV U111 ( .A(n152), .Y(n101) );
  INV U112 ( .A(n101), .Y(n102) );
  LOGIC_0 U113 ( .LOGIC_0_PIN(\*Logic0* ) );
  MX2 U114 ( .A(n103), .B(n104), .S0(addr_o[7]), .Y(n177) );
  NOR2B U115 ( .AN(addr_o[6]), .B(n105), .Y(n103) );
  INV U116 ( .A(addr_o[9]), .Y(cs_o[0]) );
  MX2 U117 ( .A(n106), .B(n107), .S0(addr_o[6]), .Y(n95) );
  INV U118 ( .A(n108), .Y(n107) );
  INV U119 ( .A(n105), .Y(n106) );
  MX2 U120 ( .A(n109), .B(n110), .S0(addr_o[9]), .Y(n94) );
  NAND2B U121 ( .AN(n111), .B(n108), .Y(n110) );
  NOR2B U122 ( .AN(n112), .B(n105), .Y(n109) );
  MX2 U123 ( .A(n113), .B(state[0]), .S0(n114), .Y(n93) );
  OAI211 U124 ( .A0(addr_o[9]), .A1(n97), .B0(n115), .C0(n116), .Y(n113) );
  NOR2 U125 ( .A(n111), .B(n117), .Y(n115) );
  NOR2 U126 ( .A(n112), .B(n97), .Y(n111) );
  NAND2B U127 ( .AN(n118), .B(n119), .Y(n92) );
  MX2 U128 ( .A(n120), .B(n121), .S0(n114), .Y(n119) );
  INV U129 ( .A(rw_o), .Y(n121) );
  AOI31 U130 ( .A0(addr_o[9]), .A1(n98), .A2(n112), .B0(n122), .Y(n120) );
  NOR3B U131 ( .AN(addr_o[8]), .B(n123), .C(n124), .Y(n112) );
  MX2 U132 ( .A(n125), .B(state[1]), .S0(n114), .Y(n91) );
  AOI211 U133 ( .A0(en_o), .A1(n122), .B0(n108), .C0(n126), .Y(n114) );
  INV U134 ( .A(n116), .Y(n122) );
  OAI211 U135 ( .A0(rw_o), .A1(state[0]), .B0(n127), .C0(n128), .Y(n116) );
  OAI21 U136 ( .A0(state[1]), .A1(state[0]), .B0(n129), .Y(n125) );
  MX2 U137 ( .A(n130), .B(n131), .S0(addr_o[5]), .Y(n90) );
  OAI21 U138 ( .A0(addr_o[4]), .A1(n97), .B0(n132), .Y(n131) );
  NOR2B U139 ( .AN(n133), .B(n134), .Y(n130) );
  INV U140 ( .A(addr_o[4]), .Y(n134) );
  MX2 U141 ( .A(n135), .B(n136), .S0(addr_o[0]), .Y(n89) );
  INV U142 ( .A(n137), .Y(n136) );
  INV U143 ( .A(n138), .Y(n135) );
  MX2 U144 ( .A(n139), .B(n140), .S0(addr_o[1]), .Y(n88) );
  NOR2B U145 ( .AN(addr_o[0]), .B(n138), .Y(n139) );
  MX2 U146 ( .A(n141), .B(n142), .S0(addr_o[2]), .Y(n87) );
  OAI21 U147 ( .A0(addr_o[1]), .A1(n97), .B0(n143), .Y(n142) );
  INV U148 ( .A(n140), .Y(n143) );
  OAI21 U149 ( .A0(addr_o[0]), .A1(n97), .B0(n137), .Y(n140) );
  NOR3B U150 ( .AN(addr_o[1]), .B(n144), .C(n138), .Y(n141) );
  MX2 U151 ( .A(n145), .B(n146), .S0(addr_o[3]), .Y(n86) );
  NOR2 U152 ( .A(n147), .B(n138), .Y(n145) );
  MX2 U153 ( .A(n133), .B(n148), .S0(addr_o[4]), .Y(n85) );
  INV U154 ( .A(n132), .Y(n148) );
  AOI2BB1 U155 ( .A0N(addr_o[3]), .A1N(n97), .B0(n146), .Y(n132) );
  OAI2BB1 U156 ( .A0N(n98), .A1N(n147), .B0(n137), .Y(n146) );
  NOR3 U157 ( .A(n149), .B(n147), .C(n138), .Y(n133) );
  OAI2BB1 U158 ( .A0N(addr_o[3]), .A1N(n150), .B0(n151), .Y(n84) );
  AOI21 U159 ( .A0(n102), .A1(ins[3]), .B0(n153), .Y(n151) );
  OAI2BB1 U160 ( .A0N(addr_o[4]), .A1N(n150), .B0(n154), .Y(n83) );
  AOI21 U161 ( .A0(n102), .A1(ins[4]), .B0(n153), .Y(n154) );
  OAI2BB1 U162 ( .A0N(addr_o[5]), .A1N(n150), .B0(n155), .Y(n82) );
  AOI21 U163 ( .A0(n102), .A1(ins[5]), .B0(n153), .Y(n155) );
  AOI2BB1 U164 ( .A0N(n117), .A1N(n156), .B0(n178), .Y(n153) );
  OAI2BB1 U165 ( .A0N(n102), .A1N(ins[6]), .B0(n157), .Y(n81) );
  INV U166 ( .A(n150), .Y(n157) );
  NOR2 U167 ( .A(n102), .B(n129), .Y(n150) );
  MX2 U168 ( .A(n156), .B(ins[7]), .S0(n102), .Y(n80) );
  MX2 U169 ( .A(n158), .B(ins[0]), .S0(n102), .Y(n79) );
  OAI2BB1 U170 ( .A0N(addr_o[6]), .A1N(n156), .B0(n159), .Y(n158) );
  AOI2BB2 U171 ( .B0(n117), .B1(n160), .A0N(n129), .A1N(n144), .Y(n159) );
  INV U172 ( .A(addr_o[0]), .Y(n144) );
  INV U173 ( .A(state[1]), .Y(n160) );
  MX2 U174 ( .A(n161), .B(n162), .S0(addr_o[8]), .Y(n78) );
  OAI21 U175 ( .A0(addr_o[7]), .A1(n97), .B0(n163), .Y(n162) );
  INV U176 ( .A(n104), .Y(n163) );
  OAI21 U177 ( .A0(addr_o[6]), .A1(n97), .B0(n108), .Y(n104) );
  NOR3 U178 ( .A(n105), .B(n123), .C(n124), .Y(n161) );
  INV U179 ( .A(addr_o[7]), .Y(n124) );
  INV U180 ( .A(addr_o[6]), .Y(n123) );
  NAND2 U181 ( .A(n98), .B(n108), .Y(n105) );
  NOR2B U182 ( .AN(n137), .B(n164), .Y(n108) );
  NOR2B U183 ( .AN(n165), .B(n166), .Y(n164) );
  NOR4BB U184 ( .AN(addr_o[4]), .BN(addr_o[5]), .C(n149), .D(n147), .Y(n166)
         );
  NAND3 U185 ( .A(addr_o[0]), .B(addr_o[2]), .C(addr_o[1]), .Y(n147) );
  INV U186 ( .A(addr_o[3]), .Y(n149) );
  MX2 U187 ( .A(n167), .B(ins[1]), .S0(n102), .Y(n77) );
  INV U188 ( .A(n168), .Y(n167) );
  AOI211 U189 ( .A0(addr_o[7]), .A1(n156), .B0(n117), .C0(n169), .Y(n168) );
  NOR2B U190 ( .AN(addr_o[1]), .B(n129), .Y(n169) );
  MX2 U191 ( .A(n170), .B(ins[2]), .S0(n102), .Y(n76) );
  AOI21 U192 ( .A0(en_o), .A1(n118), .B0(n126), .Y(n152) );
  NOR2 U193 ( .A(n128), .B(n171), .Y(n118) );
  INV U194 ( .A(n172), .Y(n128) );
  INV U195 ( .A(n173), .Y(n170) );
  AOI211 U196 ( .A0(addr_o[8]), .A1(n156), .B0(n117), .C0(n174), .Y(n173) );
  NOR2B U197 ( .AN(addr_o[2]), .B(n129), .Y(n174) );
  NAND2B U198 ( .AN(n127), .B(state[0]), .Y(n129) );
  NOR2B U199 ( .AN(rw_o), .B(state[0]), .Y(n117) );
  NOR2 U200 ( .A(state[0]), .B(n127), .Y(n156) );
  NAND2B U201 ( .AN(rw_o), .B(state[1]), .Y(n127) );
  OAI31 U202 ( .A0(n126), .A1(n137), .A2(n99), .B0(n138), .Y(n75) );
  NAND2 U203 ( .A(n98), .B(n137), .Y(n138) );
  OAI2BB1 U204 ( .A0N(en_o), .A1N(n98), .B0(n165), .Y(n137) );
  OAI211 U205 ( .A0(n175), .A1(n171), .B0(en_o), .C0(n172), .Y(n165) );
  NOR2B U206 ( .AN(rw_o), .B(state[1]), .Y(n172) );
  NOR2B U207 ( .AN(start_history[1]), .B(start_i), .Y(n175) );
  NOR2B U208 ( .AN(n176), .B(n178), .Y(n126) );
  INV U209 ( .A(en_o), .Y(n178) );
  MX2 U210 ( .A(state[1]), .B(n171), .S0(rw_o), .Y(n176) );
  INV U211 ( .A(state[0]), .Y(n171) );
  MX2 U212 ( .A(ins[7]), .B(data_i[7]), .S0(dori_o), .Y(db_o[7]) );
  MX2 U213 ( .A(ins[6]), .B(data_i[6]), .S0(dori_o), .Y(db_o[6]) );
  MX2 U214 ( .A(ins[5]), .B(data_i[5]), .S0(dori_o), .Y(db_o[5]) );
  MX2 U215 ( .A(ins[4]), .B(data_i[4]), .S0(dori_o), .Y(db_o[4]) );
  MX2 U216 ( .A(ins[3]), .B(data_i[3]), .S0(dori_o), .Y(db_o[3]) );
  MX2 U217 ( .A(ins[2]), .B(data_i[2]), .S0(dori_o), .Y(db_o[2]) );
  MX2 U218 ( .A(ins[1]), .B(data_i[1]), .S0(dori_o), .Y(db_o[1]) );
  MX2 U219 ( .A(ins[0]), .B(data_i[0]), .S0(dori_o), .Y(db_o[0]) );
endmodule

