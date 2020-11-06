module Clock_Divider(
    clk_120kHz,
    rstn,
    clk_12Hz
);

input clk_120kHz;
input rstn;
output reg clk_12Hz;
reg [12:0] cnt5k;

always@(posedge clk_120kHz or negedge rstn)begin
    if(!rstn)begin
        clk_12Hz<=0;
        cnt5k<=0;
    end
    else begin
        if(cnt5k==13'd4999)begin
            cnt5k<=0;
            clk_12Hz<=~clk_12Hz;
        end
        else begin
            cnt5k<=cnt5k+1;
        end
    end
end

endmodule