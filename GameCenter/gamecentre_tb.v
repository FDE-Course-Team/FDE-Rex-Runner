`timescale 10us/1us
`include "gamecentre.v"
`define clk_cycle 5

module gamecentre_tb;

reg clk,rst_n,in_up;
wire gpu_en;
wire [6:0] 	dino_y; 
wire [8:0]	obstacle_x;			
wire [1:0]	state;	


initial begin 
clk = 0;
rst_n = 1;
in_up = 0;
#10 rst_n = 0;
#10 rst_n = 1;
#10 in_up = 1;
#10 in_up = 0;
#10 in_up = 1;
#10 in_up = 0;
#14000 in_up = 1;
#10 in_up = 0;
#30 in_up = 1;
#10 in_up = 0;
#50000 $stop;
end

always #`clk_cycle clk = ~clk;

gamecentre U0(
	.clk(clk),
	.rst(rst_n),
	.in_up(in_up),						//input ,to jump
	.gpu_en(gpu_en),					 //命令使能
	.dino_y(dino_y),				   //小恐龙位置(y的偏移量)7bit   0/15/27/34/36 
	.obstacle_x(obstacle_x),      //障碍物位置(x的偏移量)9bit
	.state(state)
);
endmodule