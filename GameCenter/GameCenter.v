//未开始时，按键第一次按下时启动游戏，随后为跳跃键
//假定地面高度为(x,7)
module GameCenter(
									clk120kHz,
									clk24Hz,
									rstn,
									in_up,						//input ,to jump
									rex_down,				   //小恐龙位置(y的偏移量)
									obs_left,      //障碍物位置(x的偏移量)
									game_state           //游戏状态2bit
									);

input   				  clk120kHz;
input					clk24Hz;
input 						rstn;
input 						in_up;							
output[15:0] 			rex_down; 							
output[15:0]			obs_left;						
output[1:0]				game_state;				  


reg[15:0]    			rex_down; 
reg[15:0]	  			obs_left;	
reg[1:0]				game_state;				   //游戏状态，暂定2位
reg						rex_falling;				 //记录跳跃是在上升还是下降 0为上升，左侧，1位下降，右侧

parameter				init = 0;				//初始化状态
parameter				playing = 1;				//正常行进状态
parameter				over = 3;				//游戏结束

////坐标定义
//小恐龙rex和障碍物obs(obstacle)均需要定义上下左右四个边框的位置和宽与高，其中左边框和下边框
//表示的坐标包含图片本身的像素坐标，而右边框和上边框则不包含。例如一个32x32大小的图片，左下角
//位置坐标为(4,5)，那么其左边框为4，在(4,10)处确有一个像素属于此图片，而右边框为36，在(36,10)
//处已不是该图片的像素。

parameter				rex_height = 25;
parameter				rex_width = 24;
parameter         		rex_left = 8;		//恐龙的左侧横坐标
parameter   			rex_right = rex_left+rex_width;		//恐龙的右侧横坐标
//reg[15:0]    			rex_down; 
wire[15:0]				rex_top;
assign	rex_top = rex_down + rex_height;

parameter   			obs_height= 28;    //障碍物高度
parameter   			obs_width = 16;  //障碍物的宽
parameter				obs_down = 0;
parameter 				obs_top = obs_down+obs_height;
//reg[15:0]	  			obs_left;	
wire[15:0]				obs_right; 
assign      			obs_right = obs_left + obs_width;    //障碍物的右侧边缘横坐标

//// clk24HzSpike

reg clk24HzHistory;
wire clk24HzSpike;
assign clk24HzSpike = (~clk24HzHistory)&clk24Hz;
always@(posedge clk120kHz or negedge rstn)begin
	if(~rstn)begin
		clk24HzHistory<=0;
	end
	else begin
		clk24HzHistory<=clk24Hz;
	end
end

////rex_jmp_list
//作为小恐龙跳跃时的高度查找表
//ptr代替状态机，从list的头（head）查找到尾（tail）然后再反向查找到头。
//头部存放的数据是地面，尾部存放的数据是最高点。
//rex_falling代表的是查找方向，如果rex_falling为1，代表正在下落，那么ptr就会自减，除非本身已经到头；
//如果rex_falling为0，代表正在上升，那么ptr就会自增，直到ptr与tail重合，就将rex_falling赋为1让其下降回查。
//这样设计的一个好处就是，如果需要修改小恐龙跳跃的时长、连贯性等，则只需要调整rex_jmp_list的长度和内容。

parameter rex_jmp_list_len=12;
parameter rex_jmp_list_tail=rex_jmp_list_len-1;
reg[15:0]	rex_jmp_list[rex_jmp_list_tail:0];
parameter rex_jmp_list_head=0;
reg[7:0]	rex_jmp_ptr;

always@(negedge rstn)begin
	rex_jmp_list[0]<=0;
	rex_jmp_list[1]<=7;
	rex_jmp_list[2]<=13;
	rex_jmp_list[3]<=19;
	rex_jmp_list[4]<=24;
	rex_jmp_list[5]<=29;
	rex_jmp_list[6]<=33;
	rex_jmp_list[7]<=36;
	rex_jmp_list[8]<=38;
	rex_jmp_list[9]<=40;
	rex_jmp_list[10]<=41;
	rex_jmp_list[11]<=42;
end

reg[2:0] in_up_history;
always@(posedge clk120kHz or negedge rstn)begin
	if(~rstn)begin
		in_up_history<=0;
	end
	else begin
		if(clk24HzSpike)begin
			in_up_history[0]<=in_up;
			in_up_history[1]<=in_up_history[0];
			in_up_history[2]<=in_up_history[1];
		end
	end
end

always@(posedge clk120kHz or negedge rstn)begin
	if(~rstn)begin
		game_state <= init;
		rex_falling <= 0;
		rex_down<=0;
		rex_jmp_ptr<=rex_jmp_list_head;
	end
	else begin 
		case(game_state)
			init: begin																			//初始化
				if(clk24HzSpike)begin
					if(in_up_history==3'b001)begin
						game_state <= playing;																//检测到按键按下后进入2状态
						rex_jmp_ptr<=rex_jmp_list_head;
						rex_falling<=1;
					end  
				end
			end
			
			playing: begin																	//2状态 游戏进行中
				//检查小恐龙和障碍物的边缘框是否重叠以判断是否撞上
				if((obs_left>=rex_right)|(rex_left>=obs_right)|(obs_down>=rex_top)|(rex_down>=obs_top))begin//如未撞上才可进行运动判断。
					if(clk24HzSpike)begin
						rex_down<=rex_jmp_list[rex_jmp_ptr];
						if(rex_falling)begin
							if(rex_jmp_ptr!=rex_jmp_list_head)begin
								rex_jmp_ptr<=rex_jmp_ptr-1;
							end
							else if(in_up_history==3'b001)begin
								rex_falling<=0;
							end
						end
						else begin
							if(rex_jmp_ptr!=rex_jmp_list_tail)begin
								rex_jmp_ptr<=rex_jmp_ptr+1;
							end
							else begin
								rex_jmp_ptr<=rex_jmp_ptr-1;
								rex_falling<=1;
							end
						end
					end
				end
				else begin//撞上，游戏结束
					game_state<=over;
				end
			end
			over: begin																		//游戏结束
				if(clk24HzSpike)begin
					if(in_up_history==3'b001)begin
						game_state <= init;																//检测到按键按下后进入初始状态
					end
				end
			end
			
		default:	game_state<=init;	
		endcase

	end

end

always@(posedge clk120kHz or negedge rstn)begin														//障碍物移动/
	if(~rstn)begin
		obs_left <=0;
	end
	else begin
		if(clk24HzSpike)begin
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
