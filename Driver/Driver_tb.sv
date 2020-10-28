module tb();

reg clk,rstn;
reg start;
reg [7:0]data;
wire [9:0]addr;
wire [7:0]db;
wire dori;
wire [1:0]cs;
wire en;
wire rw;
wire rst_o;

Driver driver(.clk(clk),.rstn(rstn),.start_i(start),.addr_o(addr),
    .data_i(data),
    .db_o(db),.dori_o(dori),.cs_o(cs),.en_o(en),.rw_o(rw),.rst_o(rst_o));

initial begin
    clk=0;
    rstn=1;
    start=0;
    #10
    rstn=0;
    #10
    rstn=1;
    #100
    start=1;
    #50
    start=0;
end

always begin
    #5
    clk=~clk;
    if(clk) data[7:0]=addr[7:0];
    $display("addr %b, db %b, dori %b, cs %b, en %b, rw %b, rst_o %b",addr, db,dori,cs,en,rw,rst_o);
end

endmodule