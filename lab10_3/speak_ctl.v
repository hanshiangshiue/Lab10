`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:59:36 09/09/2015 
// Design Name: 
// Module Name:    speak_ctl 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module speak_ctl(
    clk,
	 rst_n,
	 audio_left,
	 audio_right,
	 audio_appsel,
	 audio_sysclk,
	 audio_bck,
	 audio_ws,
	 audio_data
	 );


input clk;
input rst_n;
input [15:0] audio_left;
input [15:0] audio_right;
output audio_appsel;//sterio playing
output audio_sysclk;//40MHz
output audio_bck;
output audio_ws;
output audio_data;



reg [7:0] cnt;
reg [7:0] cnt_tmp;
reg [4:0] cnt2;//////////////////////
reg [4:0] cnt2_tmp;//////////////////
reg [15:0] shift;
reg audio_data;
wire audio_appsel;
wire audio_sysclk;
wire audio_bck;
wire audio_ws;

assign audio_appsel=1'b1;
assign audio_sysclk=clk;
assign audio_bck=cnt[2];//40MHz/(2^3)=5MHz
assign audio_ws=cnt[7];//40MHz/(2^8)=5/32MHz


//////////////////////////////
always@(*)
begin
	cnt_tmp=cnt+1'b1;
	cnt2_tmp=cnt2+1'b1;
end


////////////////////////////
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		cnt<=8'd0;
	else
		cnt<=cnt_tmp;
end


/////////////////////////////////
always@(negedge cnt[2] or negedge rst_n)
begin
	if(~rst_n)
	begin
		cnt2<=5'd0;
	end
	else
	begin
		cnt2<=cnt2_tmp;
	end
end


always@(posedge audio_bck or negedge rst_n)
begin
	if(~rst_n)
	begin
		shift<=16'b0;
	end
	else	
	begin
		if(audio_ws==1'b0)
		begin
			shift<=audio_left;
		end
		else
		begin
			shift<=audio_right;
		end
	end
end


//¶Ç°e¶¶§Ç:MSB -> LSB
always@(*)
begin
	
	case(cnt2)
   5'd0: audio_data=audio_right[15];
	5'd1: audio_data=audio_left[14];
	5'd2: audio_data=audio_right[13];
	5'd3: audio_data=audio_left[12];
	5'd4: audio_data=audio_right[11];
	5'd5: audio_data=audio_left[10];
	5'd6: audio_data=audio_right[9];
	5'd7: audio_data=audio_left[8];
	5'd8: audio_data=audio_right[7];
	5'd9: audio_data=audio_left[6];
	5'd10: audio_data=audio_right[5];
	5'd11: audio_data=audio_left[4];
	5'd12: audio_data=audio_right[3];
	5'd13: audio_data=audio_left[2];
	5'd14: audio_data=audio_right[1];
	5'd15: audio_data=audio_left[0];
	5'd16: audio_data=audio_left[15];
	5'd17: audio_data=audio_right[14];
	5'd18: audio_data=audio_left[13];
	5'd19: audio_data=audio_right[12];
	5'd20: audio_data=audio_left[11];
	5'd21: audio_data=audio_right[10];
	5'd22: audio_data=audio_left[9];
   5'd23: audio_data=audio_right[8];
	5'd24: audio_data=audio_left[7];
	5'd25: audio_data=audio_right[6];
	5'd26: audio_data=audio_left[5];
	5'd27: audio_data=audio_right[4];
	5'd28: audio_data=audio_left[3];
	5'd29: audio_data=audio_right[2];
	5'd30: audio_data=audio_left[1];
   5'd31: audio_data=audio_right[0];	
	default: audio_data=1'b0;
endcase
end


endmodule
