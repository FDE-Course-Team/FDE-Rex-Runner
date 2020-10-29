
module FDE_Rex_Runner ( clk, rstn, start_i, db_o, dori_o, cs_o, en_o, rw_o, 
        rst_o, state );
  output [7:0] db_o;
  output [3:0] cs_o;
  output [2:0] state;
  input clk, rstn, start_i;
  output dori_o, en_o, rw_o, rst_o;
  wire   \driver/N93 , \driver/N46 , \driver/N45 , \driver/N44 , \driver/N43 ,
         \driver/*Logic0* , n327, n328, n329, n330, n331, n332, n343, n344,
         n345, n346, n347, n348, n349, n350, n351, n352, n353, n354, n355,
         n356, n357, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437;
  wire   [10:0] addrD;
  wire   [1:0] \driver/start_history ;
  assign rw_o = \driver/*Logic0* ;

  DFFHQ \driver/en_o_reg  ( .D(\driver/N93 ), .CK(clk), .Q(en_o) );
  DFFHQ \driver/rst_o_reg  ( .D(n437), .CK(clk), .Q(rst_o) );
  EDFFHQ \driver/start_history_reg[0]  ( .D(start_i), .E(rstn), .CK(clk), .Q(
        \driver/start_history [0]) );
  EDFFHQ \driver/start_history_reg[1]  ( .D(\driver/start_history [0]), .E(
        rstn), .CK(clk), .Q(\driver/start_history [1]) );
  DFFHQ \driver/y_reg[5]  ( .D(n357), .CK(clk), .Q(addrD[5]) );
  DFFHQ \driver/y_reg[0]  ( .D(n356), .CK(clk), .Q(addrD[0]) );
  DFFHQ \driver/y_reg[1]  ( .D(n355), .CK(clk), .Q(addrD[1]) );
  DFFHQ \driver/y_reg[2]  ( .D(n354), .CK(clk), .Q(addrD[2]) );
  DFFHQ \driver/y_reg[3]  ( .D(n353), .CK(clk), .Q(addrD[3]) );
  DFFHQ \driver/y_reg[4]  ( .D(n352), .CK(clk), .Q(addrD[4]) );
  DFFHQ \driver/x_reg[4]  ( .D(n351), .CK(clk), .Q(addrD[10]) );
  DFFHQ \driver/x_reg[0]  ( .D(n350), .CK(clk), .Q(addrD[6]) );
  DFFHQ \driver/x_reg[1]  ( .D(n349), .CK(clk), .Q(addrD[7]) );
  DFFHQ \driver/x_reg[2]  ( .D(n348), .CK(clk), .Q(addrD[8]) );
  DFFHQ \driver/x_reg[3]  ( .D(n347), .CK(clk), .Q(addrD[9]) );
  DFFHQ \driver/state_reg[0]  ( .D(n345), .CK(clk), .Q(state[0]) );
  DFFHQ \driver/state_reg[1]  ( .D(n344), .CK(clk), .Q(state[1]) );
  DFFHQ \driver/state_reg[2]  ( .D(n346), .CK(clk), .Q(state[2]) );
  DFFHQ \driver/dori_o_reg  ( .D(n343), .CK(clk), .Q(dori_o) );
  DFFHQ \driver/db_o_reg[7]  ( .D(n327), .CK(clk), .Q(db_o[7]) );
  DFFHQ \driver/db_o_reg[1]  ( .D(n436), .CK(clk), .Q(db_o[1]) );
  DFFHQ \driver/db_o_reg[0]  ( .D(n435), .CK(clk), .Q(db_o[0]) );
  DFFHQ \driver/db_o_reg[4]  ( .D(n330), .CK(clk), .Q(db_o[4]) );
  DFFHQ \driver/db_o_reg[5]  ( .D(n329), .CK(clk), .Q(db_o[5]) );
  DFFHQ \driver/db_o_reg[6]  ( .D(n328), .CK(clk), .Q(db_o[6]) );
  DFFHQ \driver/db_o_reg[2]  ( .D(n332), .CK(clk), .Q(db_o[2]) );
  DFFHQ \driver/db_o_reg[3]  ( .D(n331), .CK(clk), .Q(db_o[3]) );
  AND2 U284 ( .A(addrD[7]), .B(addrD[6]), .Y(n361) );
  AND2 U285 ( .A(addrD[8]), .B(n361), .Y(n362) );
  AND2 U286 ( .A(addrD[9]), .B(n362), .Y(n363) );
  INV U287 ( .A(n376), .Y(n364) );
  BUF U288 ( .I(n370), .O(n365) );
  LOGIC_0 U289 ( .LOGIC_0_PIN(\driver/*Logic0* ) );
  XOR2 U290 ( .A(addrD[7]), .B(addrD[6]), .Y(\driver/N43 ) );
  XOR2 U291 ( .A(addrD[8]), .B(n361), .Y(\driver/N44 ) );
  XOR2 U292 ( .A(addrD[9]), .B(n362), .Y(\driver/N45 ) );
  XOR2 U293 ( .A(addrD[10]), .B(n363), .Y(\driver/N46 ) );
  OAI211 U294 ( .A0(n366), .A1(n367), .B0(n368), .C0(n369), .Y(n435) );
  AOI22 U295 ( .A0(db_o[0]), .A1(n365), .B0(n371), .B1(addrD[0]), .Y(n369) );
  OAI211 U296 ( .A0(n366), .A1(n372), .B0(n368), .C0(n373), .Y(n436) );
  AOI22 U297 ( .A0(db_o[1]), .A1(n365), .B0(n371), .B1(addrD[1]), .Y(n373) );
  MX2 U298 ( .A(n374), .B(n375), .S0(addrD[5]), .Y(n357) );
  OAI21 U299 ( .A0(addrD[4]), .A1(n376), .B0(n377), .Y(n375) );
  NOR2B U300 ( .AN(n378), .B(n376), .Y(n374) );
  MX2 U301 ( .A(n379), .B(n380), .S0(n381), .Y(n356) );
  MX2 U302 ( .A(n382), .B(n383), .S0(addrD[1]), .Y(n355) );
  INV U303 ( .A(n384), .Y(n383) );
  NOR2B U304 ( .AN(n380), .B(n381), .Y(n382) );
  MX2 U305 ( .A(n385), .B(n386), .S0(addrD[2]), .Y(n354) );
  OAI21 U306 ( .A0(addrD[1]), .A1(n376), .B0(n384), .Y(n386) );
  AOI21 U307 ( .A0(n381), .A1(n380), .B0(n379), .Y(n384) );
  NOR3B U308 ( .AN(addrD[1]), .B(n376), .C(n381), .Y(n385) );
  INV U309 ( .A(addrD[0]), .Y(n381) );
  MX2 U310 ( .A(n387), .B(n388), .S0(addrD[3]), .Y(n353) );
  NOR2B U311 ( .AN(n380), .B(n389), .Y(n387) );
  MX2 U312 ( .A(n390), .B(n391), .S0(addrD[4]), .Y(n352) );
  INV U313 ( .A(n377), .Y(n391) );
  AOI2BB1 U314 ( .A0N(addrD[3]), .A1N(n376), .B0(n388), .Y(n377) );
  OAI2BB1 U315 ( .A0N(n389), .A1N(n364), .B0(n392), .Y(n388) );
  NOR3B U316 ( .AN(addrD[3]), .B(n376), .C(n389), .Y(n390) );
  INV U317 ( .A(n380), .Y(n376) );
  NOR3 U318 ( .A(n379), .B(n437), .C(n393), .Y(n380) );
  INV U319 ( .A(n392), .Y(n379) );
  OAI2BB2 U320 ( .B0(n394), .B1(n395), .A0N(\driver/N46 ), .A1N(n396), .Y(n351) );
  MX2 U321 ( .A(n397), .B(n396), .S0(n367), .Y(n350) );
  OAI2BB2 U322 ( .B0(n372), .B1(n394), .A0N(\driver/N43 ), .A1N(n396), .Y(n349) );
  OAI2BB2 U323 ( .B0(n394), .B1(n398), .A0N(\driver/N44 ), .A1N(n396), .Y(n348) );
  OAI2BB2 U324 ( .B0(n394), .B1(n399), .A0N(\driver/N45 ), .A1N(n396), .Y(n347) );
  NOR3B U325 ( .AN(n394), .B(n437), .C(n393), .Y(n396) );
  OAI2BB1 U326 ( .A0N(state[2]), .A1N(n400), .B0(n401), .Y(n346) );
  NAND2 U327 ( .A(n402), .B(n401), .Y(n345) );
  MX2 U328 ( .A(n403), .B(n404), .S0(n405), .Y(n402) );
  AOI31 U329 ( .A0(cs_o[3]), .A1(addrD[8]), .A2(n406), .B0(n407), .Y(n404) );
  NOR3B U330 ( .AN(n408), .B(n372), .C(n367), .Y(n406) );
  INV U331 ( .A(addrD[6]), .Y(n367) );
  INV U332 ( .A(addrD[7]), .Y(n372) );
  NAND3B U333 ( .AN(n409), .B(n401), .C(n410), .Y(n344) );
  MX2 U334 ( .A(n411), .B(n393), .S0(n405), .Y(n410) );
  OAI31 U335 ( .A0(n412), .A1(n437), .A2(n413), .B0(n405), .Y(n401) );
  INV U336 ( .A(n400), .Y(n405) );
  NOR2B U337 ( .AN(n414), .B(n394), .Y(n400) );
  INV U338 ( .A(n397), .Y(n394) );
  NOR2B U339 ( .AN(n415), .B(n416), .Y(n397) );
  NOR4BB U340 ( .AN(addrD[5]), .BN(n378), .C(n393), .D(n417), .Y(n416) );
  NOR3B U341 ( .AN(addrD[4]), .B(n389), .C(n418), .Y(n378) );
  INV U342 ( .A(addrD[3]), .Y(n418) );
  NAND3 U343 ( .A(addrD[0]), .B(addrD[1]), .C(addrD[2]), .Y(n389) );
  OAI31 U344 ( .A0(n419), .A1(n407), .A2(n412), .B0(en_o), .Y(n414) );
  AOI2BB1 U345 ( .A0N(n411), .A1N(n403), .B0(n420), .Y(n412) );
  OAI2BB2 U346 ( .B0(n393), .B1(n421), .A0N(dori_o), .A1N(n365), .Y(n343) );
  INV U347 ( .A(n408), .Y(n393) );
  OAI211 U348 ( .A0(n366), .A1(n398), .B0(n368), .C0(n422), .Y(n332) );
  AOI22 U349 ( .A0(db_o[2]), .A1(n365), .B0(n371), .B1(addrD[2]), .Y(n422) );
  OAI21 U350 ( .A0(n409), .A1(n413), .B0(n423), .Y(n368) );
  INV U351 ( .A(addrD[8]), .Y(n398) );
  INV U352 ( .A(n424), .Y(n366) );
  INV U353 ( .A(n425), .Y(n331) );
  AOI221 U354 ( .A0(n371), .A1(addrD[3]), .B0(n365), .B1(db_o[3]), .C0(n426), 
        .Y(n425) );
  INV U355 ( .A(n427), .Y(n330) );
  AOI221 U356 ( .A0(n371), .A1(addrD[4]), .B0(n365), .B1(db_o[4]), .C0(n426), 
        .Y(n427) );
  INV U357 ( .A(n428), .Y(n329) );
  AOI221 U358 ( .A0(n371), .A1(addrD[5]), .B0(n365), .B1(db_o[5]), .C0(n426), 
        .Y(n428) );
  AOI2BB1 U359 ( .A0N(n409), .A1N(n419), .B0(n421), .Y(n426) );
  OAI2BB1 U360 ( .A0N(db_o[6]), .A1N(n365), .B0(n429), .Y(n328) );
  INV U361 ( .A(n371), .Y(n429) );
  NOR2B U362 ( .AN(n407), .B(n421), .Y(n371) );
  INV U363 ( .A(n430), .Y(n327) );
  AOI221 U364 ( .A0(n408), .A1(n423), .B0(n365), .B1(db_o[7]), .C0(n424), .Y(
        n430) );
  NOR2B U365 ( .AN(n431), .B(n421), .Y(n424) );
  INV U366 ( .A(n423), .Y(n421) );
  NOR2 U367 ( .A(n437), .B(n365), .Y(n423) );
  AOI2BB1 U368 ( .A0N(n432), .A1N(n417), .B0(n392), .Y(n370) );
  OAI2BB1 U369 ( .A0N(en_o), .A1N(n408), .B0(n415), .Y(n392) );
  AOI31 U370 ( .A0(n433), .A1(n434), .A2(n409), .B0(n437), .Y(n415) );
  NOR3B U371 ( .AN(state[0]), .B(n411), .C(n420), .Y(n409) );
  INV U372 ( .A(start_i), .Y(n434) );
  NOR2B U373 ( .AN(\driver/start_history [1]), .B(n417), .Y(n433) );
  NOR2 U374 ( .A(n419), .B(n407), .Y(n432) );
  NOR3B U375 ( .AN(n420), .B(state[0]), .C(n411), .Y(n407) );
  OR2 U376 ( .A(n413), .B(n431), .Y(n419) );
  NOR3B U377 ( .AN(n420), .B(state[1]), .C(n403), .Y(n431) );
  INV U378 ( .A(state[0]), .Y(n403) );
  INV U379 ( .A(state[2]), .Y(n420) );
  NOR3B U380 ( .AN(state[0]), .B(state[2]), .C(n411), .Y(n413) );
  INV U381 ( .A(state[1]), .Y(n411) );
  NOR3 U382 ( .A(state[1]), .B(state[2]), .C(state[0]), .Y(n408) );
  NOR2B U383 ( .AN(n417), .B(n437), .Y(\driver/N93 ) );
  INV U384 ( .A(rstn), .Y(n437) );
  INV U385 ( .A(en_o), .Y(n417) );
  NOR2B U386 ( .AN(addrD[9]), .B(n395), .Y(cs_o[3]) );
  NOR2B U387 ( .AN(n399), .B(n395), .Y(cs_o[2]) );
  INV U388 ( .A(addrD[9]), .Y(n399) );
  NOR2B U389 ( .AN(addrD[9]), .B(addrD[10]), .Y(cs_o[1]) );
  NOR2B U390 ( .AN(n395), .B(addrD[9]), .Y(cs_o[0]) );
  INV U391 ( .A(addrD[10]), .Y(n395) );
endmodule

