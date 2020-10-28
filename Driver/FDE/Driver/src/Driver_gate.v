
module Driver ( clk, rstn, start_i, addr_o, db_o, dori_o, cs_o, en_o, rw_o, 
        rst_o );
  output [9:0] addr_o;
  output [7:0] db_o;
  output [1:0] cs_o;
  input clk, rstn, start_i;
  output dori_o, en_o, rw_o, rst_o;
  wire   \*Logic0* , start_history, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166;
  wire   [7:0] ins;
  wire   [1:0] state;
  assign cs_o[1] = addr_o[9];

  DFFSHQ rst_o_reg ( .D(\*Logic0* ), .CK(clk), .SN(rstn), .Q(rst_o) );
  DFFRHQ en_o_reg ( .D(n166), .CK(clk), .RN(rstn), .Q(en_o) );
  DFFRHQ start_history_reg ( .D(start_i), .CK(clk), .RN(rstn), .Q(
        start_history) );
  DFFRHQ \y_reg[0]  ( .D(n88), .CK(clk), .RN(rstn), .Q(addr_o[0]) );
  DFFRHQ \x_reg[1]  ( .D(n83), .CK(clk), .RN(rstn), .Q(addr_o[7]) );
  DFFRHQ \x_reg[3]  ( .D(n85), .CK(clk), .RN(rstn), .Q(addr_o[9]) );
  DFFSHQ \state_reg[0]  ( .D(n81), .CK(clk), .SN(rstn), .Q(state[0]) );
  DFFRHQ \state_reg[1]  ( .D(n82), .CK(clk), .RN(rstn), .Q(state[1]) );
  DFFSHQ \state_reg[2]  ( .D(n86), .CK(clk), .SN(rstn), .Q(rw_o) );
  DFFRHQ \x_reg[0]  ( .D(n84), .CK(clk), .RN(rstn), .Q(addr_o[6]) );
  DFFRHQ \x_reg[2]  ( .D(n165), .CK(clk), .RN(rstn), .Q(addr_o[8]) );
  DFFRHQ \ins_reg[2]  ( .D(n68), .CK(clk), .RN(rstn), .Q(ins[2]) );
  DFFRHQ \ins_reg[0]  ( .D(n71), .CK(clk), .RN(rstn), .Q(ins[0]) );
  DFFRHQ \ins_reg[7]  ( .D(n73), .CK(clk), .RN(rstn), .Q(ins[7]) );
  DFFRHQ \ins_reg[5]  ( .D(n74), .CK(clk), .RN(rstn), .Q(ins[5]) );
  DFFRHQ \ins_reg[4]  ( .D(n75), .CK(clk), .RN(rstn), .Q(ins[4]) );
  DFFRHQ \ins_reg[3]  ( .D(n76), .CK(clk), .RN(rstn), .Q(ins[3]) );
  DFFRHQ dori_o_reg ( .D(n72), .CK(clk), .RN(rstn), .Q(dori_o) );
  DFFRHQ \y_reg[5]  ( .D(n87), .CK(clk), .RN(rstn), .Q(addr_o[5]) );
  DFFRHQ \y_reg[1]  ( .D(n80), .CK(clk), .RN(rstn), .Q(addr_o[1]) );
  DFFRHQ \y_reg[2]  ( .D(n79), .CK(clk), .RN(rstn), .Q(addr_o[2]) );
  DFFRHQ \y_reg[3]  ( .D(n78), .CK(clk), .RN(rstn), .Q(addr_o[3]) );
  DFFRHQ \y_reg[4]  ( .D(n77), .CK(clk), .RN(rstn), .Q(addr_o[4]) );
  DFFRHQ \ins_reg[6]  ( .D(n70), .CK(clk), .RN(rstn), .Q(ins[6]) );
  DFFRHQ \ins_reg[1]  ( .D(n69), .CK(clk), .RN(rstn), .Q(ins[1]) );
  LOGIC_0 U100 ( .LOGIC_0_PIN(\*Logic0* ) );
  MX2 U101 ( .A(n90), .B(n91), .S0(addr_o[8]), .Y(n165) );
  INV U102 ( .A(n92), .Y(n91) );
  NOR2 U103 ( .A(n93), .B(n94), .Y(n90) );
  INV U104 ( .A(en_o), .Y(n166) );
  MX2 U105 ( .A(n95), .B(n96), .S0(addr_o[0]), .Y(n88) );
  MX2 U106 ( .A(n97), .B(n98), .S0(addr_o[5]), .Y(n87) );
  OAI21 U107 ( .A0(addr_o[4]), .A1(n93), .B0(n99), .Y(n98) );
  NOR2B U108 ( .AN(addr_o[4]), .B(n100), .Y(n97) );
  OAI211 U109 ( .A0(n101), .A1(n102), .B0(n103), .C0(n104), .Y(n86) );
  OAI21 U110 ( .A0(state[1]), .A1(n101), .B0(rw_o), .Y(n103) );
  OAI2BB2 U111 ( .B0(n92), .B1(cs_o[0]), .A0N(n105), .A1N(n106), .Y(n85) );
  MX2 U112 ( .A(addr_o[9]), .B(n107), .S0(addr_o[8]), .Y(n106) );
  NOR2B U113 ( .AN(n108), .B(addr_o[9]), .Y(n107) );
  INV U114 ( .A(n94), .Y(n108) );
  OAI2BB1 U115 ( .A0N(n109), .A1N(n93), .B0(n94), .Y(n92) );
  NAND3 U116 ( .A(n109), .B(addr_o[7]), .C(addr_o[6]), .Y(n94) );
  MX2 U117 ( .A(n110), .B(n111), .S0(addr_o[6]), .Y(n84) );
  INV U118 ( .A(n109), .Y(n111) );
  NOR2B U119 ( .AN(n109), .B(n93), .Y(n110) );
  OAI2BB2 U120 ( .B0(n109), .B1(n112), .A0N(n105), .A1N(n113), .Y(n83) );
  MX2 U121 ( .A(addr_o[7]), .B(n114), .S0(addr_o[6]), .Y(n113) );
  NOR2B U122 ( .AN(n109), .B(addr_o[7]), .Y(n114) );
  NAND2B U123 ( .AN(n115), .B(n116), .Y(n82) );
  MX2 U124 ( .A(n117), .B(n118), .S0(n101), .Y(n116) );
  INV U125 ( .A(state[1]), .Y(n118) );
  NOR2 U126 ( .A(n119), .B(n120), .Y(n117) );
  NOR2B U127 ( .AN(n121), .B(n122), .Y(n120) );
  OAI211 U128 ( .A0(rw_o), .A1(n102), .B0(n123), .C0(n104), .Y(n81) );
  NAND3B U129 ( .AN(n101), .B(n105), .C(n122), .Y(n104) );
  NOR4BB U130 ( .AN(addr_o[6]), .BN(addr_o[8]), .C(n112), .D(cs_o[0]), .Y(n122) );
  INV U131 ( .A(addr_o[9]), .Y(cs_o[0]) );
  INV U132 ( .A(addr_o[7]), .Y(n112) );
  MX2 U133 ( .A(n124), .B(n125), .S0(n101), .Y(n123) );
  NOR2 U134 ( .A(n109), .B(n126), .Y(n101) );
  AOI2BB1 U135 ( .A0N(state[1]), .A1N(n127), .B0(en_o), .Y(n126) );
  NOR2B U136 ( .AN(state[0]), .B(rw_o), .Y(n127) );
  NOR2 U137 ( .A(n128), .B(n96), .Y(n109) );
  AOI31 U138 ( .A0(n129), .A1(addr_o[3]), .A2(n130), .B0(n131), .Y(n128) );
  NOR2B U139 ( .AN(addr_o[4]), .B(n132), .Y(n129) );
  INV U140 ( .A(addr_o[5]), .Y(n132) );
  AOI21 U141 ( .A0(rw_o), .A1(state[1]), .B0(n119), .Y(n124) );
  INV U142 ( .A(n133), .Y(n102) );
  MX2 U143 ( .A(n134), .B(n135), .S0(addr_o[1]), .Y(n80) );
  NOR2B U144 ( .AN(n95), .B(n136), .Y(n134) );
  MX2 U145 ( .A(n137), .B(n138), .S0(addr_o[2]), .Y(n79) );
  OAI21 U146 ( .A0(addr_o[1]), .A1(n93), .B0(n139), .Y(n138) );
  INV U147 ( .A(n135), .Y(n139) );
  OAI21 U148 ( .A0(addr_o[0]), .A1(n93), .B0(n140), .Y(n135) );
  INV U149 ( .A(n96), .Y(n140) );
  NOR3B U150 ( .AN(addr_o[1]), .B(n136), .C(n141), .Y(n137) );
  MX2 U151 ( .A(n142), .B(n143), .S0(addr_o[3]), .Y(n78) );
  INV U152 ( .A(n144), .Y(n143) );
  NOR2B U153 ( .AN(n130), .B(n141), .Y(n142) );
  INV U154 ( .A(n95), .Y(n141) );
  INV U155 ( .A(n145), .Y(n77) );
  MX2 U156 ( .A(n100), .B(n99), .S0(addr_o[4]), .Y(n145) );
  NOR2B U157 ( .AN(n144), .B(n146), .Y(n99) );
  NOR2 U158 ( .A(addr_o[3]), .B(n93), .Y(n146) );
  AOI2BB1 U159 ( .A0N(n130), .A1N(n93), .B0(n96), .Y(n144) );
  NAND3 U160 ( .A(addr_o[3]), .B(n130), .C(n95), .Y(n100) );
  NOR2 U161 ( .A(n96), .B(n93), .Y(n95) );
  INV U162 ( .A(n105), .Y(n93) );
  NOR2 U163 ( .A(n131), .B(n147), .Y(n96) );
  AOI2BB1 U164 ( .A0N(n148), .A1N(n119), .B0(en_o), .Y(n131) );
  NOR3B U165 ( .AN(addr_o[1]), .B(n136), .C(n149), .Y(n130) );
  INV U166 ( .A(addr_o[2]), .Y(n149) );
  INV U167 ( .A(addr_o[0]), .Y(n136) );
  OAI2BB1 U168 ( .A0N(ins[3]), .A1N(n150), .B0(n151), .Y(n76) );
  OAI2BB1 U169 ( .A0N(ins[4]), .A1N(n150), .B0(n151), .Y(n75) );
  OAI2BB1 U170 ( .A0N(ins[5]), .A1N(n150), .B0(n151), .Y(n74) );
  NAND2 U171 ( .A(n152), .B(n125), .Y(n151) );
  INV U172 ( .A(state[0]), .Y(n125) );
  MX2 U173 ( .A(ins[7]), .B(n153), .S0(n152), .Y(n73) );
  NOR2 U174 ( .A(state[0]), .B(n154), .Y(n153) );
  OAI2BB1 U175 ( .A0N(dori_o), .A1N(n150), .B0(n155), .Y(n72) );
  INV U176 ( .A(n147), .Y(n155) );
  NOR2B U177 ( .AN(n105), .B(en_o), .Y(n147) );
  NOR2B U178 ( .AN(n121), .B(rw_o), .Y(n105) );
  OAI2BB2 U179 ( .B0(n152), .B1(n156), .A0N(addr_o[6]), .A1N(n157), .Y(n71) );
  MX2 U180 ( .A(ins[6]), .B(n115), .S0(n152), .Y(n70) );
  NOR2B U181 ( .AN(state[0]), .B(n154), .Y(n115) );
  OAI2BB1 U182 ( .A0N(addr_o[7]), .A1N(n157), .B0(n158), .Y(n69) );
  AOI21 U183 ( .A0(ins[1]), .A1(n150), .B0(n159), .Y(n158) );
  OAI2BB1 U184 ( .A0N(addr_o[8]), .A1N(n157), .B0(n160), .Y(n68) );
  AOI21 U185 ( .A0(ins[2]), .A1(n150), .B0(n159), .Y(n160) );
  NOR2 U186 ( .A(n161), .B(n150), .Y(n159) );
  INV U187 ( .A(n152), .Y(n150) );
  AOI31 U188 ( .A0(n162), .A1(n161), .A2(n154), .B0(en_o), .Y(n152) );
  INV U189 ( .A(n119), .Y(n161) );
  NOR2B U190 ( .AN(n121), .B(n163), .Y(n119) );
  NOR2 U191 ( .A(state[1]), .B(state[0]), .Y(n121) );
  INV U192 ( .A(n148), .Y(n162) );
  NOR4BB U193 ( .AN(start_history), .BN(n133), .C(start_i), .D(n163), .Y(n148)
         );
  INV U194 ( .A(rw_o), .Y(n163) );
  NOR2B U195 ( .AN(state[0]), .B(state[1]), .Y(n133) );
  NOR3B U196 ( .AN(n164), .B(state[0]), .C(en_o), .Y(n157) );
  INV U197 ( .A(n154), .Y(n164) );
  NAND2B U198 ( .AN(rw_o), .B(state[1]), .Y(n154) );
  NOR2B U199 ( .AN(ins[7]), .B(dori_o), .Y(db_o[7]) );
  NOR2B U200 ( .AN(ins[6]), .B(dori_o), .Y(db_o[6]) );
  OR2 U201 ( .A(ins[5]), .B(dori_o), .Y(db_o[5]) );
  NOR2B U202 ( .AN(ins[4]), .B(dori_o), .Y(db_o[4]) );
  NOR2B U203 ( .AN(ins[3]), .B(dori_o), .Y(db_o[3]) );
  OR2 U204 ( .A(dori_o), .B(ins[2]), .Y(db_o[2]) );
  OR2 U205 ( .A(dori_o), .B(ins[1]), .Y(db_o[1]) );
  NOR2 U206 ( .A(dori_o), .B(n156), .Y(db_o[0]) );
  INV U207 ( .A(ins[0]), .Y(n156) );
endmodule

