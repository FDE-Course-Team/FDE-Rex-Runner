module test(clk,rstn,db_o,dori_o,rw_o,en_o,cs1_o,cs2_o,rst_o,db_i,dori_i,rw_i,en_i,cs1_i,cs2_i,rst_i);

input clk,rstn;

output reg [7:0]db_o;
output reg dori_o;
output reg rw_o;
output reg en_o;
output reg cs1_o;
output reg cs2_o;
output reg rst_o;

input [7:0]db_i;
input dori_i;
input rw_i;
input en_i;
input cs1_i;
input cs2_i;
input rst_i;

always@(posedge clk or negedge rstn)begin
    if(!rstn)begin
        db_o<=0;
        dori_o<=0;
        rw_o<=0;
        en_o<=0;
        cs1_o<=0;
        cs2_o<=0;
        rst_o<=0;
    end
    else begin
        db_o<=db_i;
        dori_o<=dori_i;
        rw_o<=rw_i;
        en_o<=en_i;
        cs1_o<=cs1_i;
        cs2_o<=cs2_i;
        rst_o<=rst_i;
    end
end

endmodule