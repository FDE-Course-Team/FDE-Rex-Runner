
module Driver ( clk, rstn, start_i, addr_o, db_o, dori_o, cs_o, en_o, rw_o );
  output [9:0] addr_o;
  output [7:0] db_o;
  output [1:0] cs_o;
  input clk, rstn, start_i;
  output dori_o, en_o, rw_o;
  wire   en_o, start_history, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64,
         n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78,
         n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92,
         n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136;
  wire   [7:0] ins;
  wire   [1:0] state;
  assign cs_o[1] = addr_o[9];
  assign en_o = clk;

  DFFRHQ start_history_reg ( .D(start_i), .CK(en_o), .RN(rstn), .Q(
        start_history) );
  DFFRHQ \y_reg[0]  ( .D(n71), .CK(en_o), .RN(rstn), .Q(addr_o[0]) );
  DFFRHQ \x_reg[0]  ( .D(n68), .CK(en_o), .RN(rstn), .Q(addr_o[6]) );
  DFFSHQ \state_reg[2]  ( .D(n65), .CK(en_o), .SN(rstn), .Q(rw_o) );
  DFFSHQ \state_reg[0]  ( .D(n64), .CK(en_o), .SN(rstn), .Q(state[0]) );
  DFFRHQ \state_reg[1]  ( .D(n63), .CK(en_o), .RN(rstn), .Q(state[1]) );
  DFFRHQ \x_reg[1]  ( .D(n67), .CK(en_o), .RN(rstn), .Q(addr_o[7]) );
  DFFRHQ \x_reg[2]  ( .D(n66), .CK(en_o), .RN(rstn), .Q(addr_o[8]) );
  DFFRHQ \x_reg[3]  ( .D(n69), .CK(en_o), .RN(rstn), .Q(addr_o[9]) );
  DFFRHQ \y_reg[2]  ( .D(n61), .CK(en_o), .RN(rstn), .Q(addr_o[2]) );
  DFFRHQ \y_reg[1]  ( .D(n62), .CK(en_o), .RN(rstn), .Q(addr_o[1]) );
  DFFRHQ \y_reg[3]  ( .D(n132), .CK(en_o), .RN(rstn), .Q(addr_o[3]) );
  DFFRHQ \y_reg[4]  ( .D(n60), .CK(en_o), .RN(rstn), .Q(addr_o[4]) );
  DFFRHQ \y_reg[5]  ( .D(n70), .CK(en_o), .RN(rstn), .Q(addr_o[5]) );
  DFFRHQ \ins_reg[2]  ( .D(n136), .CK(en_o), .RN(rstn), .Q(ins[2]) );
  DFFRHQ \ins_reg[1]  ( .D(n135), .CK(en_o), .RN(rstn), .Q(ins[1]) );
  DFFRHQ \ins_reg[5]  ( .D(n56), .CK(en_o), .RN(rstn), .Q(ins[5]) );
  DFFRHQ \ins_reg[4]  ( .D(n57), .CK(en_o), .RN(rstn), .Q(ins[4]) );
  DFFRHQ \ins_reg[3]  ( .D(n58), .CK(en_o), .RN(rstn), .Q(ins[3]) );
  DFFRHQ \ins_reg[6]  ( .D(n134), .CK(en_o), .RN(rstn), .Q(ins[6]) );
  DFFRHQ \ins_reg[7]  ( .D(n59), .CK(en_o), .RN(rstn), .Q(ins[7]) );
  DFFRHQ dori_o_reg ( .D(n133), .CK(en_o), .RN(rstn), .Q(dori_o) );
  DFFRHQ \ins_reg[0]  ( .D(n55), .CK(en_o), .RN(rstn), .Q(ins[0]) );
  INV U82 ( .A(n77), .Y(n72) );
  BUF U83 ( .I(n85), .O(n73) );
  MX2 U84 ( .A(n74), .B(n75), .S0(addr_o[3]), .Y(n132) );
  INV U85 ( .A(n76), .Y(n75) );
  NOR2 U86 ( .A(n77), .B(n78), .Y(n74) );
  INV U87 ( .A(n79), .Y(n133) );
  AOI31 U88 ( .A0(n80), .A1(n81), .A2(dori_o), .B0(n72), .Y(n79) );
  NOR2B U89 ( .AN(n83), .B(n84), .Y(n80) );
  OAI2BB1 U90 ( .A0N(n73), .A1N(ins[6]), .B0(n86), .Y(n134) );
  INV U91 ( .A(n87), .Y(n135) );
  AOI221 U92 ( .A0(n73), .A1(ins[1]), .B0(n88), .B1(addr_o[7]), .C0(n89), .Y(
        n87) );
  INV U93 ( .A(n90), .Y(n136) );
  AOI221 U94 ( .A0(n73), .A1(ins[2]), .B0(n88), .B1(addr_o[8]), .C0(n89), .Y(
        n90) );
  MX2 U95 ( .A(n81), .B(n72), .S0(n91), .Y(n71) );
  MX2 U96 ( .A(n92), .B(n93), .S0(addr_o[5]), .Y(n70) );
  INV U97 ( .A(n94), .Y(n93) );
  AOI2BB1 U98 ( .A0N(addr_o[4]), .A1N(n77), .B0(n95), .Y(n94) );
  NOR2B U99 ( .AN(n96), .B(n97), .Y(n92) );
  MX2 U100 ( .A(n98), .B(n99), .S0(cs_o[0]), .Y(n69) );
  INV U101 ( .A(addr_o[9]), .Y(cs_o[0]) );
  NOR3B U102 ( .AN(n100), .B(n101), .C(n102), .Y(n99) );
  OAI2BB1 U103 ( .A0N(n101), .A1N(n82), .B0(n103), .Y(n98) );
  MX2 U104 ( .A(n104), .B(n105), .S0(n106), .Y(n68) );
  NOR2 U105 ( .A(n77), .B(n104), .Y(n105) );
  MX2 U106 ( .A(n107), .B(n100), .S0(n102), .Y(n67) );
  MX2 U107 ( .A(n108), .B(n109), .S0(n101), .Y(n66) );
  INV U108 ( .A(addr_o[8]), .Y(n101) );
  NOR2B U109 ( .AN(n100), .B(n102), .Y(n109) );
  NOR3B U110 ( .AN(addr_o[6]), .B(n77), .C(n104), .Y(n100) );
  INV U111 ( .A(n103), .Y(n108) );
  AOI21 U112 ( .A0(n102), .A1(n82), .B0(n107), .Y(n103) );
  INV U113 ( .A(n110), .Y(n107) );
  AOI21 U114 ( .A0(n106), .A1(n82), .B0(n104), .Y(n110) );
  MX2 U115 ( .A(n111), .B(rw_o), .S0(n112), .Y(n65) );
  NAND2 U116 ( .A(n113), .B(n114), .Y(n111) );
  MX2 U117 ( .A(n115), .B(state[0]), .S0(n112), .Y(n64) );
  NAND2 U118 ( .A(n116), .B(n114), .Y(n115) );
  AOI21 U119 ( .A0(n82), .A1(n117), .B0(n118), .Y(n114) );
  NOR2B U120 ( .AN(n119), .B(n112), .Y(n63) );
  NOR3B U121 ( .AN(n104), .B(n84), .C(n118), .Y(n112) );
  AOI211 U122 ( .A0(n120), .A1(rw_o), .B0(n121), .C0(n122), .Y(n118) );
  AOI31 U123 ( .A0(addr_o[5]), .A1(n96), .A2(addr_o[4]), .B0(n123), .Y(n104)
         );
  OR2 U124 ( .A(n124), .B(n89), .Y(n123) );
  OAI211 U125 ( .A0(n117), .A1(n77), .B0(n116), .C0(n86), .Y(n119) );
  INV U126 ( .A(n89), .Y(n116) );
  NOR4BB U127 ( .AN(addr_o[8]), .BN(addr_o[9]), .C(n106), .D(n102), .Y(n117)
         );
  INV U128 ( .A(addr_o[7]), .Y(n102) );
  MX2 U129 ( .A(n125), .B(n126), .S0(addr_o[1]), .Y(n62) );
  INV U130 ( .A(n127), .Y(n126) );
  NOR2B U131 ( .AN(n82), .B(n91), .Y(n125) );
  MX2 U132 ( .A(n128), .B(n129), .S0(addr_o[2]), .Y(n61) );
  OAI21 U133 ( .A0(addr_o[1]), .A1(n77), .B0(n127), .Y(n129) );
  AOI21 U134 ( .A0(n91), .A1(n82), .B0(n81), .Y(n127) );
  NOR3B U135 ( .AN(addr_o[1]), .B(n77), .C(n91), .Y(n128) );
  INV U136 ( .A(addr_o[0]), .Y(n91) );
  MX2 U137 ( .A(n95), .B(n96), .S0(n97), .Y(n60) );
  INV U138 ( .A(addr_o[4]), .Y(n97) );
  NOR3B U139 ( .AN(addr_o[3]), .B(n77), .C(n78), .Y(n96) );
  OAI21 U140 ( .A0(addr_o[3]), .A1(n77), .B0(n76), .Y(n95) );
  AOI21 U141 ( .A0(n78), .A1(n82), .B0(n81), .Y(n76) );
  NOR3B U142 ( .AN(n77), .B(n89), .C(n124), .Y(n81) );
  NAND3 U143 ( .A(addr_o[0]), .B(addr_o[2]), .C(addr_o[1]), .Y(n78) );
  INV U144 ( .A(n82), .Y(n77) );
  NOR2B U145 ( .AN(n121), .B(rw_o), .Y(n82) );
  OAI2BB1 U146 ( .A0N(n73), .A1N(ins[7]), .B0(n83), .Y(n59) );
  OAI2BB1 U147 ( .A0N(n73), .A1N(ins[3]), .B0(n130), .Y(n58) );
  OAI2BB1 U148 ( .A0N(n73), .A1N(ins[4]), .B0(n130), .Y(n57) );
  OAI2BB1 U149 ( .A0N(n73), .A1N(ins[5]), .B0(n130), .Y(n56) );
  OAI2BB2 U150 ( .B0(n83), .B1(n106), .A0N(n73), .A1N(ins[0]), .Y(n55) );
  NOR3B U151 ( .AN(n130), .B(n84), .C(n124), .Y(n85) );
  NOR3B U152 ( .AN(start_history), .B(n113), .C(start_i), .Y(n124) );
  NAND3B U153 ( .AN(n131), .B(state[0]), .C(n120), .Y(n113) );
  INV U154 ( .A(state[1]), .Y(n120) );
  INV U155 ( .A(n86), .Y(n84) );
  NAND2 U156 ( .A(n122), .B(state[0]), .Y(n86) );
  NOR2B U157 ( .AN(n83), .B(n89), .Y(n130) );
  NOR2B U158 ( .AN(n121), .B(n131), .Y(n89) );
  INV U159 ( .A(rw_o), .Y(n131) );
  NOR2 U160 ( .A(state[1]), .B(state[0]), .Y(n121) );
  INV U161 ( .A(addr_o[6]), .Y(n106) );
  INV U162 ( .A(n88), .Y(n83) );
  NOR2B U163 ( .AN(n122), .B(state[0]), .Y(n88) );
  NOR2B U164 ( .AN(state[1]), .B(rw_o), .Y(n122) );
  NOR2B U165 ( .AN(ins[7]), .B(dori_o), .Y(db_o[7]) );
  NOR2B U166 ( .AN(ins[6]), .B(dori_o), .Y(db_o[6]) );
  OR2 U167 ( .A(dori_o), .B(ins[5]), .Y(db_o[5]) );
  NOR2B U168 ( .AN(ins[4]), .B(dori_o), .Y(db_o[4]) );
  NOR2B U169 ( .AN(ins[3]), .B(dori_o), .Y(db_o[3]) );
  OR2 U170 ( .A(dori_o), .B(ins[2]), .Y(db_o[2]) );
  OR2 U171 ( .A(dori_o), .B(ins[1]), .Y(db_o[1]) );
  NOR2B U172 ( .AN(ins[0]), .B(dori_o), .Y(db_o[0]) );
endmodule

