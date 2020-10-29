module Decider(
    clk,rstn,
    addrD,dataD,
    addrT,dataT,
    dino_y,
    obstacle_x,
    game_state
);



input clk,rstn;
input [9:0]addrD;
output reg [7:0]dataD;
output [15:0]addrT;
input [7:0]dataT;
input [6:0]dino_y;
input [8:0]obstacle_x;
input [1:0]game_state;

parameter dino_x=7'b8;
parameter dino_h=6'bx;
parameter dino_w=7'bx;
parameter obstacle_y=6'b0;
parameter obstacle_h=6'bx;
parameter obstacle_w=7'bx;

wire [6:0]posx;
wire [5:0]posy;
assign posy[5:0]=~addrD[5:0];
// e.g. when addrD[5:0]==0, means driver need pixels in the most upper line,
// then posy should be 63.
// similarly, posy = 63 - addrD[5:0]
// and formula "63 - addrD[5:0]" equals to "~addrD[5:0]".
assign posx[2:0]=3'b0;
assign posx[6:3]=addrD[9:6];

wire in_dino;
wire in_obstacle;
wire in_background;
assign in_dino=((posx>=dino_x)&(posx<dino_x+dino_w)&(posy>=dino_y)&(pos<dino_y+dino_h));
assign in_background=~(in_dino|in_obstacle);

// let's see the time seq of driver:
// clk  _-_-_-_-_-_-_-_-_-_-_-_-_-_-_
// en   _--__--__--__--__--__--__--__
// addr 4..3...5...6...1...2...3...7.
// data   !   !   !   !   !   !   !
// the "!" is the DDL when data need to be prepared.
// thus, decider has 1 clk circle to prepare.
// en 1->0, addr changes, decider prepare addrT with 
// combinational circuit; en 0->1, decider visit 
// Texture, and get dataT (dataD is connected directly 
// to dataT.)

assign dataD=dataT;

always@(posedge clk or negedge rstn)begin
    if(!rstn)begin

    end
    else begin

    end
end

endmodule