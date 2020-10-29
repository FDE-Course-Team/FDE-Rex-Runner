module Decider(
    clk,rstn,
    addrD,dataD,
    addrT,dataT,
    rex_down,
    obstacle_left,
    game_state
);
//--------------------------------
//---------I/O definition:--------
//--------------------------------
input clk,rstn;
input [10:0]addrD;
output [7:0]dataD;
output reg[15:0]addrT;
input [7:0]dataT;
input [15:0]rex_down;
input [15:0]obstacle_left;
input [1:0]game_state;
//--------------------------------
//----posx and posy definition----
//--------------------------------
wire [15:0]posx;
wire [15:0]posy;
assign posy[5:0]=~addrD[5:0];
assign posy[15:6]=0;
// e.g. when addrD[5:0]==0, means driver need pixels in the most upper line,
// then posy should be 63.
// similarly, posy = 63 - addrD[5:0]
// and formula "63 - addrD[5:0]" equals to "~addrD[5:0]".
assign posx[2:0]=3'b0;
assign posx[7:3]=addrD[10:6];
assign posx[15:8]=0;
//--------------------------------
//----rex bounding definition-----
//--------------------------------
parameter rex_height=16'd23;
parameter rex_width=16'd24;
parameter rex_left=16'd8;
parameter rex_right=rex_left+rex_width;
wire [15:0]rex_top;
assign rex_top=rex_down+rex_height;
//input [15:0]rex_down;
wire [15:0]posx_m_rex_left;//posx minus rex_left
assign posx_m_rex_left=posx-rex_left;
wire [15:0]posx_m_rex_right;//posx minus rex_right
assign posx_m_rex_right=posx-rex_right;
wire [15:0]posy_m_rex_top;//posy minus rex_top
assign posy_m_rex_top=posy-rex_top;
wire [15:0]posy_m_rex_down;//posy minus rex_down
assign posy_m_rex_down=posy-rex_down;
//if rex_left<posx+8, maybe inside. (a give up branch, don't use it.)
//if posx-rex_left>=0,
//and posx-rex_right<0,
//and posy-rex_top<0,
//and posy-rex_down>=0, must be inside.
wire inside_rex;
assign inside_rex=(~posx_m_rex_left[15])&(posx_m_rex_right[15])&(~posy_m_rex_top[15])&(posy_m_rex_down[15]);
parameter addr_rex=10'd0;
//--------------------------------
//-----obstacle bounding def------
//--------------------------------
parameter obstacle_height=16'd22;
parameter obstacle_width=16'd16;
//input [15:0]obstacle_left;
wire [15:0]obstacle_right;
assign obstacle_right=obstacle_left+obstacle_width;
parameter obstacle_down=16'd0;
parameter obstacle_top=obstacle_down+obstacle_height;
wire [15:0]posx_m_obstacle_left;
assign posx_m_obstacle_left=posx-obstacle_left;
wire [15:0]posx_m_obstacle_right;
assign posx_m_obstacle_right=posx-obstacle_right;
wire [15:0]posy_m_obstacle_top;
assign posy_m_obstacle_top=posy-obstacle_top;
wire [15:0]posy_m_obstacle_down;
assign posy_m_obstacle_down=posy-obstacle_down;
wire inside_obstacle;
assign inside_obstacle=(~posx_m_obstacle_left[15])&(posx_m_obstacle_right[15])&(~posy_m_obstacle_top[15])&(posy_m_obstacle_down[15]);
parameter addr_obstacle=10'd69;
//--------------------------------
//-------Some Explanation---------
//--------------------------------
// let's see the time seq of driver:
// clk  _-_-_-_-_-_-_-_-_-_-_-_-_-_-_
// en   _--__--__--__--__--__--__--__
// addr 4..3...5...6...1...2...3...7.
// data   !   !   !   !   !   !   !
// the "!" is the DDL when data need to be prepared.
// thus, decider has 1 clk circle to prepare.
// en 1->0, addr changes, decider prepare addrT with 
// combinational circuit; en 0->1, decider visit 
// Texture, and get dataT (when inside of something,
// dataD is connected directly to dataT.)
assign dataD=(inside_rex|inside_obstacle)?dataT:8'd0;
//--------------------------------
//----------always block----------
//--------------------------------
always@(posedge clk or negedge rstn)begin
    if(!rstn)begin
        addrT<=0;
    end
    else begin
        if(inside_rex)begin
            addrT<=addr_rex+rex_height*(posx_m_rex_left>>3)+(~posy_m_rex_top)+1;
        end
        else if(inside_obstacle)begin
            addrT<=addr_obstacle+obstacle_height*(posx_m_obstacle_left>>3)+(~posy_m_obstacle_top)+1;
        end
    end
end

endmodule