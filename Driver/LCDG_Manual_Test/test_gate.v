
module test ( clk, rstn, db_o, dori_o, rw_o, en_o, cs1_o, cs2_o, rst_o, db_i, 
        dori_i, rw_i, en_i, cs1_i, cs2_i, rst_i );
  output [7:0] db_o;
  input [7:0] db_i;
  input clk, rstn, dori_i, rw_i, en_i, cs1_i, cs2_i, rst_i;
  output dori_o, rw_o, en_o, cs1_o, cs2_o, rst_o;


  DFFRHQ cs2_o_reg ( .D(cs2_i), .CK(clk), .RN(rstn), .Q(cs2_o) );
  DFFRHQ rst_o_reg ( .D(rst_i), .CK(clk), .RN(rstn), .Q(rst_o) );
  DFFRHQ \db_o_reg[7]  ( .D(db_i[7]), .CK(clk), .RN(rstn), .Q(db_o[7]) );
  DFFRHQ \db_o_reg[6]  ( .D(db_i[6]), .CK(clk), .RN(rstn), .Q(db_o[6]) );
  DFFRHQ \db_o_reg[5]  ( .D(db_i[5]), .CK(clk), .RN(rstn), .Q(db_o[5]) );
  DFFRHQ \db_o_reg[4]  ( .D(db_i[4]), .CK(clk), .RN(rstn), .Q(db_o[4]) );
  DFFRHQ \db_o_reg[3]  ( .D(db_i[3]), .CK(clk), .RN(rstn), .Q(db_o[3]) );
  DFFRHQ \db_o_reg[2]  ( .D(db_i[2]), .CK(clk), .RN(rstn), .Q(db_o[2]) );
  DFFRHQ \db_o_reg[1]  ( .D(db_i[1]), .CK(clk), .RN(rstn), .Q(db_o[1]) );
  DFFRHQ \db_o_reg[0]  ( .D(db_i[0]), .CK(clk), .RN(rstn), .Q(db_o[0]) );
  DFFRHQ dori_o_reg ( .D(dori_i), .CK(clk), .RN(rstn), .Q(dori_o) );
  DFFRHQ rw_o_reg ( .D(rw_i), .CK(clk), .RN(rstn), .Q(rw_o) );
  DFFRHQ en_o_reg ( .D(en_i), .CK(clk), .RN(rstn), .Q(en_o) );
  DFFRHQ cs1_o_reg ( .D(cs1_i), .CK(clk), .RN(rstn), .Q(cs1_o) );
endmodule

