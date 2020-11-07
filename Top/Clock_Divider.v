module Clock_Divider(
    clk120kHz,
    rstn,
    clk12Hz,
    clk24Hz
);

input clk120kHz;
input rstn;
output reg clk12Hz;
output reg clk24Hz;
reg [15:0] cnt5k;
reg [15:0] cnt2k5;

always@(posedge clk120kHz or negedge rstn)begin
    if(!rstn)begin
        clk12Hz<=0;
        cnt5k<=0;
    end
    else begin
        if(cnt5k==13'd4999)begin
            cnt5k<=0;
            clk12Hz<=~clk12Hz;
        end
        else begin
            cnt5k<=cnt5k+1;
        end
    end
end

always@(posedge clk120kHz or negedge rstn)begin
    if(!rstn)begin
        clk24Hz<=0;
        cnt2k5<=0;
    end
    else begin
        if(cnt2k5==2499)begin
            cnt2k5<=0;
            clk24Hz<=~clk24Hz;
        end
        else begin
            cnt2k5<=cnt2k5+1;
        end
    end
end

endmodule