`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:18:39 09/04/2015 
// Design Name: 
// Module Name:    buzzer_control 
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
module buzzer_control(
    clk,
	 rst_n,
	 note_div_left,
	 note_div_right,
	 audio_left,
	 audio_right
	 );

input clk;
input rst_n;
input [19:0] note_div_left;//div for note generation
input [19:0] note_div_right;
output [15:0] audio_left;//left sound audio
output [15:0] audio_right;//right sound audio

reg [19:0] clk_cnt_left;
reg [19:0] clk_cnt_right;
reg [19:0] clk_cnt_left_next;
reg [19:0] clk_cnt_right_next;
reg b_clk_left;
reg b_clk_left_next;
reg b_clk_right;
reg b_clk_right_next;




//note frequency generation
always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
	begin
		clk_cnt_left<=20'd0;
		clk_cnt_right<=20'd0;
		b_clk_left<=1'b0;
		b_clk_right<=1'b0;
	end
	else
	begin
		clk_cnt_left<=clk_cnt_left_next;
		clk_cnt_right<=clk_cnt_right_next;
		b_clk_left<=b_clk_left_next;
		b_clk_right<=b_clk_right_next;
	end
end



//note frequency generation
always@(*)
begin
	if(clk_cnt_left==note_div_left)
	begin
		clk_cnt_left_next=20'd0;
		b_clk_left_next=~b_clk_left;
	end
	else
	begin
		clk_cnt_left_next=clk_cnt_left+1'b1;
		b_clk_left_next=b_clk_left;
	end
end



always@(*)
begin
	if(clk_cnt_right==note_div_right)
	begin
		clk_cnt_right_next=20'd0;
		b_clk_right_next=~b_clk_right;
	end
	else
	begin
		clk_cnt_right_next=clk_cnt_right+1'b1;
		b_clk_right_next=b_clk_right;
	end
end


//assign the amplitude of the note
assign audio_left=(b_clk_left==1'b0)?16'h0200:16'h3FFF;
assign audio_right=(b_clk_right==1'b0)?16'h0200:16'h3FFF;



endmodule
