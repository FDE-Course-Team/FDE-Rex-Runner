//δ��ʼʱ��������һ�ΰ���ʱ������Ϸ�����Ϊ��Ծ��
//�ٶ�����߶�Ϊ(x,7)
module gamecentre(
									clk,
									rst,
									in_up,						//input ,to jump
									gpu_en,					 //����ʹ��
									dino_y,				   //С����λ��(y��ƫ����)7bit   0/15/27/34/36 
									obstacle_x,      //�ϰ���λ��(x��ƫ����)9bit
									state           //��Ϸ״̬2bit
									);

input   				  clk;
input 						rst;
input 						in_up;						
output	 					gpu_en;		
output[15:0] 			dino_y; 							
output[15:0]			obstacle_x;						
output[1:0]				state;				  


reg								gpu_en;
reg[15:0]    			dino_y; 
reg[15:0]	  			obstacle_x;	
reg[1:0]					state;				   //��Ϸ״̬���ݶ�2λ
reg[2:0]    			dino_state;      //dinosaur_state��¼����λ��״̬
reg[1:0] 					pin_pos;			   //����ʶ�𰴼���������
reg								con_jump;				 //��¼��Ծ�������������½� 0Ϊ��������࣬1λ�½����Ҳ�
reg[9:0]    			con;             //�������������ϰ����Ƶ
reg[9:0]    			con1;						 //�����������ڿ�����Ծ��Ƶ


parameter					init = 0;				//��ʼ��״̬
parameter					go   = 1;				//�����н�״̬
parameter					jump = 2;				//����
parameter					over = 3;				//��Ϸ����
parameter   			dino_go    = 0; //����ƽ����               0
parameter  				dino_jump1 = 1;	//��������/���µĵ�һ�߶�  15
parameter   			dino_jump2 = 2;	//��������/���µĵڶ��߶�  27
parameter   			dino_jump3 = 3;	//��������/���µĵ����߶�  34
parameter  			  dino_jump4 = 4;	//������������λ��       36
parameter         dino_x = 16;		//��������������
parameter   			dino_x_right = 32;		//�������Ҳ������
parameter   			obstacle_high= 26;    //�ϰ���߶�
parameter   			width  = 16;						//�ϰ���Ŀ��ݶ�16//////////////////////////////////////////////
parameter					division = 50;				//��Ƶϵ��


wire[15:0]					obstacle_x_right; 

assign 						pin_up_edge = pin_pos[0]&(!pin_pos[1]);			//pin_up_edge=1,�򰴼������ص���
assign      			obstacle_x_right = obstacle_x + width;    //�ϰ�����Ҳ��Ե������

always@(posedge clk or negedge rst)begin
	if(~rst)begin
		gpu_en  <= 0;
		state		<= 0;
		pin_pos <= 0;
		con     <= 0;
		con1		<= 0;
		con_jump <= 0;
		dino_state <=0;
	end
	else begin 						
		pin_pos[1] <= pin_pos[0]; 
		pin_pos[0] <= in_up;																//��ⰴ��������

		
		case(state)
			init: begin																			//��ʼ��
				if(pin_up_edge == 1)begin
					state <= go;																//��⵽�������º����2״̬
					gpu_en <= 1;
					dino_state <= dino_go;
				end
				dino_y <= 16'd0;   
				obstacle_x	<= 16'd232;							//���ڵ���00���ϰ�����x=232��
			end
			
			go: begin																			//2״̬ ��������
				if(dino_state == dino_go)begin							//С���������н���
					if(pin_up_edge == 1)begin										//�������� ������Ծ
						state <= jump;													//״̬��ת��jump
						dino_state <= dino_jump1;
						dino_y <= 16'd0;
				  end
				end
				else begin																		//С����δ��ƽ��
					state <= jump;
				end
				
			end
																											///////////////////////////////////////////////////
			jump: begin																		//3״̬ ��Ծ///////����gameover���жϣ��ϰ���ĸ���
				case (dino_state)											//////////////////////////////////////////
					dino_go:begin
						if(con1 == division)begin	
							con_jump <= 0;
							dino_y <= 16'd0;
						  state <= go;														//gameover���ж��ڴ˴��Ķ�
						  con1 <= 0;
						end
						else begin
							con1 <= con1+1;
						end
					end
					
					dino_jump1:begin
						if(con1 == division)begin																//��Ƶ
		 					dino_y <= 16'd15;
		 					con1 <= 0;
							if(con_jump == 0)begin										//con_jump=0,�������
						  	dino_state <= dino_jump2;
						  end
						  else begin
						  	dino_state <= dino_go;									//con_jump=1 ���¹���
						  end
						  state <= jump;
						end
						else begin
							con1 <= con1+1;
						end					
					  					
					end
					
					dino_jump2:begin
						if(con1 == division)begin											//��Ƶ
							dino_y <= 16'd27;
							con1 <= 0;
						  if(con_jump == 0)begin										//con_jump=0,�������
						  	dino_state <= dino_jump3;
						  end
						  else begin
						  	dino_state <= dino_jump1;									//con_jump=1 ���¹���
						  end
						  state <= jump;
						end
						else begin
							con1 <= con1+1;	
						end				
					end
					
					dino_jump3:begin
						if(con1 == division)begin	
							dino_y <= 16'd34;
							con1 <= 0;
						  if(con_jump == 0)begin										//con_jump=0,�������
						  	dino_state <= dino_jump4;
						  end
						  else begin
						  	dino_state <= dino_jump2;									//con_jump=1 ���¹���
						  end
						  state <= jump;
						end
						else begin
							con1 <= con1+1;
						end						
					end
					
					dino_jump4:begin
						if(con1 == division)begin	
							dino_y <= 16'd36;
						  dino_state <= dino_jump3;
						  con_jump <= 1;
						  state <= jump;
						  con1 <= 0;
						end
						else begin
							con1 <= con1+1;
						end
					end

				default: state<= go;	
				endcase
				
			end
			
			over: begin																		//��Ϸ����
				
				if(pin_up_edge == 1)begin
					obstacle_x <= 16'd240;
					state <= init;																//��⵽�������º�����ʼ״̬
				end
				else begin
					gpu_en <= 0;																//�ص�ʹ��
					state <= over;
				end	
				
			end
			
		default:	state<=init;	
		endcase

	end

end

always@(posedge clk)begin														//���С�����Ƿ�ײ���ϰ���	
	if(state == go | state == jump)begin
		if(con_jump)begin  																//��������
			if(obstacle_x_right == dino_x)begin  						//����������������ϰ�����Ҳ������غ�ʱ
				if(dino_y < obstacle_high)begin								//�����ĸ߶� С���ϰ���ĸ߶�  ײ����
					state <= over;
				end
			end
		end
		if(~con_jump) begin																//��������
			if(obstacle_x == dino_x_right)begin  						//�������Ҳ��������ϰ������������غ�ʱ
				if(dino_y < obstacle_high)begin								//�����ĸ߶� С���ϰ���ĸ߶�  ײ����
					state <= over;
				end
			end
		end
	end	
end

always@(posedge clk)begin														//�ϰ����ƶ�/
	if(state == go | state == jump)begin
		if(obstacle_x < 10)begin							 							//�ж��Ƿ������µ��ϰ���
			obstacle_x <= 16'd240;
		end  
		if(con == division)begin																//ǧ��Ƶ������ϵͳʱ��Ϊ10k
		 	obstacle_x	<= obstacle_x - 8; 										//�ϰ�����x-8��,������8	
		 	con <= 0;
		end
		else begin
			con <= con+1;
		end
	end
end

endmodule