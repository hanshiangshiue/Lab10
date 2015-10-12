`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:38:44 09/10/2015 
// Design Name: 
// Module Name:    speaker 
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
module speaker(
    clk,
	 rst_n,
	 audio_appsel,
	 audio_sysclk,
	 audio_bck,
	 audio_ws,
	 audio_data
	 );

input clk;
input rst_n;
output audio_appsel;
output audio_sysclk;
output audio_bck;
output audio_ws;
output audio_data;

wire clk_out;
reg [19:0] note_div;
wire [15:0] audio_left;
wire [15:0] audio_right;
reg [3:0] tone;
reg [3:0] tone_next;




always@(posedge clk_out or negedge rst_n)
begin
	if(~rst_n)
		tone<=4'd0;
	else
		tone<=tone_next;
end




always@(*)
begin
	if(tone<4'd15)
		tone_next=tone+4'd1;
	else
		tone_next=4'd0;
end



always@(*)
begin
	case(tone)
	4'b0000: note_div=20'd90909;
	4'b0001: note_div=20'd81632;
	4'b0010: note_div=20'd76628;
	4'b0011: note_div=20'd68259;
	4'b0100: note_div=20'd60606;
	4'b0101: note_div=20'd57306;
	4'b0110: note_div=20'd51020;
	4'b0111: note_div=20'd45454;
	4'b1000: note_div=20'd40485;
	4'b1001: note_div=20'd38167;
	4'b1010: note_div=20'd34013;
	4'b1011: note_div=20'd30303;
	4'b1100: note_div=20'd28653;
	4'b1101: note_div=20'd25510;
	4'b1110: note_div=20'd22727;
	4'b1111: note_div=20'd20242;
	endcase
end




freq_div f1(
	.clk_out(clk_out),
	.clk(clk)
	);



buzzer_control b1(
    .clk(clk),
	 .rst_n(rst_n),
	 .note_div(note_div),
	 .audio_left(audio_left),
	 .audio_right(audio_right)
	 );




speak_ctl s1(
    .clk(clk),
	 .rst_n(rst_n),
	 .audio_left(audio_left),
	 .audio_right(audio_right),
	 .audio_appsel(audio_appsel),
	 .audio_sysclk(audio_sysclk),
	 .audio_bck(audio_bck),
	 .audio_ws(audio_ws),
	 .audio_data(audio_data)
	 );



endmodule
