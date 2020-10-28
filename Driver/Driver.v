module Driver(
    clk,
    rstn,

    start_i,
    addr_o,
    // data_i,

    db_o,
    dori_o,
    cs_o,
    en_o,
    rw_o,
    rst_o
);

input clk;
input rstn;
input start_i;
reg start_history;
output [9:0]addr_o;//one LCD_Graphic
// input [7:0]data_i;
wire [7:0]data_i;//debug
assign data_i=8'b00100110;//debug

output [7:0]db_o;
output [1:0]cs_o;
output reg en_o;
output rw_o;
output reg dori_o;
output reg rst_o;

reg [5:0]y;
reg [3:0]x;
reg [2:0]state;
reg [7:0]ins;//instruction

parameter HALT=3'b101;
parameter CLEAR=3'b100;
parameter SETY=3'b011;
parameter SETX=3'b010;
parameter READY=3'b001;
parameter SEND=3'b000;


assign db_o=dori_o?data_i:ins;
assign addr_o[9:0]={x[3:0],y[5:0]};
assign cs_o[0]=~x[3];//CS1
assign cs_o[1]=x[3];//CS2
assign rw_o=state[2];

always@(posedge clk or negedge rstn)begin
    if (!rstn) begin
        y<=0;
        x<=0;
        state<=HALT;
        ins<=8'b0000_0000;
        start_history<=0;
        dori_o<=0;
        rst_o<=1;
        en_o<=0;
    end
    else begin
        rst_o<=0;
        start_history<=start_i;
        en_o<=~en_o;
        if(!en_o)begin
            case(state)
                CLEAR:begin//about to clear
                    ins<=8'b0011_1110;
                    state<=SETY;
                    x<=0;
                    y<=0;
                    dori_o<=0;
                end
                SETY:begin//about to set Y
                    ins<=8'b0100_0000;
                    state<=SETX;
                    dori_o<=0;
                end
                SETX:begin//about to set X
                    ins<={5'b10111,x[2:0]};
                    state<=SEND;
                    dori_o<=0;
                end
                // READY:begin//about to start to send data
                //     ins<=8'b0000_0000;
                //     state<=SEND;
                // end
                SEND:begin//send data
                    y<=y+1;
                    if(&y) begin
                        x<=x+1;
                        if(&x)begin
                            state<=HALT;
                        end
                        else begin
                            state<=SETX;
                        end
                    end
                    dori_o<=1;
                end
                HALT:begin//halt
                    if(start_history==1 && start_i==0)begin
                        y<=0;
                        x<=0;
                        state<=CLEAR;
                        ins<=8'b0000_0000;
                        dori_o<=0;
                    end
                end
                default:begin
                    state<=HALT;
                end
            endcase    
        end
        
    end
end

endmodule