//未开始时，按键第一次按下时启动游戏，随后为跳跃键
//假定地面高度为(x,7)
module gamecentre(
									clk,
									rst,
									in_up,						//input ,to jump
									gpu_en,					 //命令使能
									dino_y,				   //小恐龙位置(y的偏移量)7bit   0/15/27/34/36 
									obstacle_x,      //障碍物位置(x的偏移量)9bit
									state,           //游戏状态2bit
									);

input   				  clk;
input 						rst;
input 						in_up;						
output	 					gpu_en;		
output[6:0] 			dino_y; 
output[8:0]				obstacle_x;			
output[1:0]				state;				  


reg								gpu_en;
reg[6:0]    			dino_y; 
reg[8:0]	  			obstacle_x;	
reg[1:0]					state;				   //游戏状态，暂定2位
reg[2:0]    			dino_state;      //dinosaur_state记录恐龙位置状态
reg[1:0] 					pin_pos;			   //用来识别按键的上升沿
reg								con_jump;				 //记录跳跃是在上升还是下降 0为上升，左侧，1位下降，右侧
reg[9:0]    			con;             //计数器用于分频


parameter					init = 0;				//初始化状态
parameter					go   = 1;				//正常行进状态
parameter					jump = 2;				//跳起
parameter					over = 3;				//游戏结束
parameter   			dino_go    = 4; //恐龙平地走               0
parameter  				dino_jump1 = 5;	//恐龙跳起/落下的第一高度  15
parameter   			dino_jump2 = 6;	//恐龙跳起/落下的第二高度  27
parameter   			dino_jump3 = 7;	//恐龙跳起/落下的第三高度  34
parameter  			  dino_jump4 = 8;	//恐龙跳起的最高位置       36
parameter         dino_x = 16;		//恐龙的左侧横坐标
parameter   			dino_x_right = 32;		//恐龙的右侧横坐标
parameter   			obstacle_high= 26;    //障碍物高度
parameter   			width  = 16;						//障碍物的宽，暂定16//////////////////////////////////////////////

wire[9:0]					obstacle_x_right; 

assign 						pin_up_edge = pin_pos[0]&(!pin_pos[1]);			//pin_up_edge=1,则按键上升沿到来
assign      			obstacle_x_right = obstacle_x + width;    //障碍物的右侧边缘横坐标

always@(posedge clk or negedge rst)begin
	if(rst)begin
		gpu_en  <= 0;
		state		<= 0;
		pin_pos <= 0;
		con     <= 0;
		con_jump <= 0;
		dino_state <=0;
	end
	else begin 						
		pin_pos[1] <= pin_pos[0]; 
		pin_pos[0] <= in_up;																//检测按键上升沿

		
		case(state)
			init: begin																			//初始化
				if(pin_up_edge==1)begin
					state <= go;																//检测到按键按下后进入2状态
					gpu_en <= 1;
					dino_state <= dino_go;
					dino_y <= 7'b0000_000;   
					obstacle_x	<= 9'b0_1110_1000;							//龙在地面00，障碍物在x=232处
				end
				else begin
					gpu_en <= 1;
					dino_y <= 7'b000_0000;   
					obstacle_x	<= 9'b0_1110_1000;							//龙在地面00，障碍物在x=234处
				end
			end
			
			go: begin																			//2状态 正常行走
				if(dino_state == dino_go)begin							//小恐龙正常行进中
					if(pin_up_edge==1)begin										//按键按下 进行跳跃
						gpu_en <= 1;
						state <= jump;													//状态跳转至jump
						dino_state <= dino_jump1;
						dino_y <= 7'b000_0000;
				  end
					else begin																	//正常行进
						gpu_en <= 1;
						dino_y <= 7'b000_0000;   
					end	
				end
				else begin																		//小恐龙未在平面
					gpu_en <= 1;
					state <= jump;
				end
				
			end
																											///////////////////////////////////////////////////
			jump: begin																		//3状态 跳跃///////还差gameover的判断，障碍物的更新
				case (dino_state)											//////////////////////////////////////////
					dino_go:begin
						con <= 0;
						dino_y <= 7'b000_0000;
					  state <= go;														//gameover的判断在此处改动
					end
					
					dino_jump1:begin					
						dino_y <= 7'b000_1111;
					  if(con_jump == 0)begin										//con_jump=0,跳起过程
					  	dino_state <= dino_jump2;
					  end
					  else begin
					  	dino_state <= dino_go;									//con_jump=1 落下过程
					  end
					  state <= jump;					
					end
					
					dino_jump2:begin
						dino_y <= 7'b001_1011;
					  if(con_jump == 0)begin										//con_jump=0,跳起过程
					  	dino_state <= dino_jump3;
					  end
					  else begin
					  	dino_state <= dino_jump1;									//con_jump=1 落下过程
					  end
					  state <= jump;					
					end
					
					dino_jump3:begin
						dino_y <= 7'b010_0010;
					  if(con_jump == 0)begin										//con_jump=0,跳起过程
					  	dino_state <= dino_jump4;
					  end
					  else begin
					  	dino_state <= dino_jump2;									//con_jump=1 落下过程
					  end
					  state <= jump;						
					end
					
					dino_jump4:begin
						dino_y <= 7'b010_0100;
					  dino_state <= dino_jump3;
					  con <= 1;
					  state <= jump;
					end

				default: state<= go;	
				endcase
				
			end
			
			over: begin																		//游戏结束
				gpu_en <= 0;																//关掉使能
				state <= over;
				if(pin_up_edge==1)begin
					state <= init;																//检测到按键按下后进入初始状态
				end	
			end
			
		default:	state<=init;	
		endcase

	end

end

always@(posedge clk)begin														//检测小恐龙是否撞上障碍物
	
		if(con_jump)begin  																//恐龙下落
			if(obstacle_x_right == dino_x)begin  						//恐龙的左侧坐标与障碍物的右侧坐标重合时
				if(dino_y < obstacle_high)begin								//恐龙的高度 小与障碍物的高度  撞上了
					state <= over;
				end
			end
		end
		if(~con_jump) begin																//恐龙上升
			if(obstacle_x == dino_x_right)begin  						//恐龙的右侧坐标与障碍物的左侧坐标重合时
				if(dino_y < obstacle_high)begin								//恐龙的高度 小与障碍物的高度  撞上了
					state <= over;
				end
			end
		end
  
	
end

always@(posedge clk)begin														//障碍物移动/
	if(obstacle_x < 10)begin							 							//判断是否生成新的障碍物
		obstacle_x <= 9'b0_1111_0000;
	end  
	if(con == 1000)begin																//千分频，假设系统时钟为10k
	 	obstacle_x	<= obstacle_x - 8; 										//障碍物在x-8处,即左移8	
	 	con <= 0;
	end
	else begin
		con <= con+1;
	end
end

endmodule