module texture(
addr,
data
);
input [9:0]addr;
output [7:0]data;

reg [7:0]data;

always@(addr)
begin
case(addr)
10'd0: data =  8'h01;//data of the t-rex
10'd1: data =  8'h01;
10'd2: data =  8'h01;
10'd3: data =  8'h01;
10'd4: data =  8'h01;
10'd5: data =  8'h01;
10'd6: data =  8'h00;
10'd7: data =  8'h00;
10'd8: data =  8'h00;
10'd9: data =  8'h00;
10'd10: data =  8'h00;
10'd11: data =  8'h03;
10'd12: data =  8'h01;
10'd13: data =  8'h87;
10'd14: data =  8'hcf;
10'd15: data =  8'hff;
10'd16: data =  8'hff;
10'd17: data =  8'hff;
10'd18: data =  8'h7f;
10'd19: data =  8'h7f;
10'd20: data =  8'h3f;
10'd21: data =  8'h1f;
10'd22: data =  8'hce;
10'd23: data =  8'h0c;
10'd24: data =  8'h68;
10'd25: data =  8'h0c;
10'd26: data =  8'h1f;
10'd27: data =  8'h7f;
10'd28: data =  8'h67;
10'd29: data =  8'h7f;
10'd30: data =  8'h7f;
10'd31: data =  8'h7f;
10'd32: data =  8'h7e;
10'd33: data =  8'h7f;
10'd34: data =  8'hfc;
10'd35: data =  8'hfc;
10'd36: data =  8'hff;
10'd37: data =  8'hfd;
10'd38: data =  8'hfc;
10'd39: data =  8'hfc;
10'd40: data =  8'hfc;
10'd41: data =  8'hf8;
10'd42: data =  8'hf8;
10'd43: data =  8'hf0;
10'd44: data =  8'he0;
10'd45: data =  8'he7;
10'd46: data =  8'h60;
10'd47: data =  8'h60;
10'd48: data =  8'h70;
10'd49: data =  8'he0;
10'd50: data =  8'hf0;
10'd51: data =  8'hf0;
10'd52: data =  8'hf0;
10'd53: data =  8'hf0;
10'd54: data =  8'hf0;
10'd55: data =  8'h00;
10'd56: data =  8'hc0;
10'd57: data =  8'h00;
10'd58: data =  8'h00;
10'd59: data =  8'h00;
10'd60: data =  8'h00;
10'd61: data =  8'h00;
10'd62: data =  8'h00;
10'd63: data =  8'h00;
10'd64: data =  8'h00;
10'd65: data =  8'h00;
10'd66: data =  8'h00;
10'd67: data =  8'h00;
10'd68: data =  8'hf8;
10'd69: data =  8'h03;//data of the obstacle
10'd70: data =  8'h03;
10'd71: data =  8'h03;
10'd72: data =  8'h03;
10'd73: data =  8'h03;
10'd74: data =  8'h03;
10'd75: data =  8'h03;
10'd76: data =  8'h03;
10'd77: data =  8'h01;
10'd78: data =  8'h1c;
10'd79: data =  8'h3c;
10'd80: data =  8'h3c;
10'd81: data =  8'h3c;
10'd82: data =  8'h3c;
10'd83: data =  8'h3c;
10'd84: data =  8'h3c;
10'd85: data =  8'hbc;
10'd86: data =  8'hbc;
10'd87: data =  8'hbc;
10'd88: data =  8'hbc;
10'd89: data =  8'hbc;
10'd90: data =  8'hbc;
10'd91: data =  8'hbc;
10'd92: data =  8'hff;
10'd93: data =  8'hff;
10'd94: data =  8'hfc;
10'd95: data =  8'h3c;
10'd96: data =  8'h3c;
10'd97: data =  8'h3c;
10'd98: data =  8'h3c;
10'd99: data =  8'h3c;
10'd100: data =  8'h3c;
10'd101: data =  8'h3c;
10'd102: data =  8'hfc;
10'd103: data =  8'hc0;
10'd104: data =  8'hc0;
10'd105: data =  8'hc0;
10'd106: data =  8'hc0;
10'd107: data =  8'hc0;
10'd108: data =  8'hc0;
10'd109: data =  8'hc0;
10'd110: data =  8'hc0;
10'd111: data =  8'h80;
default: data =  8'h00;
endcase
end

endmodule
