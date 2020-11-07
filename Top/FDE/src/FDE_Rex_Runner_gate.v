
module FDE_Rex_Runner ( clk, rstn, jmp_key, db_o, dori_o, cs_o, en_o, rw_o, 
        rst_o, state );
  output [7:0] db_o;
  output [3:0] cs_o;
  output [2:0] state;
  input clk, rstn, jmp_key;
  output dori_o, en_o, rw_o, rst_o;
  wire   start, clk24Hz, \driver/N96 , \driver/N47 , \driver/N46 ,
         \driver/N45 , \driver/N44 , \rex_down[12] , \decider/N113 ,
         \decider/N112 , \decider/N111 , \decider/N110 , \decider/N109 ,
         \decider/N108 , \decider/N107 , \decider/N106 , \decider/N105 ,
         \decider/N104 , \decider/N86 , \decider/N85 , \decider/N84 ,
         \decider/N83 , \decider/N82 , \decider/N81 , \decider/N80 ,
         \decider/N79 , \decider/N78 , \decider/N77 , \decider/N64 ,
         \decider/N63 , \decider/N62 , \decider/N60 , \decider/N58 ,
         \decider/N57 , \decider/N55 , \decider/posx_m_obstacle_right[15] ,
         \decider/posy_m_rex_top[1] , \decider/posy_m_rex_top[2] ,
         \decider/posy_m_rex_top[3] , \decider/posy_m_rex_top[4] ,
         \decider/posy_m_rex_top[5] , \decider/posy_m_rex_top[6] ,
         \decider/posy_m_rex_top[7] , \decider/posy_m_rex_top[8] ,
         \decider/posy_m_rex_top[9] , \decider/posy_m_rex_top[15] ,
         \gamecenter/N179 , \gamecenter/N178 , \gamecenter/N177 ,
         \gamecenter/N176 , \gamecenter/N175 , \gamecenter/N174 ,
         \gamecenter/N173 , \gamecenter/N172 , \gamecenter/N171 ,
         \gamecenter/N170 , \gamecenter/N169 , \gamecenter/N168 ,
         \gamecenter/N133 , \gamecenter/N132 , \gamecenter/N131 ,
         \gamecenter/N130 , \gamecenter/N129 , \gamecenter/N128 ,
         \gamecenter/N127 , \gamecenter/rex_falling ,
         \gamecenter/rex_jmp_ptr[0] , \gamecenter/rex_jmp_ptr[1] ,
         \gamecenter/rex_jmp_ptr[2] , \gamecenter/rex_jmp_ptr[3] ,
         \gamecenter/rex_jmp_ptr[4] , \gamecenter/rex_jmp_ptr[5] ,
         \gamecenter/rex_jmp_ptr[6] , \gamecenter/rex_jmp_ptr[7] ,
         \gamecenter/in_up_history[0] , \gamecenter/in_up_history[1] ,
         \gamecenter/in_up_history[2] , \gamecenter/clk24HzHistory ,
         \clock_divider/N71 , \clock_divider/N70 , \clock_divider/N69 ,
         \clock_divider/N68 , \clock_divider/N67 , \clock_divider/N66 ,
         \clock_divider/N65 , \clock_divider/N64 , \clock_divider/N63 ,
         \clock_divider/N62 , \clock_divider/N61 , \clock_divider/N60 ,
         \clock_divider/N59 , \clock_divider/N58 , \clock_divider/N57 ,
         \clock_divider/N56 , \clock_divider/N55 , \clock_divider/N54 ,
         \clock_divider/N53 , \clock_divider/N52 , \clock_divider/N51 ,
         \clock_divider/N50 , \clock_divider/N49 , \clock_divider/N48 ,
         \clock_divider/N47 , \clock_divider/N46 , \clock_divider/N45 ,
         \clock_divider/N44 , \clock_divider/N43 , \clock_divider/N42 ,
         \clock_divider/N41 , \clock_divider/cnt2k5[1] ,
         \clock_divider/cnt2k5[2] , \clock_divider/cnt2k5[3] ,
         \clock_divider/cnt2k5[4] , \clock_divider/cnt2k5[5] ,
         \clock_divider/cnt2k5[6] , \clock_divider/cnt2k5[7] ,
         \clock_divider/cnt2k5[8] , \clock_divider/cnt2k5[9] ,
         \clock_divider/cnt2k5[10] , \clock_divider/cnt2k5[11] ,
         \clock_divider/cnt2k5[12] , \clock_divider/cnt2k5[13] ,
         \clock_divider/cnt2k5[14] , \clock_divider/cnt2k5[15] ,
         \clock_divider/N38 , \clock_divider/N37 , \clock_divider/N36 ,
         \clock_divider/N35 , \clock_divider/N34 , \clock_divider/N33 ,
         \clock_divider/N32 , \clock_divider/N31 , \clock_divider/N30 ,
         \clock_divider/N29 , \clock_divider/N28 , \clock_divider/N27 ,
         \clock_divider/N26 , \clock_divider/N25 , \clock_divider/N24 ,
         \clock_divider/N23 , \clock_divider/N22 , \clock_divider/N21 ,
         \clock_divider/N20 , \clock_divider/N19 , \clock_divider/N18 ,
         \clock_divider/N17 , \clock_divider/N16 , \clock_divider/N15 ,
         \clock_divider/N14 , \clock_divider/N13 , \clock_divider/N12 ,
         \clock_divider/N11 , \clock_divider/N10 , \clock_divider/N9 ,
         \clock_divider/N8 , \clock_divider/cnt5k[0] ,
         \clock_divider/cnt5k[1] , \clock_divider/cnt5k[2] ,
         \clock_divider/cnt5k[3] , \clock_divider/cnt5k[4] ,
         \clock_divider/cnt5k[5] , \clock_divider/cnt5k[6] ,
         \clock_divider/cnt5k[7] , \clock_divider/cnt5k[8] ,
         \clock_divider/cnt5k[9] , \clock_divider/cnt5k[10] ,
         \clock_divider/cnt5k[11] , \clock_divider/cnt5k[12] ,
         \clock_divider/cnt5k[13] , \clock_divider/cnt5k[14] ,
         \clock_divider/cnt5k[15] , \U1/U1/Z_0 , \U1/U1/Z_1 , \U1/U1/Z_2 ,
         \U1/U1/Z_3 , \U1/U1/Z_4 , \U1/U4/Z_0 , \U1/U7/Z_0 , n440, n441, n442,
         n443, n444, n445, n456, n457, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n478, n479,
         n480, n481, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n502, n503, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n521, n522, n523, n524,
         \r462/B_AS[0] , \r462/B_AS[1] , \r462/B_AS[2] , \r462/B_AS[3] ,
         \r462/B_AS[4] , \r462/B_AS[5] , \r462/B_AS[9] , \r462/carry[1] ,
         \r462/carry[2] , \r462/carry[3] , \r462/carry[4] , \r462/carry[5] ,
         \r462/carry[6] , \r462/carry[7] , \r462/carry[8] , \r462/carry[9] ,
         \r463/B_AS[9] , \r463/B_AS[8] , \r463/B_AS[7] , \r463/B_AS[6] ,
         \r463/B_AS[5] , \r463/B_AS[4] , \r463/B_AS[3] , \r463/B_AS[2] ,
         \r463/B_AS[1] , \r463/B_AS[0] , \r463/carry[1] , \r463/carry[2] ,
         \r463/carry[3] , \r463/carry[4] , \r463/carry[5] , \r463/carry[6] ,
         \r463/carry[7] , \r463/carry[8] , \r463/carry[9] ,
         \gamecenter/sub_175/carry[15] , \gamecenter/sub_175/carry[14] ,
         \gamecenter/sub_175/carry[13] , \gamecenter/sub_175/carry[12] ,
         \gamecenter/sub_175/carry[11] , \gamecenter/sub_175/carry[10] ,
         \gamecenter/sub_175/carry[9] , \gamecenter/sub_175/carry[8] ,
         \gamecenter/sub_175/carry[7] , \gamecenter/sub_175/carry[6] ,
         \gamecenter/sub_175/carry[5] , \r307/carry[7] , \r307/carry[6] ,
         \r307/carry[5] , \r307/carry[4] , \r307/carry[3] , \r307/carry[2] ,
         \r307/carry[1] , \gamecenter/add_37/carry[3] ,
         \gamecenter/add_37/carry[4] , \gamecenter/add_37/carry[5] ,
         \r98/A1[4] , \r98/PROD1[4] , \r98/SUMB[1][2] , \r98/SUMB[1][3] ,
         \r98/SUMB[2][2] , \r98/SUMB[2][3] , \r98/SUMB[3][2] ,
         \r98/SUMB[3][3] , \r98/SUMB[4][2] , \r98/SUMB[4][3] ,
         \r98/SUMB[5][2] , \r98/SUMB[5][3] , \r98/SUMB[6][2] ,
         \r98/SUMB[6][3] , \r98/SUMB[7][2] , \r98/CARRYB[2][2] ,
         \r98/CARRYB[2][3] , \r98/CARRYB[3][0] , \r98/CARRYB[3][2] ,
         \r98/CARRYB[3][3] , \r98/CARRYB[4][0] , \r98/CARRYB[4][2] ,
         \r98/CARRYB[4][3] , \r98/CARRYB[5][2] , \r98/CARRYB[5][3] ,
         \r98/CARRYB[6][2] , \r98/ab[0][2] , \r98/ab[1][0] , \r98/ab[1][2] ,
         \r98/ab[2][0] , \r98/ab[2][2] , \r98/ab[3][0] , \r98/ab[3][2] ,
         \r98/ab[4][0] , \r98/ab[4][2] , \r98/ab[5][2] , \r98/ab[6][2] ,
         \r98/ab[7][2] , \decider/sub_75/carry[6] , \decider/sub_75/carry[5] ,
         \sub_0_root_decider/sub_73/carry[15] , \r293/carry[8] ,
         \r293/carry[7] , \r293/carry[6] , \r293/carry[5] , \r293/carry[4] ,
         \decider/sub_45/carry[2] , \decider/sub_45/carry[3] ,
         \decider/sub_45/carry[4] , \decider/sub_45/carry[5] ,
         \sub_0_root_decider/sub_49/carry[2] ,
         \sub_0_root_decider/sub_49/carry[3] ,
         \sub_0_root_decider/sub_49/carry[5] ,
         \sub_0_root_decider/sub_49/carry[6] ,
         \sub_0_root_decider/sub_49/carry[7] ,
         \sub_0_root_decider/sub_49/carry[8] ,
         \sub_0_root_decider/sub_49/carry[9] ,
         \sub_0_root_decider/sub_49/carry[10] ,
         \sub_0_root_decider/sub_49/carry[11] ,
         \sub_0_root_decider/sub_49/carry[12] ,
         \sub_0_root_decider/sub_49/carry[13] ,
         \sub_0_root_decider/sub_49/carry[14] ,
         \sub_0_root_decider/sub_49/carry[15] , \r289/carry[6] ,
         \r289/carry[5] , \r289/carry[4] , \r289/carry[3] , \r289/carry[2] ,
         \r289/carry[1] , n533, n534, n535, n536, n537, n538, n539, n540, n541,
         n542, n543, n544, n545, n546, n547, n548, n549, n550, n551, n552,
         n553, n554, n555, n556, n557, n558, n559, n560, n561, n562, n563,
         n564, n565, n566, n567, n568, n569, n570, n571, n572, n573, n574,
         n575, n576, n577, n578, n579, n580, n581, n582, n583, n584, n585,
         n586, n587, n588, n589, n590, n591, n592, n593, n594, n595, n596,
         n597, n598, n599, n600, n601, n602, n603, n604, n605, n606, n607,
         n608, n609, n610, n611, n612, n613, n614, n615, n616, n617, n618,
         n619, n620, n621, n622, n623, n624, n625, n626, n627, n628, n629,
         n630, n631, n632, n633, n634, n635, n636, n637, n638, n639, n640,
         n641, n642, n643, n644, n645, n646, n647, n648, n649, n650, n651,
         n652, n653, n654, n655, n656, n657, n658, n659, n660, n661, n662,
         n663, n664, n665, n666, n667, n668, n669, n670, n671, n672, n673,
         n674, n675, n676, n677, n678, n679, n680, n681, n682, n683, n684,
         n685, n686, n687, n688, n689, n690, n691, n692, n693, n694, n695,
         n696, n697, n698, n699, n700, n701, n702, n703, n704, n705, n706,
         n707, n708, n709, n710, n711, n712, n713, n714, n715, n716, n717,
         n718, n719, n720, n721, n722, n723, n724, n725, n726, n727, n728,
         n729, n730, n731, n732, n733, n734, n735, n736, n737, n738, n739,
         n740, n741, n742, n743, n744, n745, n746, n747, n748, n749, n750,
         n751, n752, n753, n754, n755, n756, n757, n758, n759, n760, n761,
         n762, n763, n764, n765, n766, n767, n768, n769, n770, n771, n772,
         n773, n774, n775, n776, n777, n778, n779, n780, n781, n782, n783,
         n784, n785, n786, n787, n788, n789, n790, n791, n792, n793, n794,
         n795, n796, n797, n798, n799, n800, n801, n802, n803, n804, n805,
         n806, n807, n808, n809, n810, n811, n812, n813, n814, n815, n816,
         n817, n818, n819, n820, n821, n822, n823, n824, n825, n826, n827,
         n828, n829, n830, n831, n832, n833, n834, n835, n836, n837, n838,
         n839, n840, n841, n842, n843, n844, n845, n846, n847, n848, n849,
         n850, n851, n852, n853, n854, n855, n856, n857, n858, n859, n860,
         n861, n862, n863, n864, n865, n866, n867, n868, n869, n870, n871,
         n872, n873, n874, n875, n876, n877, n878, n879, n880, n881, n882,
         n883, n884, n885, n886, n887, n888, n889, n890, n891, n892, n893,
         n894, n895, n896, n897, n898, n899, n900, n901, n902, n903, n904,
         n905, n906, n907, n908, n909, n910, n911, n912, n913, n914, n915,
         n916, n917, n918, n919, n920, n921, n922, n923, n924, n925, n926,
         n927, n928, n929, n930, n931, n932, n933, n934, n935, n936, n937,
         n938, n939, n940, n941, n942, n943, n944, n945, n946, n947, n948,
         n949, n950, n951, n952, n953, n954, n955, n956, n957, n958, n959,
         n960, n961;
  wire   [10:0] addrD;
  wire   [15:0] addrT;
  wire   [15:0] rex_down;
  wire   [15:0] obstacle_left;
  wire   [1:0] game_state;
  wire   [1:0] \driver/start_history ;
  wire   [5:0] \decider/posy_m_obstacle_top ;
  wire   [15:0] \decider/obstacle_right ;
  wire   [7:3] \decider/posx_m_rex_left ;
  wire   [15:0] \decider/rex_top ;
  wire   [15:0] \gamecenter/obs_right ;
  wire   [15:0] \gamecenter/rex_top ;
  assign rw_o = \rex_down[12] ;

  DFFHQ \driver/en_o_reg  ( .D(\driver/N96 ), .CK(clk), .Q(en_o) );
  DFFHQ \driver/rst_o_reg  ( .D(n927), .CK(clk), .Q(rst_o) );
  DFFRHQ \clock_divider/cnt2k5_reg[15]  ( .D(\clock_divider/N71 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[15] ) );
  DFFRHQ \clock_divider/clk24Hz_reg  ( .D(n444), .CK(clk), .RN(rstn), .Q(
        clk24Hz) );
  DFFRHQ \gamecenter/clk24HzHistory_reg  ( .D(clk24Hz), .CK(clk), .RN(rstn), 
        .Q(\gamecenter/clk24HzHistory ) );
  DFFRHQ \gamecenter/in_up_history_reg[0]  ( .D(n443), .CK(clk), .RN(rstn), 
        .Q(\gamecenter/in_up_history[0] ) );
  DFFRHQ \gamecenter/in_up_history_reg[1]  ( .D(n442), .CK(clk), .RN(rstn), 
        .Q(\gamecenter/in_up_history[1] ) );
  DFFRHQ \gamecenter/in_up_history_reg[2]  ( .D(n441), .CK(clk), .RN(rstn), 
        .Q(\gamecenter/in_up_history[2] ) );
  DFFRHQ \gamecenter/rex_falling_reg  ( .D(n516), .CK(clk), .RN(rstn), .Q(
        \gamecenter/rex_falling ) );
  DFFRHQ \gamecenter/rex_jmp_ptr_reg[6]  ( .D(n508), .CK(clk), .RN(rstn), .Q(
        \gamecenter/rex_jmp_ptr[6] ) );
  DFFRHQ \gamecenter/rex_jmp_ptr_reg[3]  ( .D(n511), .CK(clk), .RN(rstn), .Q(
        \gamecenter/rex_jmp_ptr[3] ) );
  DFFRHQ \gamecenter/rex_down_reg[0]  ( .D(n507), .CK(clk), .RN(rstn), .Q(
        rex_down[0]) );
  DFFRHQ \gamecenter/game_state_reg[1]  ( .D(n518), .CK(clk), .RN(rstn), .Q(
        game_state[1]) );
  DFFRHQ \gamecenter/game_state_reg[0]  ( .D(n517), .CK(clk), .RN(rstn), .Q(
        game_state[0]) );
  DFFRHQ \gamecenter/rex_jmp_ptr_reg[2]  ( .D(n512), .CK(clk), .RN(rstn), .Q(
        \gamecenter/rex_jmp_ptr[2] ) );
  DFFRHQ \gamecenter/rex_jmp_ptr_reg[1]  ( .D(n513), .CK(clk), .RN(rstn), .Q(
        \gamecenter/rex_jmp_ptr[1] ) );
  DFFRHQ \gamecenter/rex_jmp_ptr_reg[0]  ( .D(n514), .CK(clk), .RN(rstn), .Q(
        \gamecenter/rex_jmp_ptr[0] ) );
  DFFRHQ \gamecenter/rex_down_reg[5]  ( .D(n502), .CK(clk), .RN(rstn), .Q(
        rex_down[5]) );
  DFFRHQ \gamecenter/rex_down_reg[4]  ( .D(n503), .CK(clk), .RN(rstn), .Q(
        rex_down[4]) );
  DFFRHQ \gamecenter/rex_down_reg[3]  ( .D(n928), .CK(clk), .RN(rstn), .Q(
        rex_down[3]) );
  DFFRHQ \gamecenter/rex_down_reg[2]  ( .D(n505), .CK(clk), .RN(rstn), .Q(
        rex_down[2]) );
  DFFRHQ \gamecenter/rex_down_reg[1]  ( .D(n506), .CK(clk), .RN(rstn), .Q(
        rex_down[1]) );
  DFFRHQ \gamecenter/obs_left_reg[5]  ( .D(n932), .CK(clk), .RN(rstn), .Q(
        obstacle_left[5]) );
  DFFRHQ \gamecenter/obs_left_reg[6]  ( .D(n931), .CK(clk), .RN(rstn), .Q(
        obstacle_left[6]) );
  DFFRHQ \gamecenter/obs_left_reg[7]  ( .D(n930), .CK(clk), .RN(rstn), .Q(
        obstacle_left[7]) );
  DFFRHQ \gamecenter/obs_left_reg[15]  ( .D(n934), .CK(clk), .RN(rstn), .Q(
        obstacle_left[15]) );
  DFFRHQ \gamecenter/obs_left_reg[14]  ( .D(n929), .CK(clk), .RN(rstn), .Q(
        obstacle_left[14]) );
  DFFRHQ \gamecenter/obs_left_reg[13]  ( .D(n519), .CK(clk), .RN(rstn), .Q(
        obstacle_left[13]) );
  DFFRHQ \gamecenter/obs_left_reg[12]  ( .D(n933), .CK(clk), .RN(rstn), .Q(
        obstacle_left[12]) );
  DFFRHQ \gamecenter/obs_left_reg[11]  ( .D(n456), .CK(clk), .RN(rstn), .Q(
        obstacle_left[11]) );
  DFFRHQ \gamecenter/obs_left_reg[10]  ( .D(n521), .CK(clk), .RN(rstn), .Q(
        obstacle_left[10]) );
  DFFRHQ \gamecenter/obs_left_reg[9]  ( .D(n522), .CK(clk), .RN(rstn), .Q(
        obstacle_left[9]) );
  DFFRHQ \gamecenter/obs_left_reg[8]  ( .D(n457), .CK(clk), .RN(rstn), .Q(
        obstacle_left[8]) );
  DFFRHQ \gamecenter/obs_left_reg[3]  ( .D(n524), .CK(clk), .RN(rstn), .Q(
        obstacle_left[3]) );
  DFFRHQ \gamecenter/obs_left_reg[4]  ( .D(n523), .CK(clk), .RN(rstn), .Q(
        obstacle_left[4]) );
  DFFRHQ \gamecenter/rex_jmp_ptr_reg[4]  ( .D(n510), .CK(clk), .RN(rstn), .Q(
        \gamecenter/rex_jmp_ptr[4] ) );
  DFFRHQ \gamecenter/rex_jmp_ptr_reg[5]  ( .D(n509), .CK(clk), .RN(rstn), .Q(
        \gamecenter/rex_jmp_ptr[5] ) );
  DFFRHQ \gamecenter/rex_jmp_ptr_reg[7]  ( .D(n515), .CK(clk), .RN(rstn), .Q(
        \gamecenter/rex_jmp_ptr[7] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[14]  ( .D(\clock_divider/N70 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[14] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[1]  ( .D(\clock_divider/N57 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[1] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[2]  ( .D(\clock_divider/N58 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[2] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[3]  ( .D(\clock_divider/N59 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[3] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[4]  ( .D(\clock_divider/N60 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[4] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[5]  ( .D(\clock_divider/N61 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[5] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[6]  ( .D(\clock_divider/N62 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[6] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[7]  ( .D(\clock_divider/N63 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[7] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[8]  ( .D(\clock_divider/N64 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[8] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[9]  ( .D(\clock_divider/N65 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[9] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[10]  ( .D(\clock_divider/N66 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[10] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[11]  ( .D(\clock_divider/N67 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[11] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[12]  ( .D(\clock_divider/N68 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[12] ) );
  DFFRHQ \clock_divider/cnt2k5_reg[13]  ( .D(\clock_divider/N69 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt2k5[13] ) );
  DFFRHQ \clock_divider/cnt5k_reg[15]  ( .D(\clock_divider/N38 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[15] ) );
  DFFRHQ \clock_divider/clk12Hz_reg  ( .D(n440), .CK(clk), .RN(rstn), .Q(start) );
  EDFFHQ \driver/start_history_reg[0]  ( .D(start), .E(rstn), .CK(clk), .Q(
        \driver/start_history [0]) );
  EDFFHQ \driver/start_history_reg[1]  ( .D(\driver/start_history [0]), .E(
        rstn), .CK(clk), .Q(\driver/start_history [1]) );
  DFFHQ \driver/y_reg[4]  ( .D(n486), .CK(clk), .Q(addrD[4]) );
  DFFHQ \driver/x_reg[4]  ( .D(n485), .CK(clk), .Q(addrD[10]) );
  DFFHQ \driver/x_reg[0]  ( .D(n484), .CK(clk), .Q(addrD[6]) );
  DFFHQ \driver/x_reg[1]  ( .D(n483), .CK(clk), .Q(addrD[7]) );
  DFFHQ \driver/x_reg[2]  ( .D(n924), .CK(clk), .Q(addrD[8]) );
  DFFHQ \driver/x_reg[3]  ( .D(n481), .CK(clk), .Q(addrD[9]) );
  DFFHQ \driver/state_reg[0]  ( .D(n479), .CK(clk), .Q(state[0]) );
  DFFHQ \driver/state_reg[1]  ( .D(n478), .CK(clk), .Q(state[1]) );
  DFFHQ \driver/state_reg[2]  ( .D(n480), .CK(clk), .Q(state[2]) );
  DFFHQ \driver/y_reg[5]  ( .D(n491), .CK(clk), .Q(addrD[5]) );
  DFFHQ \driver/y_reg[0]  ( .D(n490), .CK(clk), .Q(addrD[0]) );
  DFFHQ \driver/y_reg[1]  ( .D(n489), .CK(clk), .Q(addrD[1]) );
  DFFHQ \driver/y_reg[2]  ( .D(n488), .CK(clk), .Q(addrD[2]) );
  DFFHQ \driver/y_reg[3]  ( .D(n487), .CK(clk), .Q(addrD[3]) );
  DFFHQ \driver/dori_o_reg  ( .D(n923), .CK(clk), .Q(dori_o) );
  DFFRHQ \decider/addrT_reg[0]  ( .D(n476), .CK(clk), .RN(rstn), .Q(addrT[0])
         );
  DFFRHQ \decider/addrT_reg[1]  ( .D(n475), .CK(clk), .RN(rstn), .Q(addrT[1])
         );
  DFFRHQ \decider/addrT_reg[2]  ( .D(n474), .CK(clk), .RN(rstn), .Q(addrT[2])
         );
  DFFRHQ \decider/addrT_reg[3]  ( .D(n473), .CK(clk), .RN(rstn), .Q(addrT[3])
         );
  DFFRHQ \decider/addrT_reg[4]  ( .D(n472), .CK(clk), .RN(rstn), .Q(addrT[4])
         );
  DFFRHQ \decider/addrT_reg[5]  ( .D(n471), .CK(clk), .RN(rstn), .Q(addrT[5])
         );
  DFFRHQ \decider/addrT_reg[6]  ( .D(n470), .CK(clk), .RN(rstn), .Q(addrT[6])
         );
  DFFRHQ \decider/addrT_reg[7]  ( .D(n469), .CK(clk), .RN(rstn), .Q(addrT[7])
         );
  DFFRHQ \decider/addrT_reg[8]  ( .D(n468), .CK(clk), .RN(rstn), .Q(addrT[8])
         );
  DFFRHQ \decider/addrT_reg[9]  ( .D(n467), .CK(clk), .RN(rstn), .Q(addrT[9])
         );
  DFFHQ \driver/db_o_reg[7]  ( .D(n925), .CK(clk), .Q(db_o[7]) );
  DFFHQ \driver/db_o_reg[0]  ( .D(n445), .CK(clk), .Q(db_o[0]) );
  DFFHQ \driver/db_o_reg[1]  ( .D(n466), .CK(clk), .Q(db_o[1]) );
  DFFHQ \driver/db_o_reg[2]  ( .D(n465), .CK(clk), .Q(db_o[2]) );
  DFFHQ \driver/db_o_reg[3]  ( .D(n464), .CK(clk), .Q(db_o[3]) );
  DFFHQ \driver/db_o_reg[4]  ( .D(n463), .CK(clk), .Q(db_o[4]) );
  DFFHQ \driver/db_o_reg[5]  ( .D(n462), .CK(clk), .Q(db_o[5]) );
  DFFHQ \driver/db_o_reg[6]  ( .D(n926), .CK(clk), .Q(db_o[6]) );
  DFFRHQ \clock_divider/cnt5k_reg[14]  ( .D(\clock_divider/N37 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[14] ) );
  DFFRHQ \clock_divider/cnt5k_reg[0]  ( .D(\clock_divider/N23 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[0] ) );
  DFFRHQ \clock_divider/cnt5k_reg[1]  ( .D(\clock_divider/N24 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[1] ) );
  DFFRHQ \clock_divider/cnt5k_reg[2]  ( .D(\clock_divider/N25 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[2] ) );
  DFFRHQ \clock_divider/cnt5k_reg[3]  ( .D(\clock_divider/N26 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[3] ) );
  DFFRHQ \clock_divider/cnt5k_reg[4]  ( .D(\clock_divider/N27 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[4] ) );
  DFFRHQ \clock_divider/cnt5k_reg[5]  ( .D(\clock_divider/N28 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[5] ) );
  DFFRHQ \clock_divider/cnt5k_reg[6]  ( .D(\clock_divider/N29 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[6] ) );
  DFFRHQ \clock_divider/cnt5k_reg[7]  ( .D(\clock_divider/N30 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[7] ) );
  DFFRHQ \clock_divider/cnt5k_reg[8]  ( .D(\clock_divider/N31 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[8] ) );
  DFFRHQ \clock_divider/cnt5k_reg[9]  ( .D(\clock_divider/N32 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[9] ) );
  DFFRHQ \clock_divider/cnt5k_reg[10]  ( .D(\clock_divider/N33 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[10] ) );
  DFFRHQ \clock_divider/cnt5k_reg[11]  ( .D(\clock_divider/N34 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[11] ) );
  DFFRHQ \clock_divider/cnt5k_reg[12]  ( .D(\clock_divider/N35 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[12] ) );
  DFFRHQ \clock_divider/cnt5k_reg[13]  ( .D(\clock_divider/N36 ), .CK(clk), 
        .RN(rstn), .Q(\clock_divider/cnt5k[13] ) );
  ADDF \r462/U1_0  ( .A(\decider/N86 ), .B(\r462/B_AS[0] ), .CI(n936), .CO(
        \r462/carry[1] ), .S(\decider/N104 ) );
  ADDF \r462/U1_1  ( .A(\decider/N85 ), .B(\r462/B_AS[1] ), .CI(
        \r462/carry[1] ), .CO(\r462/carry[2] ), .S(\decider/N105 ) );
  ADDF \r462/U1_2  ( .A(\decider/N84 ), .B(\r462/B_AS[2] ), .CI(
        \r462/carry[2] ), .CO(\r462/carry[3] ), .S(\decider/N106 ) );
  ADDF \r462/U1_3  ( .A(\decider/N83 ), .B(\r462/B_AS[3] ), .CI(
        \r462/carry[3] ), .CO(\r462/carry[4] ), .S(\decider/N107 ) );
  ADDF \r462/U1_4  ( .A(\decider/N82 ), .B(\r462/B_AS[4] ), .CI(
        \r462/carry[4] ), .CO(\r462/carry[5] ), .S(\decider/N108 ) );
  ADDF \r462/U1_5  ( .A(\decider/N81 ), .B(\r462/B_AS[5] ), .CI(
        \r462/carry[5] ), .CO(\r462/carry[6] ), .S(\decider/N109 ) );
  ADDF \r462/U1_6  ( .A(\decider/N80 ), .B(\r462/B_AS[9] ), .CI(
        \r462/carry[6] ), .CO(\r462/carry[7] ), .S(\decider/N110 ) );
  ADDF \r462/U1_7  ( .A(\decider/N79 ), .B(\r462/B_AS[9] ), .CI(
        \r462/carry[7] ), .CO(\r462/carry[8] ), .S(\decider/N111 ) );
  ADDF \r462/U1_8  ( .A(\decider/N78 ), .B(\r462/B_AS[9] ), .CI(
        \r462/carry[8] ), .CO(\r462/carry[9] ), .S(\decider/N112 ) );
  ADDF \r462/U1_9  ( .A(\decider/N77 ), .B(\r462/B_AS[9] ), .CI(
        \r462/carry[9] ), .S(\decider/N113 ) );
  ADDF \r463/U1_0  ( .A(\decider/N55 ), .B(\r463/B_AS[0] ), .CI(n595), .CO(
        \r463/carry[1] ), .S(\decider/N86 ) );
  ADDF \r463/U1_1  ( .A(\r98/ab[1][0] ), .B(\r463/B_AS[1] ), .CI(
        \r463/carry[1] ), .CO(\r463/carry[2] ), .S(\decider/N85 ) );
  ADDF \r463/U1_2  ( .A(\decider/N57 ), .B(\r463/B_AS[2] ), .CI(
        \r463/carry[2] ), .CO(\r463/carry[3] ), .S(\decider/N84 ) );
  ADDF \r463/U1_3  ( .A(\decider/N58 ), .B(\r463/B_AS[3] ), .CI(
        \r463/carry[3] ), .CO(\r463/carry[4] ), .S(\decider/N83 ) );
  ADDF \r463/U1_4  ( .A(\r98/PROD1[4] ), .B(\r463/B_AS[4] ), .CI(
        \r463/carry[4] ), .CO(\r463/carry[5] ), .S(\decider/N82 ) );
  ADDF \r463/U1_5  ( .A(\decider/N60 ), .B(\r463/B_AS[5] ), .CI(
        \r463/carry[5] ), .CO(\r463/carry[6] ), .S(\decider/N81 ) );
  ADDF \r463/U1_6  ( .A(\r98/A1[4] ), .B(\r463/B_AS[6] ), .CI(\r463/carry[6] ), 
        .CO(\r463/carry[7] ), .S(\decider/N80 ) );
  ADDF \r463/U1_7  ( .A(\decider/N62 ), .B(\r463/B_AS[7] ), .CI(
        \r463/carry[7] ), .CO(\r463/carry[8] ), .S(\decider/N79 ) );
  ADDF \r463/U1_8  ( .A(\decider/N63 ), .B(\r463/B_AS[8] ), .CI(
        \r463/carry[8] ), .CO(\r463/carry[9] ), .S(\decider/N78 ) );
  ADDF \r463/U1_9  ( .A(\decider/N64 ), .B(\r463/B_AS[9] ), .CI(
        \r463/carry[9] ), .S(\decider/N77 ) );
  ADDF \r307/U1_0  ( .A(\gamecenter/rex_jmp_ptr[0] ), .B(\U1/U7/Z_0 ), .CI(
        n935), .CO(\r307/carry[1] ) );
  ADDF \r307/U1_1  ( .A(\gamecenter/rex_jmp_ptr[1] ), .B(\U1/U7/Z_0 ), .CI(
        \r307/carry[1] ), .CO(\r307/carry[2] ), .S(\gamecenter/N127 ) );
  ADDF \r307/U1_2  ( .A(\gamecenter/rex_jmp_ptr[2] ), .B(\U1/U7/Z_0 ), .CI(
        \r307/carry[2] ), .CO(\r307/carry[3] ), .S(\gamecenter/N128 ) );
  ADDF \r307/U1_3  ( .A(\gamecenter/rex_jmp_ptr[3] ), .B(\U1/U7/Z_0 ), .CI(
        \r307/carry[3] ), .CO(\r307/carry[4] ), .S(\gamecenter/N129 ) );
  ADDF \r307/U1_4  ( .A(\gamecenter/rex_jmp_ptr[4] ), .B(\U1/U7/Z_0 ), .CI(
        \r307/carry[4] ), .CO(\r307/carry[5] ), .S(\gamecenter/N130 ) );
  ADDF \r307/U1_5  ( .A(\gamecenter/rex_jmp_ptr[5] ), .B(\U1/U7/Z_0 ), .CI(
        \r307/carry[5] ), .CO(\r307/carry[6] ), .S(\gamecenter/N131 ) );
  ADDF \r307/U1_6  ( .A(\gamecenter/rex_jmp_ptr[6] ), .B(\U1/U7/Z_0 ), .CI(
        \r307/carry[6] ), .CO(\r307/carry[7] ), .S(\gamecenter/N132 ) );
  ADDF \r307/U1_7  ( .A(\gamecenter/rex_jmp_ptr[7] ), .B(\U1/U7/Z_0 ), .CI(
        \r307/carry[7] ), .S(\gamecenter/N133 ) );
  ADDF \r98/S3_2_3  ( .A(\U1/U1/Z_2 ), .B(n590), .CI(\U1/U1/Z_1 ), .CO(
        \r98/CARRYB[2][3] ), .S(\r98/SUMB[2][3] ) );
  ADDF \r98/S2_2_2  ( .A(\r98/ab[2][2] ), .B(n589), .CI(\r98/SUMB[1][3] ), 
        .CO(\r98/CARRYB[2][2] ), .S(\r98/SUMB[2][2] ) );
  ADDF \r98/S3_3_3  ( .A(\U1/U1/Z_3 ), .B(\r98/CARRYB[2][3] ), .CI(\U1/U1/Z_2 ), .CO(\r98/CARRYB[3][3] ), .S(\r98/SUMB[3][3] ) );
  ADDF \r98/S2_3_2  ( .A(\r98/ab[3][2] ), .B(\r98/CARRYB[2][2] ), .CI(
        \r98/SUMB[2][3] ), .CO(\r98/CARRYB[3][2] ), .S(\r98/SUMB[3][2] ) );
  ADDF \r98/S1_3_0  ( .A(\r98/ab[3][0] ), .B(n588), .CI(\r98/SUMB[1][2] ), 
        .CO(\r98/CARRYB[3][0] ), .S(\decider/N58 ) );
  ADDF \r98/S3_4_3  ( .A(\U1/U1/Z_4 ), .B(\r98/CARRYB[3][3] ), .CI(\U1/U1/Z_3 ), .CO(\r98/CARRYB[4][3] ), .S(\r98/SUMB[4][3] ) );
  ADDF \r98/S2_4_2  ( .A(\r98/ab[4][2] ), .B(\r98/CARRYB[3][2] ), .CI(
        \r98/SUMB[3][3] ), .CO(\r98/CARRYB[4][2] ), .S(\r98/SUMB[4][2] ) );
  ADDF \r98/S1_4_0  ( .A(\r98/ab[4][0] ), .B(\r98/CARRYB[3][0] ), .CI(
        \r98/SUMB[2][2] ), .CO(\r98/CARRYB[4][0] ), .S(\r98/PROD1[4] ) );
  ADDF \r98/S3_5_3  ( .A(\r98/ab[5][2] ), .B(\r98/CARRYB[4][3] ), .CI(
        \U1/U1/Z_4 ), .CO(\r98/CARRYB[5][3] ), .S(\r98/SUMB[5][3] ) );
  ADDF \r98/S2_5_2  ( .A(\r98/ab[5][2] ), .B(\r98/CARRYB[4][2] ), .CI(
        \r98/SUMB[4][3] ), .CO(\r98/CARRYB[5][2] ), .S(\r98/SUMB[5][2] ) );
  ADDF \r98/S3_6_3  ( .A(\r98/ab[6][2] ), .B(\r98/CARRYB[5][3] ), .CI(
        \r98/ab[5][2] ), .S(\r98/SUMB[6][3] ) );
  ADDF \r98/S2_6_2  ( .A(\r98/ab[6][2] ), .B(\r98/CARRYB[5][2] ), .CI(
        \r98/SUMB[5][3] ), .CO(\r98/CARRYB[6][2] ), .S(\r98/SUMB[6][2] ) );
  ADDF \r98/S2_7_2  ( .A(\r98/ab[7][2] ), .B(\r98/CARRYB[6][2] ), .CI(
        \r98/SUMB[6][3] ), .S(\r98/SUMB[7][2] ) );
  ADDF \r293/U2_4  ( .A(addrD[7]), .B(n951), .CI(\r293/carry[4] ), .CO(
        \r293/carry[5] ), .S(\decider/obstacle_right [4]) );
  ADDF \r293/U2_5  ( .A(addrD[8]), .B(n609), .CI(\r293/carry[5] ), .CO(
        \r293/carry[6] ), .S(\decider/obstacle_right [5]) );
  ADDF \r293/U2_6  ( .A(addrD[9]), .B(n941), .CI(\r293/carry[6] ), .CO(
        \r293/carry[7] ), .S(\decider/obstacle_right [6]) );
  ADDF \r293/U2_7  ( .A(addrD[10]), .B(n942), .CI(\r293/carry[7] ), .CO(
        \r293/carry[8] ), .S(\decider/obstacle_right [7]) );
  ADDF \r289/U2_1  ( .A(n955), .B(n940), .CI(\r289/carry[1] ), .CO(
        \r289/carry[2] ), .S(\decider/rex_top [1]) );
  ADDF \r289/U2_2  ( .A(n956), .B(n939), .CI(\r289/carry[2] ), .CO(
        \r289/carry[3] ), .S(\decider/rex_top [2]) );
  ADDF \r289/U2_3  ( .A(n957), .B(n938), .CI(\r289/carry[3] ), .CO(
        \r289/carry[4] ), .S(\decider/rex_top [3]) );
  ADDF \r289/U2_4  ( .A(n952), .B(n615), .CI(\r289/carry[4] ), .CO(
        \r289/carry[5] ), .S(\decider/rex_top [4]) );
  ADDF \r289/U2_5  ( .A(n953), .B(n744), .CI(\r289/carry[5] ), .CO(
        \r289/carry[6] ), .S(\decider/rex_top [5]) );
  INV U463 ( .A(\r289/carry[6] ), .Y(\decider/rex_top [6]) );
  INV U464 ( .A(\r289/carry[6] ), .Y(\decider/rex_top [7]) );
  INV U465 ( .A(\r289/carry[6] ), .Y(\decider/rex_top [8]) );
  INV U466 ( .A(\r289/carry[6] ), .Y(\decider/rex_top [9]) );
  INV U467 ( .A(\r289/carry[6] ), .Y(\decider/rex_top [15]) );
  INV U468 ( .A(\gamecenter/rex_top [1]), .Y(n755) );
  INV U469 ( .A(n937), .Y(n754) );
  INV U470 ( .A(\gamecenter/rex_top [6]), .Y(n758) );
  NOR2 U471 ( .A(\gamecenter/obs_right [10]), .B(n951), .Y(n750) );
  NOR2 U472 ( .A(obstacle_left[4]), .B(n749), .Y(n695) );
  AND2 U475 ( .A(\decider/rex_top [3]), .B(
        \sub_0_root_decider/sub_49/carry[3] ), .Y(n533) );
  AND2 U476 ( .A(\clock_divider/cnt2k5[1] ), .B(\clock_divider/cnt5k[0] ), .Y(
        n534) );
  AND2 U477 ( .A(\clock_divider/cnt2k5[2] ), .B(n534), .Y(n535) );
  AND2 U478 ( .A(\clock_divider/cnt2k5[3] ), .B(n535), .Y(n536) );
  AND2 U479 ( .A(\clock_divider/cnt2k5[4] ), .B(n536), .Y(n537) );
  AND2 U480 ( .A(\clock_divider/cnt2k5[5] ), .B(n537), .Y(n538) );
  AND2 U481 ( .A(\clock_divider/cnt2k5[6] ), .B(n538), .Y(n539) );
  AND2 U482 ( .A(\clock_divider/cnt2k5[7] ), .B(n539), .Y(n540) );
  AND2 U483 ( .A(\clock_divider/cnt2k5[8] ), .B(n540), .Y(n541) );
  AND2 U484 ( .A(\clock_divider/cnt2k5[9] ), .B(n541), .Y(n542) );
  AND2 U485 ( .A(\clock_divider/cnt2k5[10] ), .B(n542), .Y(n543) );
  AND2 U486 ( .A(\clock_divider/cnt2k5[11] ), .B(n543), .Y(n544) );
  AND2 U487 ( .A(\clock_divider/cnt2k5[12] ), .B(n544), .Y(n545) );
  AND2 U488 ( .A(\clock_divider/cnt2k5[13] ), .B(n545), .Y(n546) );
  AND2 U489 ( .A(\clock_divider/cnt5k[1] ), .B(\clock_divider/cnt5k[0] ), .Y(
        n547) );
  AND2 U490 ( .A(\clock_divider/cnt5k[2] ), .B(n547), .Y(n548) );
  AND2 U491 ( .A(\clock_divider/cnt5k[3] ), .B(n548), .Y(n549) );
  AND2 U492 ( .A(\clock_divider/cnt5k[4] ), .B(n549), .Y(n550) );
  AND2 U493 ( .A(\clock_divider/cnt5k[5] ), .B(n550), .Y(n551) );
  AND2 U494 ( .A(\clock_divider/cnt5k[6] ), .B(n551), .Y(n552) );
  AND2 U495 ( .A(\clock_divider/cnt5k[7] ), .B(n552), .Y(n553) );
  AND2 U496 ( .A(\clock_divider/cnt5k[8] ), .B(n553), .Y(n554) );
  AND2 U497 ( .A(\clock_divider/cnt5k[9] ), .B(n554), .Y(n555) );
  AND2 U498 ( .A(\clock_divider/cnt5k[10] ), .B(n555), .Y(n556) );
  AND2 U499 ( .A(\clock_divider/cnt5k[11] ), .B(n556), .Y(n557) );
  AND2 U500 ( .A(\clock_divider/cnt5k[12] ), .B(n557), .Y(n558) );
  AND2 U501 ( .A(\clock_divider/cnt5k[13] ), .B(n558), .Y(n559) );
  AND2 U502 ( .A(addrD[7]), .B(addrD[6]), .Y(n560) );
  AND2 U503 ( .A(addrD[8]), .B(n560), .Y(n561) );
  AND2 U504 ( .A(rex_down[0]), .B(rex_down[1]), .Y(n562) );
  AND2 U505 ( .A(n957), .B(n956), .Y(n563) );
  AND2 U506 ( .A(n950), .B(\r293/carry[8] ), .Y(n564) );
  AND2 U507 ( .A(n949), .B(n564), .Y(n565) );
  AND2 U508 ( .A(n948), .B(n565), .Y(n566) );
  AND2 U509 ( .A(n947), .B(n566), .Y(n567) );
  AND2 U510 ( .A(n946), .B(n567), .Y(n568) );
  AND2 U511 ( .A(n945), .B(n568), .Y(n569) );
  AND2 U512 ( .A(obstacle_left[4]), .B(obstacle_left[5]), .Y(n570) );
  AND2 U513 ( .A(n570), .B(obstacle_left[6]), .Y(n571) );
  AND2 U514 ( .A(n571), .B(obstacle_left[7]), .Y(n572) );
  AND2 U515 ( .A(n572), .B(obstacle_left[8]), .Y(n573) );
  AND2 U516 ( .A(n573), .B(obstacle_left[9]), .Y(n574) );
  AND2 U517 ( .A(n574), .B(obstacle_left[10]), .Y(n575) );
  AND2 U518 ( .A(n575), .B(obstacle_left[11]), .Y(n576) );
  AND2 U519 ( .A(n576), .B(obstacle_left[12]), .Y(n577) );
  AND2 U520 ( .A(n577), .B(obstacle_left[13]), .Y(n578) );
  AND2 U521 ( .A(\r98/CARRYB[4][0] ), .B(\r98/SUMB[3][2] ), .Y(n579) );
  AND2 U522 ( .A(n579), .B(\r98/SUMB[4][2] ), .Y(n580) );
  AND2 U523 ( .A(n580), .B(\r98/SUMB[5][2] ), .Y(n581) );
  AND2 U524 ( .A(\clock_divider/cnt2k5[14] ), .B(n546), .Y(n582) );
  AND2 U525 ( .A(\clock_divider/cnt5k[14] ), .B(n559), .Y(n583) );
  AND2 U526 ( .A(addrD[9]), .B(n561), .Y(n584) );
  AND2 U527 ( .A(\gamecenter/add_37/carry[5] ), .B(rex_down[5]), .Y(
        \gamecenter/rex_top [6]) );
  AND2 U528 ( .A(n944), .B(n569), .Y(n585) );
  AND2 U529 ( .A(n578), .B(obstacle_left[14]), .Y(n586) );
  AND2 U530 ( .A(n581), .B(\r98/SUMB[6][2] ), .Y(n587) );
  AND2 U531 ( .A(\r98/ab[2][0] ), .B(\r98/ab[0][2] ), .Y(n588) );
  AND2 U532 ( .A(\U1/U1/Z_0 ), .B(\r98/ab[1][2] ), .Y(n589) );
  AND2 U533 ( .A(\U1/U1/Z_0 ), .B(\U1/U1/Z_1 ), .Y(n590) );
  INV U534 ( .A(n654), .Y(n591) );
  INV U535 ( .A(n667), .Y(n592) );
  BUF U536 ( .I(n647), .O(n593) );
  BUF U537 ( .I(n689), .O(n594) );
  INV U538 ( .A(n936), .Y(n595) );
  BUF U539 ( .I(n730), .O(n596) );
  BUF U540 ( .I(n718), .O(n597) );
  INV U541 ( .A(n868), .Y(n598) );
  INV U542 ( .A(n642), .Y(n599) );
  INV U543 ( .A(n692), .Y(n600) );
  BUF U544 ( .I(n652), .O(n601) );
  BUF U545 ( .I(n801), .O(n602) );
  LOGIC_0 U546 ( .LOGIC_0_PIN(\rex_down[12] ) );
  NAND2 U547 ( .A(n948), .B(n603), .Y(\gamecenter/sub_175/carry[11] ) );
  XNOR2 U548 ( .A(obstacle_left[10]), .B(\gamecenter/sub_175/carry[10] ), .Y(
        \gamecenter/N174 ) );
  INV U549 ( .A(\gamecenter/sub_175/carry[10] ), .Y(n603) );
  NAND2 U550 ( .A(n947), .B(n604), .Y(\gamecenter/sub_175/carry[12] ) );
  XNOR2 U551 ( .A(obstacle_left[11]), .B(\gamecenter/sub_175/carry[11] ), .Y(
        \gamecenter/N175 ) );
  INV U552 ( .A(\gamecenter/sub_175/carry[11] ), .Y(n604) );
  NAND2 U553 ( .A(n946), .B(n605), .Y(\gamecenter/sub_175/carry[13] ) );
  XNOR2 U554 ( .A(obstacle_left[12]), .B(\gamecenter/sub_175/carry[12] ), .Y(
        \gamecenter/N176 ) );
  INV U555 ( .A(\gamecenter/sub_175/carry[12] ), .Y(n605) );
  NAND2 U556 ( .A(n945), .B(n606), .Y(\gamecenter/sub_175/carry[14] ) );
  XNOR2 U557 ( .A(obstacle_left[13]), .B(\gamecenter/sub_175/carry[13] ), .Y(
        \gamecenter/N177 ) );
  INV U558 ( .A(\gamecenter/sub_175/carry[13] ), .Y(n606) );
  NAND2 U559 ( .A(n944), .B(n607), .Y(\gamecenter/sub_175/carry[15] ) );
  XNOR2 U560 ( .A(obstacle_left[14]), .B(\gamecenter/sub_175/carry[14] ), .Y(
        \gamecenter/N178 ) );
  INV U561 ( .A(\gamecenter/sub_175/carry[14] ), .Y(n607) );
  XNOR2 U562 ( .A(obstacle_left[15]), .B(\gamecenter/sub_175/carry[15] ), .Y(
        \gamecenter/N179 ) );
  NAND2 U563 ( .A(n951), .B(n608), .Y(\gamecenter/sub_175/carry[5] ) );
  XNOR2 U564 ( .A(obstacle_left[4]), .B(obstacle_left[3]), .Y(
        \gamecenter/N168 ) );
  INV U565 ( .A(obstacle_left[3]), .Y(n608) );
  NAND2 U566 ( .A(n609), .B(n610), .Y(\gamecenter/sub_175/carry[6] ) );
  XNOR2 U567 ( .A(obstacle_left[5]), .B(\gamecenter/sub_175/carry[5] ), .Y(
        \gamecenter/N169 ) );
  INV U568 ( .A(obstacle_left[5]), .Y(n609) );
  INV U569 ( .A(\gamecenter/sub_175/carry[5] ), .Y(n610) );
  NAND2 U570 ( .A(n941), .B(n611), .Y(\gamecenter/sub_175/carry[7] ) );
  XNOR2 U571 ( .A(obstacle_left[6]), .B(\gamecenter/sub_175/carry[6] ), .Y(
        \gamecenter/N170 ) );
  INV U572 ( .A(\gamecenter/sub_175/carry[6] ), .Y(n611) );
  NAND2 U573 ( .A(n942), .B(n612), .Y(\gamecenter/sub_175/carry[8] ) );
  XNOR2 U574 ( .A(obstacle_left[7]), .B(\gamecenter/sub_175/carry[7] ), .Y(
        \gamecenter/N171 ) );
  INV U575 ( .A(\gamecenter/sub_175/carry[7] ), .Y(n612) );
  NAND2 U576 ( .A(n950), .B(n613), .Y(\gamecenter/sub_175/carry[9] ) );
  XNOR2 U577 ( .A(obstacle_left[8]), .B(\gamecenter/sub_175/carry[8] ), .Y(
        \gamecenter/N172 ) );
  INV U578 ( .A(\gamecenter/sub_175/carry[8] ), .Y(n613) );
  NAND2 U579 ( .A(n949), .B(n614), .Y(\gamecenter/sub_175/carry[10] ) );
  XNOR2 U580 ( .A(obstacle_left[9]), .B(\gamecenter/sub_175/carry[9] ), .Y(
        \gamecenter/N173 ) );
  INV U581 ( .A(\gamecenter/sub_175/carry[9] ), .Y(n614) );
  NAND2 U582 ( .A(n938), .B(n634), .Y(\gamecenter/add_37/carry[4] ) );
  XNOR2 U583 ( .A(rex_down[3]), .B(\gamecenter/add_37/carry[3] ), .Y(
        \gamecenter/rex_top [3]) );
  NAND2 U584 ( .A(n615), .B(n616), .Y(\gamecenter/add_37/carry[5] ) );
  XNOR2 U585 ( .A(rex_down[4]), .B(\gamecenter/add_37/carry[4] ), .Y(
        \gamecenter/rex_top [4]) );
  INV U586 ( .A(rex_down[4]), .Y(n615) );
  INV U587 ( .A(\gamecenter/add_37/carry[4] ), .Y(n616) );
  NAND2 U588 ( .A(addrD[5]), .B(n635), .Y(\decider/sub_75/carry[6] ) );
  XNOR2 U589 ( .A(n953), .B(\decider/sub_75/carry[5] ), .Y(
        \decider/posy_m_obstacle_top [5]) );
  XNOR2 U590 ( .A(\decider/obstacle_right [15]), .B(
        \sub_0_root_decider/sub_73/carry[15] ), .Y(
        \decider/posx_m_obstacle_right[15] ) );
  NAND2 U591 ( .A(n780), .B(n617), .Y(\decider/sub_45/carry[5] ) );
  XNOR2 U592 ( .A(addrD[10]), .B(\decider/sub_45/carry[4] ), .Y(
        \decider/posx_m_rex_left [7]) );
  INV U593 ( .A(\decider/sub_45/carry[4] ), .Y(n617) );
  NAND2 U594 ( .A(n784), .B(n618), .Y(\decider/sub_45/carry[4] ) );
  XNOR2 U595 ( .A(addrD[9]), .B(\decider/sub_45/carry[3] ), .Y(
        \decider/posx_m_rex_left [6]) );
  INV U596 ( .A(\decider/sub_45/carry[3] ), .Y(n618) );
  NAND2 U597 ( .A(n646), .B(n619), .Y(\decider/sub_45/carry[3] ) );
  XNOR2 U598 ( .A(addrD[8]), .B(\decider/sub_45/carry[2] ), .Y(
        \decider/posx_m_rex_left [5]) );
  INV U599 ( .A(\decider/sub_45/carry[2] ), .Y(n619) );
  NAND2 U600 ( .A(n620), .B(n782), .Y(\decider/sub_45/carry[2] ) );
  XNOR2 U601 ( .A(addrD[7]), .B(addrD[6]), .Y(\decider/posx_m_rex_left [4]) );
  INV U602 ( .A(addrD[7]), .Y(n620) );
  NAND2B U603 ( .AN(\sub_0_root_decider/sub_49/carry[10] ), .B(\r289/carry[6] ), .Y(\sub_0_root_decider/sub_49/carry[11] ) );
  NAND2B U604 ( .AN(\sub_0_root_decider/sub_49/carry[11] ), .B(\r289/carry[6] ), .Y(\sub_0_root_decider/sub_49/carry[12] ) );
  NAND2B U605 ( .AN(\sub_0_root_decider/sub_49/carry[12] ), .B(\r289/carry[6] ), .Y(\sub_0_root_decider/sub_49/carry[13] ) );
  NAND2B U606 ( .AN(\sub_0_root_decider/sub_49/carry[13] ), .B(\r289/carry[6] ), .Y(\sub_0_root_decider/sub_49/carry[14] ) );
  NAND2B U607 ( .AN(\sub_0_root_decider/sub_49/carry[14] ), .B(\r289/carry[6] ), .Y(\sub_0_root_decider/sub_49/carry[15] ) );
  XNOR2 U608 ( .A(\decider/rex_top [15]), .B(
        \sub_0_root_decider/sub_49/carry[15] ), .Y(
        \decider/posy_m_rex_top[15] ) );
  NAND2 U609 ( .A(n621), .B(n622), .Y(\sub_0_root_decider/sub_49/carry[2] ) );
  XNOR2 U610 ( .A(\decider/rex_top [1]), .B(\decider/rex_top [0]), .Y(
        \decider/posy_m_rex_top[1] ) );
  INV U611 ( .A(\decider/rex_top [1]), .Y(n621) );
  INV U612 ( .A(\decider/rex_top [0]), .Y(n622) );
  NAND2 U613 ( .A(n623), .B(n624), .Y(\sub_0_root_decider/sub_49/carry[3] ) );
  XNOR2 U614 ( .A(\decider/rex_top [2]), .B(
        \sub_0_root_decider/sub_49/carry[2] ), .Y(\decider/posy_m_rex_top[2] )
         );
  INV U615 ( .A(\decider/rex_top [2]), .Y(n623) );
  INV U616 ( .A(\sub_0_root_decider/sub_49/carry[2] ), .Y(n624) );
  NAND2 U617 ( .A(n625), .B(n636), .Y(\sub_0_root_decider/sub_49/carry[6] ) );
  XNOR2 U618 ( .A(\decider/rex_top [5]), .B(
        \sub_0_root_decider/sub_49/carry[5] ), .Y(\decider/posy_m_rex_top[5] )
         );
  INV U619 ( .A(\decider/rex_top [5]), .Y(n625) );
  NAND2 U620 ( .A(n626), .B(n627), .Y(\sub_0_root_decider/sub_49/carry[7] ) );
  XNOR2 U621 ( .A(\decider/rex_top [6]), .B(
        \sub_0_root_decider/sub_49/carry[6] ), .Y(\decider/posy_m_rex_top[6] )
         );
  INV U622 ( .A(\decider/rex_top [6]), .Y(n626) );
  INV U623 ( .A(\sub_0_root_decider/sub_49/carry[6] ), .Y(n627) );
  NAND2 U624 ( .A(n628), .B(n629), .Y(\sub_0_root_decider/sub_49/carry[8] ) );
  XNOR2 U625 ( .A(\decider/rex_top [7]), .B(
        \sub_0_root_decider/sub_49/carry[7] ), .Y(\decider/posy_m_rex_top[7] )
         );
  INV U626 ( .A(\decider/rex_top [7]), .Y(n628) );
  INV U627 ( .A(\sub_0_root_decider/sub_49/carry[7] ), .Y(n629) );
  NAND2 U628 ( .A(n630), .B(n631), .Y(\sub_0_root_decider/sub_49/carry[9] ) );
  XNOR2 U629 ( .A(\decider/rex_top [8]), .B(
        \sub_0_root_decider/sub_49/carry[8] ), .Y(\decider/posy_m_rex_top[8] )
         );
  INV U630 ( .A(\decider/rex_top [8]), .Y(n630) );
  INV U631 ( .A(\sub_0_root_decider/sub_49/carry[8] ), .Y(n631) );
  NAND2 U632 ( .A(n632), .B(n633), .Y(\sub_0_root_decider/sub_49/carry[10] )
         );
  XNOR2 U633 ( .A(\decider/rex_top [9]), .B(
        \sub_0_root_decider/sub_49/carry[9] ), .Y(\decider/posy_m_rex_top[9] )
         );
  INV U634 ( .A(\decider/rex_top [9]), .Y(n632) );
  INV U635 ( .A(\sub_0_root_decider/sub_49/carry[9] ), .Y(n633) );
  NAND2 U636 ( .A(rex_down[0]), .B(addrD[0]), .Y(\r289/carry[1] ) );
  XNOR2 U637 ( .A(n937), .B(n954), .Y(\decider/rex_top [0]) );
  XOR2 U638 ( .A(\clock_divider/cnt2k5[1] ), .B(\clock_divider/cnt5k[0] ), .Y(
        \clock_divider/N41 ) );
  XOR2 U639 ( .A(\clock_divider/cnt2k5[2] ), .B(n534), .Y(\clock_divider/N42 )
         );
  XOR2 U640 ( .A(\clock_divider/cnt2k5[3] ), .B(n535), .Y(\clock_divider/N43 )
         );
  XOR2 U641 ( .A(\clock_divider/cnt2k5[4] ), .B(n536), .Y(\clock_divider/N44 )
         );
  XOR2 U642 ( .A(\clock_divider/cnt2k5[5] ), .B(n537), .Y(\clock_divider/N45 )
         );
  XOR2 U643 ( .A(\clock_divider/cnt2k5[6] ), .B(n538), .Y(\clock_divider/N46 )
         );
  XOR2 U644 ( .A(\clock_divider/cnt2k5[7] ), .B(n539), .Y(\clock_divider/N47 )
         );
  XOR2 U645 ( .A(\clock_divider/cnt2k5[8] ), .B(n540), .Y(\clock_divider/N48 )
         );
  XOR2 U646 ( .A(\clock_divider/cnt2k5[9] ), .B(n541), .Y(\clock_divider/N49 )
         );
  XOR2 U647 ( .A(\clock_divider/cnt2k5[10] ), .B(n542), .Y(\clock_divider/N50 ) );
  XOR2 U648 ( .A(\clock_divider/cnt2k5[11] ), .B(n543), .Y(\clock_divider/N51 ) );
  XOR2 U649 ( .A(\clock_divider/cnt2k5[12] ), .B(n544), .Y(\clock_divider/N52 ) );
  XOR2 U650 ( .A(\clock_divider/cnt2k5[13] ), .B(n545), .Y(\clock_divider/N53 ) );
  XOR2 U651 ( .A(\clock_divider/cnt2k5[14] ), .B(n546), .Y(\clock_divider/N54 ) );
  XOR2 U652 ( .A(\clock_divider/cnt2k5[15] ), .B(n582), .Y(\clock_divider/N55 ) );
  XOR2 U653 ( .A(\clock_divider/cnt5k[1] ), .B(\clock_divider/cnt5k[0] ), .Y(
        \clock_divider/N8 ) );
  XOR2 U654 ( .A(\clock_divider/cnt5k[2] ), .B(n547), .Y(\clock_divider/N9 )
         );
  XOR2 U655 ( .A(\clock_divider/cnt5k[3] ), .B(n548), .Y(\clock_divider/N10 )
         );
  XOR2 U656 ( .A(\clock_divider/cnt5k[4] ), .B(n549), .Y(\clock_divider/N11 )
         );
  XOR2 U657 ( .A(\clock_divider/cnt5k[5] ), .B(n550), .Y(\clock_divider/N12 )
         );
  XOR2 U658 ( .A(\clock_divider/cnt5k[6] ), .B(n551), .Y(\clock_divider/N13 )
         );
  XOR2 U659 ( .A(\clock_divider/cnt5k[7] ), .B(n552), .Y(\clock_divider/N14 )
         );
  XOR2 U660 ( .A(\clock_divider/cnt5k[8] ), .B(n553), .Y(\clock_divider/N15 )
         );
  XOR2 U661 ( .A(\clock_divider/cnt5k[9] ), .B(n554), .Y(\clock_divider/N16 )
         );
  XOR2 U662 ( .A(\clock_divider/cnt5k[10] ), .B(n555), .Y(\clock_divider/N17 )
         );
  XOR2 U663 ( .A(\clock_divider/cnt5k[11] ), .B(n556), .Y(\clock_divider/N18 )
         );
  XOR2 U664 ( .A(\clock_divider/cnt5k[12] ), .B(n557), .Y(\clock_divider/N19 )
         );
  XOR2 U665 ( .A(\clock_divider/cnt5k[13] ), .B(n558), .Y(\clock_divider/N20 )
         );
  XOR2 U666 ( .A(\clock_divider/cnt5k[14] ), .B(n559), .Y(\clock_divider/N21 )
         );
  XOR2 U667 ( .A(\clock_divider/cnt5k[15] ), .B(n583), .Y(\clock_divider/N22 )
         );
  XOR2 U668 ( .A(addrD[7]), .B(addrD[6]), .Y(\driver/N44 ) );
  XOR2 U669 ( .A(addrD[8]), .B(n560), .Y(\driver/N45 ) );
  XOR2 U670 ( .A(addrD[9]), .B(n561), .Y(\driver/N46 ) );
  XOR2 U671 ( .A(addrD[10]), .B(n584), .Y(\driver/N47 ) );
  XOR2 U672 ( .A(rex_down[1]), .B(rex_down[0]), .Y(\gamecenter/rex_top [1]) );
  XOR2 U673 ( .A(rex_down[2]), .B(n562), .Y(\gamecenter/rex_top [2]) );
  NAND2 U674 ( .A(n562), .B(rex_down[2]), .Y(n634) );
  INV U675 ( .A(n634), .Y(\gamecenter/add_37/carry[3] ) );
  XOR2 U676 ( .A(rex_down[5]), .B(\gamecenter/add_37/carry[5] ), .Y(
        \gamecenter/rex_top [5]) );
  XOR2 U677 ( .A(\r98/ab[1][2] ), .B(\U1/U1/Z_0 ), .Y(\r98/SUMB[1][2] ) );
  XOR2 U678 ( .A(\U1/U1/Z_1 ), .B(\U1/U1/Z_0 ), .Y(\r98/SUMB[1][3] ) );
  XOR2 U679 ( .A(n957), .B(n956), .Y(\decider/posy_m_obstacle_top [3]) );
  XOR2 U680 ( .A(n952), .B(n563), .Y(\decider/posy_m_obstacle_top [4]) );
  NAND2 U681 ( .A(n952), .B(n563), .Y(n635) );
  INV U682 ( .A(n635), .Y(\decider/sub_75/carry[5] ) );
  XOR2 U683 ( .A(n950), .B(\r293/carry[8] ), .Y(\decider/obstacle_right [8])
         );
  XOR2 U684 ( .A(n949), .B(n564), .Y(\decider/obstacle_right [9]) );
  XOR2 U685 ( .A(n948), .B(n565), .Y(\decider/obstacle_right [10]) );
  XOR2 U686 ( .A(n947), .B(n566), .Y(\decider/obstacle_right [11]) );
  XOR2 U687 ( .A(n946), .B(n567), .Y(\decider/obstacle_right [12]) );
  XOR2 U688 ( .A(n945), .B(n568), .Y(\decider/obstacle_right [13]) );
  XOR2 U689 ( .A(n944), .B(n569), .Y(\decider/obstacle_right [14]) );
  XOR2 U690 ( .A(n943), .B(n585), .Y(\decider/obstacle_right [15]) );
  XOR2 U691 ( .A(\decider/rex_top [3]), .B(
        \sub_0_root_decider/sub_49/carry[3] ), .Y(\decider/posy_m_rex_top[3] )
         );
  XOR2 U692 ( .A(\decider/rex_top [4]), .B(n533), .Y(
        \decider/posy_m_rex_top[4] ) );
  NAND2 U693 ( .A(\decider/rex_top [4]), .B(n533), .Y(n636) );
  INV U694 ( .A(n636), .Y(\sub_0_root_decider/sub_49/carry[5] ) );
  XOR2 U695 ( .A(obstacle_left[5]), .B(obstacle_left[4]), .Y(
        \gamecenter/obs_right [5]) );
  XOR2 U696 ( .A(obstacle_left[6]), .B(n570), .Y(\gamecenter/obs_right [6]) );
  XOR2 U697 ( .A(obstacle_left[7]), .B(n571), .Y(\gamecenter/obs_right [7]) );
  XOR2 U698 ( .A(obstacle_left[8]), .B(n572), .Y(\gamecenter/obs_right [8]) );
  XOR2 U699 ( .A(obstacle_left[9]), .B(n573), .Y(\gamecenter/obs_right [9]) );
  XOR2 U700 ( .A(obstacle_left[10]), .B(n574), .Y(\gamecenter/obs_right [10])
         );
  XOR2 U701 ( .A(obstacle_left[11]), .B(n575), .Y(\gamecenter/obs_right [11])
         );
  XOR2 U702 ( .A(obstacle_left[12]), .B(n576), .Y(\gamecenter/obs_right [12])
         );
  XOR2 U703 ( .A(obstacle_left[13]), .B(n577), .Y(\gamecenter/obs_right [13])
         );
  XOR2 U704 ( .A(obstacle_left[14]), .B(n578), .Y(\gamecenter/obs_right [14])
         );
  XOR2 U705 ( .A(obstacle_left[15]), .B(n586), .Y(\gamecenter/obs_right [15])
         );
  XOR2 U706 ( .A(\r98/ab[2][0] ), .B(\r98/ab[0][2] ), .Y(\decider/N57 ) );
  XOR2 U707 ( .A(\r98/CARRYB[4][0] ), .B(\r98/SUMB[3][2] ), .Y(\decider/N60 )
         );
  XOR2 U708 ( .A(n579), .B(\r98/SUMB[4][2] ), .Y(\r98/A1[4] ) );
  XOR2 U709 ( .A(n580), .B(\r98/SUMB[5][2] ), .Y(\decider/N62 ) );
  XOR2 U710 ( .A(n581), .B(\r98/SUMB[6][2] ), .Y(\decider/N63 ) );
  XOR2 U711 ( .A(n587), .B(\r98/SUMB[7][2] ), .Y(\decider/N64 ) );
  NAND2 U712 ( .A(n637), .B(n638), .Y(\sub_0_root_decider/sub_73/carry[15] )
         );
  NOR4B U713 ( .AN(n639), .B(\decider/obstacle_right [6]), .C(
        \decider/obstacle_right [4]), .D(\decider/obstacle_right [5]), .Y(n638) );
  NOR3 U714 ( .A(\decider/obstacle_right [7]), .B(\decider/obstacle_right [9]), 
        .C(\decider/obstacle_right [8]), .Y(n639) );
  NOR4B U715 ( .AN(n640), .B(\decider/obstacle_right [10]), .C(
        \decider/obstacle_right [12]), .D(\decider/obstacle_right [11]), .Y(
        n637) );
  NOR2 U716 ( .A(\decider/obstacle_right [14]), .B(
        \decider/obstacle_right [13]), .Y(n640) );
  NOR2B U717 ( .AN(\decider/obstacle_right [10]), .B(\U1/U4/Z_0 ), .Y(
        \r98/ab[7][2] ) );
  NOR2B U718 ( .AN(\U1/U1/Z_4 ), .B(\U1/U4/Z_0 ), .Y(\r98/ab[4][2] ) );
  NOR2B U719 ( .AN(\U1/U1/Z_4 ), .B(n936), .Y(\r98/ab[4][0] ) );
  NOR2B U720 ( .AN(\U1/U1/Z_3 ), .B(\U1/U4/Z_0 ), .Y(\r98/ab[3][2] ) );
  NOR2B U721 ( .AN(\U1/U1/Z_3 ), .B(n936), .Y(\r98/ab[3][0] ) );
  NOR2B U722 ( .AN(\U1/U1/Z_2 ), .B(\U1/U4/Z_0 ), .Y(\r98/ab[2][2] ) );
  NOR2B U723 ( .AN(\U1/U1/Z_2 ), .B(n936), .Y(\r98/ab[2][0] ) );
  NOR2B U724 ( .AN(\U1/U1/Z_1 ), .B(\U1/U4/Z_0 ), .Y(\r98/ab[1][2] ) );
  NOR2B U725 ( .AN(\U1/U1/Z_1 ), .B(n936), .Y(\r98/ab[1][0] ) );
  NOR2B U726 ( .AN(\U1/U1/Z_0 ), .B(\U1/U4/Z_0 ), .Y(\r98/ab[0][2] ) );
  NOR2B U727 ( .AN(\U1/U4/Z_0 ), .B(\decider/posy_m_rex_top[9] ), .Y(
        \r463/B_AS[9] ) );
  NOR2B U728 ( .AN(\U1/U4/Z_0 ), .B(\decider/posy_m_rex_top[8] ), .Y(
        \r463/B_AS[8] ) );
  NOR2B U729 ( .AN(\U1/U4/Z_0 ), .B(\decider/posy_m_rex_top[7] ), .Y(
        \r463/B_AS[7] ) );
  NAND2 U730 ( .A(\U1/U4/Z_0 ), .B(\decider/posy_m_rex_top[6] ), .Y(
        \r463/B_AS[6] ) );
  NOR2B U731 ( .AN(\U1/U4/Z_0 ), .B(\decider/posy_m_rex_top[5] ), .Y(
        \r463/B_AS[5] ) );
  NOR2B U732 ( .AN(\U1/U4/Z_0 ), .B(\decider/posy_m_rex_top[4] ), .Y(
        \r463/B_AS[4] ) );
  NAND2 U733 ( .A(\U1/U4/Z_0 ), .B(\decider/posy_m_rex_top[3] ), .Y(
        \r463/B_AS[3] ) );
  NOR2B U734 ( .AN(\U1/U4/Z_0 ), .B(\decider/posy_m_rex_top[2] ), .Y(
        \r463/B_AS[2] ) );
  NAND2 U735 ( .A(\U1/U4/Z_0 ), .B(\decider/posy_m_rex_top[1] ), .Y(
        \r463/B_AS[1] ) );
  NAND2B U736 ( .AN(\decider/rex_top [0]), .B(\U1/U4/Z_0 ), .Y(\r463/B_AS[0] )
         );
  NOR2B U737 ( .AN(\decider/sub_75/carry[6] ), .B(\U1/U4/Z_0 ), .Y(
        \r462/B_AS[9] ) );
  NOR2 U738 ( .A(\U1/U4/Z_0 ), .B(\decider/posy_m_obstacle_top [5]), .Y(
        \r462/B_AS[5] ) );
  NOR2 U739 ( .A(\U1/U4/Z_0 ), .B(\decider/posy_m_obstacle_top [4]), .Y(
        \r462/B_AS[4] ) );
  NOR2 U740 ( .A(n595), .B(\decider/posy_m_obstacle_top [3]), .Y(
        \r462/B_AS[3] ) );
  NOR2B U741 ( .AN(n956), .B(n595), .Y(\r462/B_AS[2] ) );
  NOR2B U742 ( .AN(addrD[1]), .B(n595), .Y(\r462/B_AS[1] ) );
  NOR2B U743 ( .AN(addrD[0]), .B(n595), .Y(\r462/B_AS[0] ) );
  OAI2BB1 U744 ( .A0N(n641), .A1N(dori_o), .B0(n642), .Y(n923) );
  NOR2 U745 ( .A(n643), .B(n644), .Y(n641) );
  OAI2BB2 U746 ( .B0(n645), .B1(n646), .A0N(\driver/N45 ), .A1N(n593), .Y(n924) );
  OAI211 U747 ( .A0(n648), .A1(n649), .B0(n650), .C0(n651), .Y(n925) );
  AOI2BB2 U748 ( .B0(db_o[7]), .B1(n601), .A0N(n653), .A1N(n654), .Y(n651) );
  NOR2B U749 ( .AN(n655), .B(n656), .Y(n653) );
  OAI32 U750 ( .A0(n657), .A1(addrT[1]), .A2(n658), .B0(n659), .B1(n660), .Y(
        n656) );
  NOR2B U751 ( .AN(n661), .B(n598), .Y(n659) );
  AOI2BB1 U752 ( .A0N(n663), .A1N(n664), .B0(n665), .Y(n648) );
  OAI211 U753 ( .A0(n666), .A1(n654), .B0(n667), .C0(n668), .Y(n926) );
  AOI2BB2 U754 ( .B0(db_o[6]), .B1(n601), .A0N(n669), .A1N(n649), .Y(n668) );
  AOI211 U755 ( .A0(n670), .A1(n671), .B0(n672), .C0(n673), .Y(n669) );
  MX2 U756 ( .A(n674), .B(n675), .S0(n661), .Y(n673) );
  NOR2B U757 ( .AN(n676), .B(addrT[4]), .Y(n675) );
  OAI31 U758 ( .A0(n663), .A1(addrT[1]), .A2(n677), .B0(n678), .Y(n672) );
  INV U759 ( .A(n679), .Y(n667) );
  AOI31 U760 ( .A0(n680), .A1(n677), .A2(n681), .B0(n682), .Y(n666) );
  NAND2B U761 ( .AN(n683), .B(n684), .Y(n928) );
  MX2 U762 ( .A(n685), .B(n938), .S0(n686), .Y(n684) );
  AOI21 U763 ( .A0(\gamecenter/rex_jmp_ptr[0] ), .A1(
        \gamecenter/rex_jmp_ptr[3] ), .B0(n687), .Y(n685) );
  OAI2BB2 U764 ( .B0(n944), .B1(n600), .A0N(\gamecenter/N178 ), .A1N(n594), 
        .Y(n929) );
  NAND2B U765 ( .AN(n690), .B(n691), .Y(n930) );
  MX2 U766 ( .A(\gamecenter/N171 ), .B(obstacle_left[7]), .S0(n692), .Y(n690)
         );
  NAND2B U767 ( .AN(n693), .B(n691), .Y(n931) );
  MX2 U768 ( .A(\gamecenter/N170 ), .B(obstacle_left[6]), .S0(n692), .Y(n693)
         );
  NAND2B U769 ( .AN(n694), .B(n691), .Y(n932) );
  AOI21 U770 ( .A0(n695), .A1(n600), .B0(n696), .Y(n691) );
  MX2 U771 ( .A(\gamecenter/N169 ), .B(obstacle_left[5]), .S0(n692), .Y(n694)
         );
  OAI2BB2 U772 ( .B0(n946), .B1(n600), .A0N(\gamecenter/N176 ), .A1N(n594), 
        .Y(n933) );
  OAI2BB2 U773 ( .B0(n943), .B1(n600), .A0N(\gamecenter/N179 ), .A1N(n594), 
        .Y(n934) );
  INV U774 ( .A(rex_down[3]), .Y(n938) );
  INV U775 ( .A(rex_down[2]), .Y(n939) );
  INV U776 ( .A(obstacle_left[15]), .Y(n943) );
  INV U777 ( .A(obstacle_left[12]), .Y(n946) );
  OR2 U778 ( .A(n697), .B(n696), .Y(n524) );
  MX2 U779 ( .A(n692), .B(n698), .S0(n608), .Y(n697) );
  NOR2B U780 ( .AN(n600), .B(n695), .Y(n698) );
  MX2 U781 ( .A(n699), .B(obstacle_left[4]), .S0(n692), .Y(n523) );
  AOI2BB1 U782 ( .A0N(n695), .A1N(\gamecenter/N168 ), .B0(n700), .Y(n699) );
  OAI2BB2 U783 ( .B0(n949), .B1(n688), .A0N(\gamecenter/N173 ), .A1N(n594), 
        .Y(n522) );
  INV U784 ( .A(obstacle_left[9]), .Y(n949) );
  OAI2BB2 U785 ( .B0(n948), .B1(n688), .A0N(\gamecenter/N174 ), .A1N(n594), 
        .Y(n521) );
  INV U786 ( .A(obstacle_left[10]), .Y(n948) );
  OAI2BB2 U787 ( .B0(n945), .B1(n688), .A0N(\gamecenter/N177 ), .A1N(n594), 
        .Y(n519) );
  INV U788 ( .A(obstacle_left[13]), .Y(n945) );
  MX2 U789 ( .A(n701), .B(game_state[1]), .S0(n702), .Y(n518) );
  MX2 U790 ( .A(n703), .B(game_state[0]), .S0(n702), .Y(n517) );
  AOI21 U791 ( .A0(n700), .A1(game_state[1]), .B0(n704), .Y(n702) );
  MX2 U792 ( .A(n705), .B(n706), .S0(n701), .Y(n704) );
  NOR2B U793 ( .AN(n707), .B(n708), .Y(n705) );
  MX2 U794 ( .A(n709), .B(\gamecenter/rex_falling ), .S0(n710), .Y(n516) );
  AOI21 U795 ( .A0(n711), .A1(n712), .B0(n713), .Y(n710) );
  OAI2BB1 U796 ( .A0N(n707), .A1N(n714), .B0(\gamecenter/rex_falling ), .Y(
        n711) );
  NAND2B U797 ( .AN(n715), .B(game_state[0]), .Y(n709) );
  INV U798 ( .A(n716), .Y(n515) );
  AOI22 U799 ( .A0(n717), .A1(\gamecenter/rex_jmp_ptr[7] ), .B0(
        \gamecenter/N133 ), .B1(n597), .Y(n716) );
  MX2 U800 ( .A(n717), .B(n597), .S0(n719), .Y(n514) );
  OAI2BB2 U801 ( .B0(n720), .B1(n721), .A0N(\gamecenter/N127 ), .A1N(n597), 
        .Y(n513) );
  OAI2BB2 U802 ( .B0(n722), .B1(n721), .A0N(\gamecenter/N128 ), .A1N(n597), 
        .Y(n512) );
  OAI2BB2 U803 ( .B0(n723), .B1(n721), .A0N(\gamecenter/N129 ), .A1N(n597), 
        .Y(n511) );
  OAI2BB2 U804 ( .B0(n721), .B1(n724), .A0N(\gamecenter/N130 ), .A1N(n597), 
        .Y(n510) );
  INV U805 ( .A(\gamecenter/rex_jmp_ptr[4] ), .Y(n724) );
  OAI2BB2 U806 ( .B0(n721), .B1(n725), .A0N(\gamecenter/N131 ), .A1N(n597), 
        .Y(n509) );
  OAI2BB2 U807 ( .B0(n721), .B1(n726), .A0N(\gamecenter/N132 ), .A1N(n597), 
        .Y(n508) );
  NOR2B U808 ( .AN(n701), .B(n717), .Y(n718) );
  INV U809 ( .A(\gamecenter/rex_jmp_ptr[6] ), .Y(n726) );
  INV U810 ( .A(n717), .Y(n721) );
  AOI2BB1 U811 ( .A0N(n727), .A1N(n686), .B0(n713), .Y(n717) );
  AND2 U812 ( .A(n707), .B(n696), .Y(n713) );
  NOR2B U813 ( .AN(n700), .B(n692), .Y(n696) );
  NOR3B U814 ( .AN(\gamecenter/in_up_history[0] ), .B(
        \gamecenter/in_up_history[1] ), .C(\gamecenter/in_up_history[2] ), .Y(
        n707) );
  AND2 U815 ( .A(\gamecenter/rex_falling ), .B(n714), .Y(n727) );
  NOR4BB U816 ( .AN(n728), .BN(n720), .C(n729), .D(\gamecenter/rex_jmp_ptr[0] ), .Y(n714) );
  NAND2B U817 ( .AN(n596), .B(n731), .Y(n507) );
  MX2 U818 ( .A(n732), .B(n937), .S0(n686), .Y(n731) );
  NOR3B U819 ( .AN(n733), .B(n734), .C(n687), .Y(n732) );
  OAI32 U820 ( .A0(n719), .A1(\gamecenter/rex_jmp_ptr[1] ), .A2(n722), .B0(
        n735), .B1(n733), .Y(n687) );
  NOR2B U821 ( .AN(n723), .B(n722), .Y(n735) );
  NAND2B U822 ( .AN(n596), .B(n736), .Y(n506) );
  MX2 U823 ( .A(n737), .B(n940), .S0(n686), .Y(n736) );
  INV U824 ( .A(rex_down[1]), .Y(n940) );
  NOR2B U825 ( .AN(n738), .B(n739), .Y(n737) );
  MX2 U826 ( .A(n740), .B(rex_down[2]), .S0(n686), .Y(n505) );
  OAI221 U827 ( .A0(n733), .A1(n729), .B0(n722), .B1(n719), .C0(n738), .Y(n740) );
  AOI31 U828 ( .A0(\gamecenter/rex_jmp_ptr[3] ), .A1(n720), .A2(n719), .B0(
        n734), .Y(n738) );
  NOR3B U829 ( .AN(n741), .B(n719), .C(\gamecenter/rex_jmp_ptr[1] ), .Y(n734)
         );
  NAND2 U830 ( .A(\gamecenter/rex_jmp_ptr[1] ), .B(n719), .Y(n733) );
  INV U831 ( .A(n742), .Y(n503) );
  AOI211 U832 ( .A0(rex_down[4]), .A1(n686), .B0(n683), .C0(n596), .Y(n742) );
  NOR4BB U833 ( .AN(\gamecenter/rex_jmp_ptr[1] ), .BN(n712), .C(n729), .D(n719), .Y(n730) );
  INV U834 ( .A(n741), .Y(n729) );
  NOR2 U835 ( .A(\gamecenter/rex_jmp_ptr[2] ), .B(\gamecenter/rex_jmp_ptr[3] ), 
        .Y(n741) );
  NOR3B U836 ( .AN(n720), .B(n686), .C(n722), .Y(n683) );
  MX2 U837 ( .A(n743), .B(rex_down[5]), .S0(n686), .Y(n502) );
  INV U838 ( .A(n712), .Y(n686) );
  OAI21 U839 ( .A0(n720), .A1(n722), .B0(n723), .Y(n743) );
  INV U840 ( .A(\gamecenter/rex_jmp_ptr[1] ), .Y(n720) );
  NOR3B U841 ( .AN(n701), .B(n706), .C(n708), .Y(n712) );
  NOR2B U842 ( .AN(n748), .B(n749), .Y(n747) );
  AOI33 U843 ( .A0(n750), .A1(n751), .A2(n752), .B0(rex_down[3]), .B1(
        rex_down[4]), .B2(rex_down[2]), .Y(n748) );
  NOR4B U844 ( .AN(n753), .B(\gamecenter/obs_right [5]), .C(
        \gamecenter/obs_right [14]), .D(\gamecenter/obs_right [15]), .Y(n752)
         );
  NOR4 U845 ( .A(\gamecenter/obs_right [9]), .B(\gamecenter/obs_right [8]), 
        .C(\gamecenter/obs_right [7]), .D(\gamecenter/obs_right [6]), .Y(n753)
         );
  NOR3 U846 ( .A(\gamecenter/obs_right [11]), .B(\gamecenter/obs_right [13]), 
        .C(\gamecenter/obs_right [12]), .Y(n751) );
  INV U847 ( .A(obstacle_left[4]), .Y(n951) );
  NOR4BB U848 ( .AN(n757), .BN(n758), .C(\gamecenter/rex_top [3]), .D(
        \gamecenter/rex_top [2]), .Y(n756) );
  NOR2 U849 ( .A(\gamecenter/rex_top [5]), .B(\gamecenter/rex_top [4]), .Y(
        n757) );
  INV U850 ( .A(rex_down[0]), .Y(n937) );
  INV U851 ( .A(rex_down[5]), .Y(n744) );
  NOR2B U852 ( .AN(n703), .B(n700), .Y(n701) );
  INV U853 ( .A(game_state[0]), .Y(n700) );
  INV U854 ( .A(game_state[1]), .Y(n703) );
  MX2 U855 ( .A(n759), .B(n760), .S0(n953), .Y(n491) );
  INV U856 ( .A(addrD[5]), .Y(n953) );
  NOR2B U857 ( .AN(n761), .B(n642), .Y(n760) );
  OAI2BB1 U858 ( .A0N(n952), .A1N(n599), .B0(n763), .Y(n759) );
  MX2 U859 ( .A(n764), .B(n599), .S0(n954), .Y(n490) );
  MX2 U860 ( .A(n765), .B(n766), .S0(n955), .Y(n489) );
  NOR2B U861 ( .AN(n599), .B(n954), .Y(n766) );
  INV U862 ( .A(n767), .Y(n765) );
  MX2 U863 ( .A(n768), .B(n769), .S0(n956), .Y(n488) );
  NOR3B U864 ( .AN(n599), .B(n955), .C(n954), .Y(n769) );
  OAI2BB1 U865 ( .A0N(n955), .A1N(n762), .B0(n767), .Y(n768) );
  AOI21 U866 ( .A0(n954), .A1(n762), .B0(n764), .Y(n767) );
  INV U867 ( .A(addrD[0]), .Y(n954) );
  MX2 U868 ( .A(n770), .B(n771), .S0(n957), .Y(n487) );
  NOR2B U869 ( .AN(n772), .B(n642), .Y(n771) );
  MX2 U870 ( .A(n773), .B(n774), .S0(n952), .Y(n486) );
  NOR3B U871 ( .AN(n772), .B(n642), .C(n957), .Y(n774) );
  INV U872 ( .A(n763), .Y(n773) );
  AOI21 U873 ( .A0(n957), .A1(n762), .B0(n770), .Y(n763) );
  OAI21 U874 ( .A0(n772), .A1(n642), .B0(n643), .Y(n770) );
  INV U875 ( .A(n764), .Y(n643) );
  INV U876 ( .A(n762), .Y(n642) );
  NOR3 U877 ( .A(n927), .B(n764), .C(n775), .Y(n762) );
  AOI2BB1 U878 ( .A0N(n776), .A1N(n777), .B0(n778), .Y(n764) );
  NOR2B U879 ( .AN(rstn), .B(n779), .Y(n776) );
  OAI2BB2 U880 ( .B0(n645), .B1(n780), .A0N(\driver/N47 ), .A1N(n593), .Y(n485) );
  MX2 U881 ( .A(n781), .B(n593), .S0(n782), .Y(n484) );
  INV U882 ( .A(n783), .Y(n483) );
  AOI22 U883 ( .A0(n781), .A1(addrD[7]), .B0(\driver/N44 ), .B1(n593), .Y(n783) );
  OAI2BB2 U884 ( .B0(n645), .B1(n784), .A0N(\driver/N46 ), .A1N(n593), .Y(n481) );
  NOR3B U885 ( .AN(rstn), .B(n781), .C(n775), .Y(n647) );
  OAI2BB1 U886 ( .A0N(state[2]), .A1N(n785), .B0(n786), .Y(n480) );
  NAND2 U887 ( .A(n787), .B(n786), .Y(n479) );
  MX2 U888 ( .A(n788), .B(n789), .S0(n790), .Y(n787) );
  AOI31 U889 ( .A0(cs_o[3]), .A1(addrD[7]), .A2(n791), .B0(n792), .Y(n789) );
  NOR3B U890 ( .AN(addrD[6]), .B(n646), .C(n775), .Y(n791) );
  INV U891 ( .A(addrD[8]), .Y(n646) );
  NAND3B U892 ( .AN(n793), .B(n786), .C(n794), .Y(n478) );
  MX2 U893 ( .A(n795), .B(n775), .S0(n790), .Y(n794) );
  OAI31 U894 ( .A0(n796), .A1(n927), .A2(n797), .B0(n790), .Y(n786) );
  INV U895 ( .A(n785), .Y(n790) );
  AOI211 U896 ( .A0(en_o), .A1(n796), .B0(n644), .C0(n645), .Y(n785) );
  INV U897 ( .A(n781), .Y(n645) );
  AOI32 U898 ( .A0(n778), .A1(addrD[5]), .A2(n761), .B0(n798), .B1(n799), .Y(
        n781) );
  OR2 U899 ( .A(n779), .B(n927), .Y(n799) );
  NOR2B U900 ( .AN(\driver/start_history [1]), .B(start), .Y(n779) );
  NOR3B U901 ( .AN(n772), .B(n952), .C(n957), .Y(n761) );
  INV U902 ( .A(addrD[3]), .Y(n957) );
  INV U903 ( .A(addrD[4]), .Y(n952) );
  NOR3B U904 ( .AN(addrD[0]), .B(n955), .C(n956), .Y(n772) );
  INV U905 ( .A(addrD[2]), .Y(n956) );
  INV U906 ( .A(addrD[1]), .Y(n955) );
  NOR2 U907 ( .A(n800), .B(n793), .Y(n796) );
  INV U908 ( .A(state[2]), .Y(n800) );
  MX2 U909 ( .A(\decider/N104 ), .B(addrT[0]), .S0(n602), .Y(n476) );
  MX2 U910 ( .A(\decider/N105 ), .B(addrT[1]), .S0(n602), .Y(n475) );
  MX2 U911 ( .A(\decider/N106 ), .B(addrT[2]), .S0(n602), .Y(n474) );
  MX2 U912 ( .A(\decider/N107 ), .B(addrT[3]), .S0(n602), .Y(n473) );
  MX2 U913 ( .A(\decider/N108 ), .B(addrT[4]), .S0(n602), .Y(n472) );
  MX2 U914 ( .A(\decider/N109 ), .B(addrT[5]), .S0(n602), .Y(n471) );
  MX2 U915 ( .A(\decider/N110 ), .B(addrT[6]), .S0(n602), .Y(n470) );
  MX2 U916 ( .A(\decider/N111 ), .B(addrT[7]), .S0(n602), .Y(n469) );
  MX2 U917 ( .A(\decider/N112 ), .B(addrT[8]), .S0(n602), .Y(n468) );
  MX2 U918 ( .A(\decider/N113 ), .B(addrT[9]), .S0(n602), .Y(n467) );
  OAI211 U919 ( .A0(n802), .A1(n654), .B0(n803), .C0(n804), .Y(n466) );
  AOI222 U920 ( .A0(db_o[1]), .A1(n601), .B0(n805), .B1(addrD[7]), .C0(n679), 
        .C1(addrD[1]), .Y(n804) );
  AOI31 U921 ( .A0(n806), .A1(n807), .A2(n808), .B0(n809), .Y(n803) );
  NOR2B U922 ( .AN(n810), .B(n671), .Y(n808) );
  NOR4BB U923 ( .AN(n811), .BN(n812), .C(n813), .D(n814), .Y(n802) );
  OAI2BB2 U924 ( .B0(n815), .B1(n816), .A0N(n806), .A1N(n817), .Y(n814) );
  AOI21 U925 ( .A0(addrT[4]), .A1(n818), .B0(n817), .Y(n815) );
  OAI2BB1 U926 ( .A0N(n677), .A1N(addrT[1]), .B0(n819), .Y(n818) );
  OAI33 U927 ( .A0(n820), .A1(addrT[2]), .A2(n598), .B0(n678), .B1(addrT[3]), 
        .B2(n664), .Y(n813) );
  AOI31 U928 ( .A0(n821), .A1(n822), .A2(n681), .B0(n823), .Y(n811) );
  INV U929 ( .A(n824), .Y(n465) );
  AOI221 U930 ( .A0(addrD[2]), .A1(n679), .B0(n601), .B1(db_o[2]), .C0(n825), 
        .Y(n824) );
  INV U931 ( .A(n826), .Y(n825) );
  AOI221 U932 ( .A0(n805), .A1(addrD[8]), .B0(n591), .B1(n828), .C0(n809), .Y(
        n826) );
  OAI221 U933 ( .A0(n829), .A1(n830), .B0(addrT[2]), .B1(n831), .C0(n832), .Y(
        n828) );
  AOI221 U934 ( .A0(n833), .A1(n830), .B0(n821), .B1(n834), .C0(n835), .Y(n831) );
  AOI32 U935 ( .A0(n665), .A1(n807), .A2(n836), .B0(n833), .B1(addrT[1]), .Y(
        n829) );
  OAI211 U936 ( .A0(n837), .A1(n654), .B0(n838), .C0(n839), .Y(n464) );
  AOI22 U937 ( .A0(db_o[3]), .A1(n601), .B0(addrD[3]), .B1(n679), .Y(n839) );
  AOI31 U938 ( .A0(n670), .A1(n810), .A2(n664), .B0(n840), .Y(n838) );
  NOR4BB U939 ( .AN(n841), .BN(n820), .C(n842), .D(n843), .Y(n837) );
  OAI221 U940 ( .A0(n844), .A1(n845), .B0(n846), .B1(n661), .C0(n832), .Y(n843) );
  AOI221 U941 ( .A0(n847), .A1(n848), .B0(n830), .B1(n849), .C0(n850), .Y(n832) );
  OR2 U942 ( .A(n823), .B(n851), .Y(n850) );
  OAI2BB2 U943 ( .B0(n807), .B1(n598), .A0N(n661), .A1N(n819), .Y(n847) );
  AOI22 U944 ( .A0(n852), .A1(n677), .B0(addrT[3]), .B1(n662), .Y(n844) );
  AOI31 U945 ( .A0(n853), .A1(n854), .A2(n849), .B0(n855), .Y(n841) );
  OAI211 U946 ( .A0(n856), .A1(n654), .B0(n857), .C0(n858), .Y(n463) );
  AOI22 U947 ( .A0(db_o[4]), .A1(n601), .B0(addrD[4]), .B1(n679), .Y(n858) );
  AOI31 U948 ( .A0(n810), .A1(n853), .A2(n835), .B0(n840), .Y(n857) );
  NOR4B U949 ( .AN(n859), .B(n860), .C(n861), .D(n862), .Y(n856) );
  MX2 U950 ( .A(n863), .B(n864), .S0(n853), .Y(n862) );
  NOR2B U951 ( .AN(n835), .B(addrT[3]), .Y(n863) );
  AOI2BB1 U952 ( .A0N(n864), .A1N(n865), .B0(addrT[5]), .Y(n861) );
  MX2 U953 ( .A(n866), .B(n867), .S0(n868), .Y(n865) );
  NOR2B U954 ( .AN(n674), .B(n854), .Y(n867) );
  NOR2B U955 ( .AN(n806), .B(n869), .Y(n866) );
  NOR4 U956 ( .A(n823), .B(n851), .C(n842), .D(n870), .Y(n859) );
  OAI211 U957 ( .A0(n871), .A1(n649), .B0(n872), .C0(n873), .Y(n462) );
  AOI22 U958 ( .A0(db_o[5]), .A1(n601), .B0(addrD[5]), .B1(n679), .Y(n873) );
  NOR2B U959 ( .AN(n874), .B(n840), .Y(n872) );
  NOR2B U960 ( .AN(n875), .B(n876), .Y(n840) );
  OAI31 U961 ( .A0(n877), .A1(n682), .A2(n860), .B0(n591), .Y(n874) );
  INV U962 ( .A(n878), .Y(n860) );
  AOI21 U963 ( .A0(n681), .A1(n835), .B0(n855), .Y(n878) );
  NOR3B U964 ( .AN(n822), .B(addrT[0]), .C(n879), .Y(n855) );
  OAI211 U965 ( .A0(n869), .A1(n880), .B0(n881), .C0(n882), .Y(n682) );
  NOR2B U966 ( .AN(n655), .B(n870), .Y(n882) );
  NOR4BB U967 ( .AN(addrT[2]), .BN(n807), .C(n883), .D(n830), .Y(n870) );
  NOR3 U968 ( .A(n823), .B(n849), .C(n884), .Y(n655) );
  NOR4BB U969 ( .AN(n819), .BN(addrT[7]), .C(n662), .D(n657), .Y(n884) );
  NAND3B U970 ( .AN(addrT[5]), .B(n807), .C(n852), .Y(n657) );
  NOR2B U971 ( .AN(addrT[4]), .B(n678), .Y(n849) );
  NOR2B U972 ( .AN(n885), .B(n854), .Y(n823) );
  NOR2 U973 ( .A(n851), .B(n864), .Y(n881) );
  NOR2B U974 ( .AN(n674), .B(n879), .Y(n864) );
  INV U975 ( .A(n681), .Y(n879) );
  NOR2 U976 ( .A(addrT[2]), .B(n830), .Y(n681) );
  NOR2B U977 ( .AN(n662), .B(n846), .Y(n851) );
  INV U978 ( .A(n885), .Y(n846) );
  NOR2B U979 ( .AN(n822), .B(addrT[3]), .Y(n885) );
  OAI21 U980 ( .A0(n662), .A1(addrT[2]), .B0(n806), .Y(n880) );
  MX2 U981 ( .A(n886), .B(n842), .S0(n677), .Y(n877) );
  NOR3B U982 ( .AN(n852), .B(addrT[1]), .C(n845), .Y(n842) );
  INV U983 ( .A(n833), .Y(n845) );
  NOR2 U984 ( .A(n883), .B(n807), .Y(n833) );
  NOR2B U985 ( .AN(n830), .B(addrT[2]), .Y(n852) );
  NOR3B U986 ( .AN(n834), .B(n854), .C(addrT[1]), .Y(n886) );
  INV U987 ( .A(n810), .Y(n649) );
  NOR2 U988 ( .A(n830), .B(n654), .Y(n810) );
  INV U989 ( .A(n827), .Y(n654) );
  AOI211 U990 ( .A0(n835), .A1(n821), .B0(n887), .C0(n888), .Y(n871) );
  MX2 U991 ( .A(n889), .B(n674), .S0(n853), .Y(n888) );
  NOR2B U992 ( .AN(n806), .B(n807), .Y(n674) );
  NOR2B U993 ( .AN(n677), .B(n660), .Y(n889) );
  INV U994 ( .A(n834), .Y(n660) );
  NOR2 U995 ( .A(n663), .B(n807), .Y(n834) );
  OAI32 U996 ( .A0(n883), .A1(addrT[4]), .A2(n868), .B0(n890), .B1(n678), .Y(
        n887) );
  INV U997 ( .A(n665), .Y(n678) );
  NOR2B U998 ( .AN(addrT[5]), .B(n658), .Y(n665) );
  INV U999 ( .A(n806), .Y(n658) );
  NOR2 U1000 ( .A(n819), .B(addrT[7]), .Y(n806) );
  NOR2B U1001 ( .AN(n821), .B(addrT[2]), .Y(n890) );
  OAI2BB2 U1002 ( .B0(n950), .B1(n688), .A0N(\gamecenter/N172 ), .A1N(n594), 
        .Y(n457) );
  INV U1003 ( .A(obstacle_left[8]), .Y(n950) );
  OAI2BB2 U1004 ( .B0(n947), .B1(n688), .A0N(\gamecenter/N175 ), .A1N(n594), 
        .Y(n456) );
  NOR3B U1005 ( .AN(game_state[0]), .B(n692), .C(n695), .Y(n689) );
  NAND2 U1006 ( .A(n891), .B(n892), .Y(n749) );
  NOR4BB U1007 ( .AN(n893), .BN(n941), .C(obstacle_left[15]), .D(
        obstacle_left[5]), .Y(n892) );
  INV U1008 ( .A(obstacle_left[6]), .Y(n941) );
  NOR3B U1009 ( .AN(n942), .B(obstacle_left[9]), .C(obstacle_left[8]), .Y(n893) );
  INV U1010 ( .A(obstacle_left[7]), .Y(n942) );
  NOR4BB U1011 ( .AN(n894), .BN(n947), .C(obstacle_left[12]), .D(
        obstacle_left[10]), .Y(n891) );
  NOR2B U1012 ( .AN(n944), .B(obstacle_left[13]), .Y(n894) );
  INV U1013 ( .A(obstacle_left[14]), .Y(n944) );
  INV U1014 ( .A(n688), .Y(n692) );
  NOR2 U1015 ( .A(game_state[1]), .B(n708), .Y(n688) );
  INV U1016 ( .A(obstacle_left[11]), .Y(n947) );
  OAI211 U1017 ( .A0(n782), .A1(n650), .B0(n895), .C0(n896), .Y(n445) );
  AOI22 U1018 ( .A0(db_o[0]), .A1(n601), .B0(addrD[0]), .B1(n592), .Y(n896) );
  NOR2B U1019 ( .AN(n792), .B(n897), .Y(n679) );
  NOR2B U1020 ( .AN(n898), .B(n809), .Y(n895) );
  NOR2B U1021 ( .AN(n797), .B(n897), .Y(n809) );
  OAI31 U1022 ( .A0(n899), .A1(n900), .A2(n901), .B0(n827), .Y(n898) );
  NOR4B U1023 ( .AN(n902), .B(n897), .C(n775), .D(n602), .Y(n827) );
  AOI21 U1024 ( .A0(n903), .A1(\decider/posx_m_obstacle_right[15] ), .B0(n595), 
        .Y(n801) );
  NOR2 U1025 ( .A(\decider/sub_75/carry[6] ), .B(\decider/obstacle_right [15]), 
        .Y(n903) );
  NOR2 U1026 ( .A(addrT[9]), .B(addrT[8]), .Y(n902) );
  MX2 U1027 ( .A(n904), .B(n905), .S0(n830), .Y(n901) );
  NOR2B U1028 ( .AN(n670), .B(n664), .Y(n905) );
  NOR2B U1029 ( .AN(addrT[2]), .B(n868), .Y(n664) );
  INV U1030 ( .A(n662), .Y(n868) );
  NOR2B U1031 ( .AN(n807), .B(n663), .Y(n670) );
  NOR2B U1032 ( .AN(n662), .B(n883), .Y(n904) );
  INV U1033 ( .A(n676), .Y(n883) );
  NOR2 U1034 ( .A(addrT[6]), .B(n816), .Y(n676) );
  NOR2 U1035 ( .A(n853), .B(n677), .Y(n662) );
  INV U1036 ( .A(n812), .Y(n900) );
  AOI2BB1 U1037 ( .A0N(addrT[3]), .A1N(n820), .B0(n848), .Y(n812) );
  NOR3B U1038 ( .AN(addrT[3]), .B(n854), .C(n816), .Y(n848) );
  OAI32 U1039 ( .A0(n820), .A1(addrT[2]), .A2(n661), .B0(n906), .B1(n816), .Y(
        n899) );
  OR2 U1040 ( .A(addrT[5]), .B(addrT[7]), .Y(n816) );
  AOI2BB2 U1041 ( .B0(addrT[4]), .B1(n907), .A0N(n908), .A1N(n869), .Y(n906)
         );
  INV U1042 ( .A(n817), .Y(n869) );
  NOR2 U1043 ( .A(addrT[3]), .B(n807), .Y(n817) );
  INV U1044 ( .A(addrT[4]), .Y(n807) );
  NOR2B U1045 ( .AN(n677), .B(n671), .Y(n908) );
  INV U1046 ( .A(n836), .Y(n671) );
  NOR2 U1047 ( .A(n854), .B(n853), .Y(n836) );
  INV U1048 ( .A(addrT[2]), .Y(n854) );
  INV U1049 ( .A(addrT[0]), .Y(n677) );
  OAI21 U1050 ( .A0(n853), .A1(n830), .B0(n819), .Y(n907) );
  INV U1051 ( .A(addrT[3]), .Y(n830) );
  INV U1052 ( .A(addrT[1]), .Y(n853) );
  INV U1053 ( .A(n821), .Y(n661) );
  NOR2 U1054 ( .A(addrT[1]), .B(addrT[0]), .Y(n821) );
  INV U1055 ( .A(n835), .Y(n820) );
  NOR2B U1056 ( .AN(n822), .B(addrT[4]), .Y(n835) );
  NOR2B U1057 ( .AN(n819), .B(n663), .Y(n822) );
  INV U1058 ( .A(n680), .Y(n663) );
  NOR2B U1059 ( .AN(addrT[5]), .B(addrT[7]), .Y(n680) );
  INV U1060 ( .A(addrT[6]), .Y(n819) );
  INV U1061 ( .A(n805), .Y(n650) );
  NOR3B U1062 ( .AN(n909), .B(n897), .C(n788), .Y(n805) );
  INV U1063 ( .A(n875), .Y(n897) );
  NOR2 U1064 ( .A(n927), .B(n601), .Y(n875) );
  NOR3 U1065 ( .A(n798), .B(n644), .C(n778), .Y(n652) );
  NOR2 U1066 ( .A(n910), .B(n775), .Y(n778) );
  NAND2 U1067 ( .A(n788), .B(n909), .Y(n775) );
  AOI2BB1 U1068 ( .A0N(n792), .A1N(n911), .B0(n910), .Y(n644) );
  INV U1069 ( .A(n876), .Y(n911) );
  AOI21 U1070 ( .A0(n909), .A1(state[0]), .B0(n797), .Y(n876) );
  NOR2B U1071 ( .AN(n793), .B(state[2]), .Y(n797) );
  NOR3B U1072 ( .AN(state[1]), .B(state[0]), .C(state[2]), .Y(n792) );
  INV U1073 ( .A(n777), .Y(n798) );
  AOI31 U1074 ( .A0(state[2]), .A1(en_o), .A2(n793), .B0(n927), .Y(n777) );
  NOR2B U1075 ( .AN(state[1]), .B(n788), .Y(n793) );
  INV U1076 ( .A(state[0]), .Y(n788) );
  NOR2B U1077 ( .AN(n795), .B(state[2]), .Y(n909) );
  INV U1078 ( .A(state[1]), .Y(n795) );
  XOR2 U1079 ( .A(n912), .B(clk24Hz), .Y(n444) );
  MX2 U1080 ( .A(jmp_key), .B(\gamecenter/in_up_history[0] ), .S0(n708), .Y(
        n443) );
  MX2 U1081 ( .A(\gamecenter/in_up_history[0] ), .B(
        \gamecenter/in_up_history[1] ), .S0(n708), .Y(n442) );
  MX2 U1082 ( .A(\gamecenter/in_up_history[1] ), .B(
        \gamecenter/in_up_history[2] ), .S0(n708), .Y(n441) );
  NAND2B U1083 ( .AN(\gamecenter/clk24HzHistory ), .B(clk24Hz), .Y(n708) );
  XOR2 U1084 ( .A(n913), .B(start), .Y(n440) );
  NOR2B U1085 ( .AN(n910), .B(n927), .Y(\driver/N96 ) );
  INV U1086 ( .A(rstn), .Y(n927) );
  INV U1087 ( .A(en_o), .Y(n910) );
  NOR2B U1088 ( .AN(\U1/U1/Z_0 ), .B(n936), .Y(\decider/N55 ) );
  NOR2B U1089 ( .AN(addrD[9]), .B(n780), .Y(cs_o[3]) );
  NOR2B U1090 ( .AN(n784), .B(n780), .Y(cs_o[2]) );
  INV U1091 ( .A(addrD[10]), .Y(n780) );
  NOR2B U1092 ( .AN(addrD[9]), .B(addrD[10]), .Y(cs_o[1]) );
  NOR2B U1093 ( .AN(\clock_divider/N55 ), .B(n912), .Y(\clock_divider/N71 ) );
  NOR2B U1094 ( .AN(\clock_divider/N54 ), .B(n912), .Y(\clock_divider/N70 ) );
  NOR2B U1095 ( .AN(\clock_divider/N53 ), .B(n912), .Y(\clock_divider/N69 ) );
  NOR2B U1096 ( .AN(\clock_divider/N52 ), .B(n912), .Y(\clock_divider/N68 ) );
  NOR2B U1097 ( .AN(\clock_divider/N51 ), .B(n912), .Y(\clock_divider/N67 ) );
  NOR2B U1098 ( .AN(\clock_divider/N50 ), .B(n912), .Y(\clock_divider/N66 ) );
  NOR2B U1099 ( .AN(\clock_divider/N49 ), .B(n912), .Y(\clock_divider/N65 ) );
  NOR2B U1100 ( .AN(\clock_divider/N48 ), .B(n912), .Y(\clock_divider/N64 ) );
  NOR2B U1101 ( .AN(\clock_divider/N47 ), .B(n912), .Y(\clock_divider/N63 ) );
  NOR2B U1102 ( .AN(\clock_divider/N46 ), .B(n912), .Y(\clock_divider/N62 ) );
  NOR2B U1103 ( .AN(\clock_divider/N45 ), .B(n912), .Y(\clock_divider/N61 ) );
  NOR2B U1104 ( .AN(\clock_divider/N44 ), .B(n912), .Y(\clock_divider/N60 ) );
  NOR2B U1105 ( .AN(\clock_divider/N43 ), .B(n912), .Y(\clock_divider/N59 ) );
  NOR2B U1106 ( .AN(\clock_divider/N42 ), .B(n912), .Y(\clock_divider/N58 ) );
  NOR2B U1107 ( .AN(\clock_divider/N41 ), .B(n912), .Y(\clock_divider/N57 ) );
  AND4 U1108 ( .A(n914), .B(n915), .C(n916), .D(n917), .Y(n912) );
  NOR4 U1109 ( .A(\clock_divider/cnt2k5[9] ), .B(\clock_divider/cnt2k5[5] ), 
        .C(\clock_divider/cnt2k5[4] ), .D(\clock_divider/cnt2k5[3] ), .Y(n917)
         );
  NOR4 U1110 ( .A(\clock_divider/cnt2k5[2] ), .B(\clock_divider/cnt2k5[15] ), 
        .C(\clock_divider/cnt2k5[14] ), .D(\clock_divider/cnt2k5[13] ), .Y(
        n916) );
  NOR4B U1111 ( .AN(\clock_divider/cnt2k5[11] ), .B(\clock_divider/N56 ), .C(
        \clock_divider/cnt2k5[12] ), .D(\clock_divider/cnt2k5[10] ), .Y(n915)
         );
  AND4 U1112 ( .A(\clock_divider/cnt2k5[8] ), .B(\clock_divider/cnt2k5[7] ), 
        .C(\clock_divider/cnt2k5[6] ), .D(\clock_divider/cnt2k5[1] ), .Y(n914)
         );
  INV U1113 ( .A(\clock_divider/cnt5k[0] ), .Y(\clock_divider/N56 ) );
  NOR2B U1114 ( .AN(\clock_divider/N22 ), .B(n913), .Y(\clock_divider/N38 ) );
  NOR2B U1115 ( .AN(\clock_divider/N21 ), .B(n913), .Y(\clock_divider/N37 ) );
  NOR2B U1116 ( .AN(\clock_divider/N20 ), .B(n913), .Y(\clock_divider/N36 ) );
  NOR2B U1117 ( .AN(\clock_divider/N19 ), .B(n913), .Y(\clock_divider/N35 ) );
  NOR2B U1118 ( .AN(\clock_divider/N18 ), .B(n913), .Y(\clock_divider/N34 ) );
  NOR2B U1119 ( .AN(\clock_divider/N17 ), .B(n913), .Y(\clock_divider/N33 ) );
  NOR2B U1120 ( .AN(\clock_divider/N16 ), .B(n913), .Y(\clock_divider/N32 ) );
  NOR2B U1121 ( .AN(\clock_divider/N15 ), .B(n913), .Y(\clock_divider/N31 ) );
  NOR2B U1122 ( .AN(\clock_divider/N14 ), .B(n913), .Y(\clock_divider/N30 ) );
  NOR2B U1123 ( .AN(\clock_divider/N13 ), .B(n913), .Y(\clock_divider/N29 ) );
  NOR2B U1124 ( .AN(\clock_divider/N12 ), .B(n913), .Y(\clock_divider/N28 ) );
  NOR2B U1125 ( .AN(\clock_divider/N11 ), .B(n913), .Y(\clock_divider/N27 ) );
  NOR2B U1126 ( .AN(\clock_divider/N10 ), .B(n913), .Y(\clock_divider/N26 ) );
  NOR2B U1127 ( .AN(\clock_divider/N9 ), .B(n913), .Y(\clock_divider/N25 ) );
  NOR2B U1128 ( .AN(\clock_divider/N8 ), .B(n913), .Y(\clock_divider/N24 ) );
  AND4 U1129 ( .A(n918), .B(n919), .C(n920), .D(n921), .Y(n913) );
  NOR4 U1130 ( .A(\clock_divider/cnt5k[6] ), .B(\clock_divider/cnt5k[5] ), .C(
        \clock_divider/cnt5k[4] ), .D(\clock_divider/cnt5k[3] ), .Y(n921) );
  NOR4 U1131 ( .A(\clock_divider/cnt5k[15] ), .B(\clock_divider/cnt5k[14] ), 
        .C(\clock_divider/cnt5k[13] ), .D(\clock_divider/cnt5k[11] ), .Y(n920)
         );
  NOR4BB U1132 ( .AN(\clock_divider/cnt5k[1] ), .BN(\clock_divider/cnt5k[12] ), 
        .C(\clock_divider/cnt5k[10] ), .D(\clock_divider/N23 ), .Y(n919) );
  AND4 U1133 ( .A(\clock_divider/cnt5k[9] ), .B(\clock_divider/cnt5k[8] ), .C(
        \clock_divider/cnt5k[7] ), .D(\clock_divider/cnt5k[2] ), .Y(n918) );
  INV U1134 ( .A(\clock_divider/cnt5k[0] ), .Y(\clock_divider/N23 ) );
  INV U1135 ( .A(n935), .Y(\U1/U7/Z_0 ) );
  NOR2 U1136 ( .A(\gamecenter/rex_falling ), .B(n715), .Y(n935) );
  AND3 U1137 ( .A(n728), .B(n739), .C(n722), .Y(n715) );
  INV U1138 ( .A(\gamecenter/rex_jmp_ptr[2] ), .Y(n722) );
  NOR3B U1139 ( .AN(\gamecenter/rex_jmp_ptr[1] ), .B(n723), .C(n719), .Y(n739)
         );
  INV U1140 ( .A(\gamecenter/rex_jmp_ptr[0] ), .Y(n719) );
  INV U1141 ( .A(\gamecenter/rex_jmp_ptr[3] ), .Y(n723) );
  NOR4B U1142 ( .AN(n725), .B(\gamecenter/rex_jmp_ptr[7] ), .C(
        \gamecenter/rex_jmp_ptr[4] ), .D(\gamecenter/rex_jmp_ptr[6] ), .Y(n728) );
  INV U1143 ( .A(\gamecenter/rex_jmp_ptr[5] ), .Y(n725) );
  NOR2B U1144 ( .AN(\decider/obstacle_right [9]), .B(n595), .Y(\r98/ab[6][2] )
         );
  NOR2B U1145 ( .AN(\decider/obstacle_right [8]), .B(n595), .Y(\r98/ab[5][2] )
         );
  MX2 U1146 ( .A(\decider/posx_m_rex_left [7]), .B(\decider/obstacle_right [7]), .S0(n936), .Y(\U1/U1/Z_4 ) );
  MX2 U1147 ( .A(\decider/posx_m_rex_left [6]), .B(\decider/obstacle_right [6]), .S0(n936), .Y(\U1/U1/Z_3 ) );
  MX2 U1148 ( .A(\decider/posx_m_rex_left [5]), .B(\decider/obstacle_right [5]), .S0(n936), .Y(\U1/U1/Z_2 ) );
  MX2 U1149 ( .A(\decider/posx_m_rex_left [4]), .B(\decider/obstacle_right [4]), .S0(n936), .Y(\U1/U1/Z_1 ) );
  MX2 U1150 ( .A(n782), .B(\decider/obstacle_right [3]), .S0(n936), .Y(
        \U1/U1/Z_0 ) );
  INV U1151 ( .A(\U1/U4/Z_0 ), .Y(n936) );
  AND4 U1152 ( .A(cs_o[0]), .B(n922), .C(\decider/sub_45/carry[5] ), .D(
        \decider/posy_m_rex_top[15] ), .Y(\U1/U4/Z_0 ) );
  NOR2 U1153 ( .A(addrD[8]), .B(\decider/rex_top [15]), .Y(n922) );
  NOR2B U1154 ( .AN(n784), .B(addrD[10]), .Y(cs_o[0]) );
  INV U1155 ( .A(addrD[9]), .Y(n784) );
  INV U1156 ( .A(addrD[6]), .Y(n782) );
  NAND2 U461 ( .A(n958), .B(n959), .Y(\r293/carry[4] ) );
  XNOR2 U462 ( .A(n608), .B(addrD[6]), .Y(\decider/obstacle_right [3]) );
  INV U473 ( .A(n608), .Y(n958) );
  INV U474 ( .A(addrD[6]), .Y(n959) );
  NAND2 U1157 ( .A(n744), .B(n745), .Y(n960) );
  INV U1158 ( .A(n960), .Y(n706) );
  NAND3 U1159 ( .A(n755), .B(n756), .C(n754), .Y(n746) );
  NAND2 U1160 ( .A(n746), .B(n747), .Y(n961) );
  INV U1161 ( .A(n961), .Y(n745) );
endmodule

