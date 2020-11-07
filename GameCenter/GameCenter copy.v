//未开始时，按键第一次按下时启动游戏，随后为跳跃键
//假定地面高度为(x,7)
module GameCenter(
									clk120kHz,
									clk6Hz,
									rstn,
									in_up,						//input ,to jump
									rex_y,				   //小恐龙位置(y的偏移量)7bit   0/15/27/34/36 
									obs_left,      //障碍物位置(x的偏移量)9bit
									game_state           //游戏状态2bit
									);

input   				  clk120kHz;
input					clk6Hz;
input 						rstn;
input 						in_up;							
output[15:0] 			rex_y; 							
output[15:0]			obs_left;						
output[1:0]				game_state;				  


reg[15:0]    			rex_y; 
reg[15:0]	  			obs_left;	
reg[1:0]				game_state;				   //游戏状态，暂定2位
reg[2:0]    			rex_state;      //rex_state记录恐龙位置状态
reg[1:0] 				pin_pos;			   //用来识别按键的上升沿
reg						rex_falling;				 //记录跳跃是在上升还是下降 0为上升，左侧，1位下降，右侧
reg[15:0]    			cnt_obs;             //计数器，用于障碍物分频
reg[15:0]    			cnt_rex;						 //计数器，用于恐龙跳跃分频

parameter				init = 0;				//初始化状态
parameter				playing = 1;				//正常行进状态
parameter				over = 3;				//游戏结束
parameter   			rex_go    = 0; //恐龙平地走               0
parameter  				rex_jump1 = 1;	//恐龙跳起/落下的第一高度  15
parameter   			rex_jump2 = 2;	//恐龙跳起/落下的第二高度  27
parameter   			rex_jump3 = 3;	//恐龙跳起/落下的第三高度  34
parameter  			  	rex_jump4 = 4;	//恐龙跳起的最高位置       36
parameter         		rex_x = 16;		//恐龙的左侧横坐标
parameter   			rex_x_right = 32;		//恐龙的右侧横坐标
parameter   			obs_high= 26;    //障碍物高度
parameter   			obs_width  = 16;						//障碍物的宽，暂定16//////////////////////////////////////////////
parameter				div_rex = 30000;//小恐龙分频系数
parameter				div_obs = 30000;//障碍物分频系数


wire[15:0]				obs_right; 
wire							pin_up_edge;

assign 						pin_up_edge = pin_pos[0]&(!pin_pos[1]);			//pin_up_edge=1,则按键上升沿到来
assign      			obs_right = obs_left + obs_width;    //障碍物的右侧边缘横坐标

//// clk6HzSpike

reg clk6HzHistory;
wire clk6HzSpike;
assign clk6HzSpike = (~clk6HzHistory)&clk6Hz;
always@(posedge clk120kHz or negedge rstn)begin
	if(~rstn)begin
		clk6HzHistory<=0;
	end
	else begin
		clk6HzHistory<=clk6Hz;
	end
end

////

always@(posedge clk120kHz or negedge rstn)begin
	if(~rstn)begin
		game_state <= init;
		pin_pos <= 0;	
		cnt_rex		<= 0;
		rex_falling <= 0;
		rex_state <=0;
		rex_y<=0;
	end
	else begin 						
		// pin_pos[1] <= pin_pos[0]; 
		// pin_pos[0] <= in_up;																//检测按键上升沿

		
		case(game_state)
			init: begin																			//初始化
				if(in_up)begin
					game_state <= playing;																//检测到按键按下后进入2状态
					rex_state <= rex_go;
				end
				rex_y <= 16'd0;   
			end
			
			playing: begin																	//2状态 游戏进行中
				if(clk6HzSpike)begin
					case(rex_state)
						rex_go:begin
							rex_y<=0;
							if(in_up)begin
								rex_state <= rex_jump1;
								// rex_y<=0;
								rex_falling <= 0;
							end
						end
						rex_jump1:begin
							rex_y<=15;
							if(rex_falling)begin
								// rex_y<=0;
								rex_state<=rex_go;
							end
							else begin
								// rex_y<=15;
								rex_state<=rex_jump2;
							end
						end
						rex_jump2:begin
							rex_y<=27;
							if(rex_falling)begin
								rex_state<=rex_jump1;
							end
							else begin
								rex_state<=rex_jump3;
							end
						end
						rex_jump3:begin
							rex_y<=34;
							if(rex_falling)begin
								rex_state<=rex_jump2;
							end
							else begin
								rex_state<=rex_jump4;
							end
						end
						rex_jump4:begin
							rex_y<=36;
							rex_falling<=1;
							rex_state<=rex_jump3;
						end
					endcase
				end
				///////////检测是否撞上/////
				// else if(rex_falling)begin  																//恐龙下落
				// 	if(obs_right == rex_x)begin  						//恐龙的左侧坐标与障碍物的右侧坐标重合时
				// 		if(rex_y < obs_high)begin								//恐龙的高度 小与障碍物的高度  撞上了
				// 			game_state <= over;
				// 		end
				// 	end
				// end
				// else begin																//恐龙上升
				// 	if(obs_left == rex_x_right)begin  						//恐龙的右侧坐标与障碍物的左侧坐标重合时
				// 		if(rex_y < obs_high)begin								//恐龙的高度 小与障碍物的高度  撞上了
				// 			game_state <= over;
				// 		end
				// 	end
				// end
				////////////		
				
				///////////检测是否撞上/////
				// if(rex_falling)begin  																//恐龙下落
				// 	if(obs_right == rex_x)begin  						//恐龙的左侧坐标与障碍物的右侧坐标重合时
				// 		if(rex_y < obs_high)begin								//恐龙的高度 小与障碍物的高度  撞上了
				// 			game_state <= over;
				// 		end
				// 	end
				// end
				// if(~rex_falling) begin																//恐龙上升
				// 	if(obs_left == rex_x_right)begin  						//恐龙的右侧坐标与障碍物的左侧坐标重合时
				// 		if(rex_y < obs_high)begin								//恐龙的高度 小与障碍物的高度  撞上了
				// 			game_state <= over;
				// 		end
				// 	end
				// end
				////////////
			end
			over: begin																		//游戏结束
				if(in_up)begin
					game_state <= init;																//检测到按键按下后进入初始状态
				end
			end
			
		default:	game_state<=init;	
		endcase

	end

end

always@(posedge clk120kHz or negedge rstn)begin														//障碍物移动/
	if(~rstn)begin
		obs_left <=0;
		cnt_obs <= 0;
	end
	else begin
		if(clk6HzSpike)begin
			case(game_state)
				init:begin
					obs_left	<= 16'd232;														//龙在地面00，障碍物在x=232处
				end
				playing:begin
					if(obs_left < 10)begin
						obs_left <= 240;//判断是否生成新的障碍物
					end
					else begin
						obs_left <= obs_left - 8;//障碍物在x-8处,即左移8	
					end
				end
			endcase
		end
	end
end

endmodule
