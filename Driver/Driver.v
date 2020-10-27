module Driver(
    clk,
    rst_n,

    start_i,
    addr_o,
    data_i,

    db_o,
    dori_o,
);

input clk,rst_n;
input start;
output [9:0]addr_o;//one LCD_Graphic
input [7:0]data_i;

output [7:0]db_o;
output dori_o;

endmodule