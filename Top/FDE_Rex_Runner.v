module FDE_Rex_Runner(
    clk,//120kHz
    rstn,

    jmp_key,

    db_o,
    dori_o,
    cs_o,
    en_o,
    rw_o,
    rst_o,
    state
    );

input clk,rstn;
input jmp_key;
output [7:0]db_o;
output dori_o;
output [3:0]cs_o;
output en_o;
output rw_o;
output rst_o;
output [2:0]state;

wire start;

wire [10:0]addrD;
wire [7:0]dataD;
wire [15:0]addrT;
wire [7:0]dataT;

wire [15:0]rex_down;
// assign rex_down=16'd0;//debug
wire [15:0]obstacle_left;
// assign obstacle_left=16'd55;//debug
wire [1:0]game_state;
// assign game_state=2'b00;//debug
wire clk24Hz;

Driver driver(
    .clk(clk),
    .rstn(rstn),
    .start_i(start),
    .addr_o(addrD),
    .data_i(dataD),
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
    // .rex_down(16'd15),
    .obstacle_left(obstacle_left),
    .game_state(game_state)
);
GameCenter gamecenter(
    .clk120kHz(clk),
    .clk24Hz(clk24Hz),
    .rstn(rstn),
    .in_up(jmp_key),						//input ,to jump
    .rex_down(rex_down),				   //小恐龙位置(y的偏移量)7bit   0/15/27/34/36 
    .obs_left(obstacle_left),      //障碍物位置(x的偏移量)9bit
    .game_state(game_state)
);
Texture texture(.addr(addrT[9:0]),.data(dataT));
Clock_Divider clock_divider(.clk120kHz(clk),.rstn(rstn),.clk12Hz(start),.clk24Hz(clk24Hz));

endmodule