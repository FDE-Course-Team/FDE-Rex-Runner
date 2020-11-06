module FDE_Rex_Runner(
    clk,//120kHz
    rstn,

    start_i,

    db_o,
    dori_o,
    cs_o,
    en_o,
    rw_o,
    rst_o,
    state
    );

input clk,rstn;
input start_i;
output [7:0]db_o;
output dori_o;
output [3:0]cs_o;
output en_o;
output rw_o;
output rst_o;
output [2:0]state;

wire [10:0]addrD;
wire [7:0]dataD;
wire [15:0]addrT;
wire [7:0]dataT;

wire [15:0]rex_down;
assign rex_down=16'd0;//debug
wire [15:0]obstacle_left;
assign obstacle_left=16'd55;//debug
wire [1:0]game_state;
assign game_state=2'b00;//debug

Driver driver(
    .clk(clk),
    .rstn(rstn),
    .start_i(start_i),
    .addr_o(addrD),
    .data_i(dataD),
    // .data_i({1'b1,dataD[6:0]}),
    .db_o(db_o),
    .dori_o(dori_o),
    .cs_o(cs_o),
    .en_o(en_o),
    .rw_o(rw_o),
    .rst_o(rst_o),
    .state(state)
);
Decider decider(
    .clk(clk),
    .rstn(rstn),
    .addrD(addrD),
    .dataD(dataD),
    .addrT(addrT),
    .dataT(dataT),
    .rex_down(rex_down),
    .obstacle_left(obstacle_left),
    .game_state(game_state)
);
Texture texture(.addr(addrT[9:0]),.data(dataT));

endmodule