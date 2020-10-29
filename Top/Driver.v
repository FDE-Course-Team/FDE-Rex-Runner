module Driver(
    clk,
    rstn,

    start_i,
    addr_o,
    data_i,

    db_o,
    dori_o,
    cs_o,
    en_o,
    rw_o,
    rst_o,
    state
);

input clk;
input rstn;
input start_i;
reg [1:0]start_history;
output [10:0]addr_o;//one LCD_Graphic
input [7:0]data_i;
// wire [7:0]data_i;//debug
// assign data_i=8'b00100110;//debug

output reg [7:0]db_o;
output [3:0]cs_o;
output reg en_o;
output rw_o;
output reg dori_o;
output reg rst_o;

reg [5:0]y;
reg [4:0]x;
output reg [2:0]state;

//state machine
parameter HALT=3'd7;
parameter READY2=3'd2;
parameter READY1=3'd1;
parameter GO=3'd0;
parameter TOSHOW=3'd3;
//   -(reset)-> [HALT] -(start)-> [READY2]
//               ^                ^     v
//            [TOSHOW]   <-     [GO] <- [READY1]

//clk   _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-
//en    _--__--__--__--__--__--__--__
//state p..q...s...t...........y...
//state changes when en falls down. (and data/instuction will also be transferred then.)

assign addr_o[10:0]={x[4:0],y[5:0]};
assign cs_o[0]=(x[4:3]==2'b00);//CS1 of left LCDG
assign cs_o[1]=(x[4:3]==2'b01);//CS2 of left LCDG
assign cs_o[2]=(x[4:3]==2'b10);//CS1 of right LCDG
assign cs_o[3]=(x[4:3]==2'b11);//CS2 of right LCDG
assign rw_o=0;

always@(posedge clk)begin
    if (!rstn) begin
        db_o<=0;
        en_o<=0;
        dori_o<=0;
        rst_o<=1;
        y<=0;
        x<=0;
        state<=HALT;
    end
    else begin
        rst_o<=0;
        en_o<=~en_o;
        start_history[0]<=start_i;
        start_history[1]<=start_history[0];
        if(en_o)begin
            case(state)
                READY2:begin//when ready2, must have cleared already, prepare to set Y.
                    db_o<={2'b01,y[5:0]};
                    state<=READY1;
                    dori_o<=0;
                end
                READY1:begin//when ready1, must have set Y already, prepare to set X and GO.
                    db_o<={5'b10111,x[2:0]};
                    state<=GO;
                    dori_o<=0;
                end
                GO:begin//when going, prepare correct x and y for the next time and send until a column is over, or a graph is over.
                    db_o<=data_i;
                    dori_o<=1;
                    if(&y) begin
                        if(&x)begin
                            state<=TOSHOW;
                        end
                        else begin
                            state<=READY2;
                        end
                        x<=x+1;
                    end
                    y<=y+1;
                end
                TOSHOW:begin//when TOSHOW, must have sent all data, prepare to show and stop processing.
                    db_o<=8'b0011_1111;
                    dori_o<=0;
                    state<=HALT;
                end
                HALT:begin//halt
                    if(start_history[1]==1 && start_i==0)begin//then clear screen and change to ready2
                        y<=0;
                        x<=0;
                        // db_o<=8'b0011_1110;
                        db_o<=8'b0011_1111;//try
                        dori_o<=0;
                        state<=READY2;
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

// to be tested.