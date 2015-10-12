`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:31:28 09/10/2015 
// Design Name: 
// Module Name:    electronic_organ 
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
module electronic_organ(
    clk,
	 rst_n,
	 col_n,
	 mode,//choose play double tones or not(single:0 double:1)
	 row_n,
	 pressed,
	 ftsd_ctl,
	 display,
	 audio_appsel,
	 audio_sysclk,
	 audio_bck,
	 audio_ws,
	 audio_data
	 );

input clk;
input rst_n;
input [3:0] col_n;
input mode;
output [3:0] row_n;
output pressed;
output [3:0] ftsd_ctl;
output [14:0] display;
output audio_appsel;
output audio_sysclk;
output audio_bck;
output audio_ws;
output audio_data;

wire [1:0] clk_ctl;
wire clk_150;
wire [3:0] key;
reg [19:0] note_div_left;
reg [19:0] note_div_right;
wire [15:0] audio_left;
wire [15:0] audio_right;
wire [3:0] ftsd_in;
reg [3:0] note_a3;//left audio
reg [3:0] note_a2;//left audio
reg [3:0] note_a1;//right audio
reg [3:0] note_a0;//right audio



always@(*)
begin
	if(mode==1'b0)
	begin
		case(key)
		4'd10://A
		begin
			note_div_left=20'd90909;
			note_div_right=20'd90909;
			note_a3=4'd5;//L
			note_a2=4'd0;//A
			note_a1=4'd5;//L
			note_a0=4'd0;//A
		end
		4'd0:
		begin
			note_div_left=20'd81632;
			note_div_right=20'd81632;
			note_a3=4'd9;//S
			note_a2=4'd4;//I
			note_a1=4'd9;//S
			note_a0=4'd4;//I
		end
		4'd1:
		begin
			note_div_left=20'd76628;
			note_div_right=20'd76628;
			note_a3=4'd1;//D
			note_a2=4'd7;//o
			note_a1=4'd1;//D
			note_a0=4'd7;//o
		end
		4'd2:
		begin
			note_div_left=20'd68259;
			note_div_right=20'd68259;
			note_a2=4'd8;//R
			note_a2=4'd2;//E
			note_a1=4'd8;//R
			note_a0=4'd2;//E
		end
		4'd3:
		begin
			note_div_left=20'd60606;
			note_div_right=20'd60606;
			note_a3=4'd6;//M
			note_a2=4'd4;//I
			note_a1=4'd6;//M
			note_a0=4'd4;//I
		end
		4'd4:
		begin
			note_div_left=20'd57306;
			note_div_right=20'd57306;
			note_a3=4'd3;//F
			note_a2=4'd0;//A
			note_a1=4'd3;//F
			note_a0=4'd0;//A
		end
		4'd5:
		begin
			note_div_left=20'd51020;
			note_div_right=20'd51020;
			note_a3=4'd9;//S
			note_a2=4'd7;//o
			note_a1=4'd9;//S
			note_a0=4'd7;//o
		end
		4'd6:
		begin
			note_div_left=20'd45454;
			note_div_right=20'd45454;
			note_a3=4'd5;//L
			note_a2=4'd0;//A
			note_a1=4'd5;//L
			note_a0=4'd0;//A
		end
		4'd7:
		begin
			note_div_left=20'd40485;
			note_div_right=20'd40485;
			note_a3=4'd9;//S
			note_a2=4'd4;//I
			note_a1=4'd9;//S
			note_a0=4'd4;//I
		end
		4'd8:
		begin
			note_div_left=20'd38167;
			note_div_right=20'd38167;
			note_a3=4'd1;//D
			note_a2=4'd7;//o
			note_a1=4'd1;//D
			note_a0=4'd7;//o
		end
		4'd9:
		begin
			note_div_left=20'd34013;
			note_div_right=20'd34013;
			note_a3=4'd8;//R
			note_a2=4'd2;//E
			note_a1=4'd8;//R
			note_a0=4'd2;//E
		end
		4'd11:
		begin
			note_div_left=20'd30303;
			note_div_right=20'd30303;
			note_a3=4'd6;//M
			note_a2=4'd4;//I
			note_a1=4'd6;//M
			note_a0=4'd4;//I
		end
		4'd12:
		begin
			note_div_left=20'd28653;
			note_div_right=20'd28653;
			note_a3=4'd3;//F
			note_a2=4'd0;//A
			note_a1=4'd3;//F
			note_a0=4'd0;//A
		end
		4'd13:
		begin
			note_div_left=20'd25510;
			note_div_right=20'd25510;
			note_a3=4'd9;//S
			note_a2=4'd7;//o
			note_a1=4'd9;//S
			note_a0=4'd7;//o
		end
		4'd14:
		begin
			note_div_left=20'd22727;
			note_div_right=20'd22727;
			note_a3=4'd5;//L
			note_a2=4'd0;//A
			note_a1=4'd5;//L
			note_a0=4'd0;//A
		end
		4'd15:
		begin
			note_div_left=20'd20242;
			note_div_right=20'd20242;
			note_a3=4'd9;//S
			note_a2=4'd4;//I
			note_a1=4'd9;//S
			note_a0=4'd4;//I
		end
		endcase
	end
	else//mode==1'b1
	begin
		case(key)
		4'd10://A
		begin
			note_div_left=20'd90909;
			note_div_right=20'd152672;
			note_a3=4'd5;//L
			note_a2=4'd0;//A
			note_a1=4'd1;//D
			note_a0=4'd7;//o
		end
		4'd0:
		begin
			note_div_left=20'd81632;
			note_div_right=20'd136054;
			note_a3=4'd9;//S
			note_a2=4'd4;//I
			note_a1=4'd8;//R
			note_a0=4'd2;//E
		end
		4'd1:
		begin
			note_div_left=20'd76628;
			note_div_right=20'd121212;
			note_a3=4'd1;//D
			note_a2=4'd7;//o
			note_a1=4'd6;//M
			note_a0=4'd4;//I
		end
		4'd2:
		begin
			note_div_left=20'd68259;
			note_div_right=20'd114286;
			note_a2=4'd8;//R
			note_a2=4'd2;//E
			note_a1=4'd3;//F
			note_a0=4'd0;//A
		end
		4'd3:
		begin
			note_div_left=20'd60606;
			note_div_right=20'd102041;
			note_a3=4'd6;//M
			note_a2=4'd4;//I
			note_a1=4'd9;//S
			note_a0=4'd7;//o
		end
		4'd4:
		begin
			note_div_left=20'd57306;
			note_div_right=20'd90909;
			note_a3=4'd3;//F
			note_a2=4'd0;//A
			note_a1=4'd5;//L
			note_a0=4'd0;//A
		end
		4'd5:
		begin
			note_div_left=20'd51020;
			note_div_right=20'd81632;
			note_a3=4'd9;//S
			note_a2=4'd7;//o
			note_a1=4'd9;//S
			note_a0=4'd4;//I
		end
		4'd6:
		begin
			note_div_left=20'd45454;
			note_div_right=20'd76628;
			note_a3=4'd5;//L
			note_a2=4'd0;//A
			note_a1=4'd1;//D
			note_a0=4'd7;//o
		end
		4'd7:
		begin
			note_div_left=20'd40485;
			note_div_right=20'd68259;
			note_a3=4'd9;//S
			note_a2=4'd4;//I
			note_a1=4'd8;//R
			note_a0=4'd2;//E
		end
		4'd8:
		begin
			note_div_left=20'd38167;
			note_div_right=20'd60606;
			note_a3=4'd1;//D
			note_a2=4'd7;//o
			note_a1=4'd6;//M
			note_a0=4'd4;//I
		end
		4'd9:
		begin
			note_div_left=20'd34013;
			note_div_right=20'd57306;
			note_a3=4'd8;//R
			note_a2=4'd2;//E
			note_a1=4'd3;//F
			note_a0=4'd0;//A
		end
		4'd11:
		begin
			note_div_left=20'd30303;
			note_div_right=20'd51020;
			note_a3=4'd6;//M
			note_a2=4'd4;//I
			note_a1=4'd9;//S
			note_a0=4'd7;//o
		end
		4'd12:
		begin
			note_div_left=20'd28653;
			note_div_right=20'd45454;
			note_a3=4'd3;//F
			note_a2=4'd0;//A
			note_a1=4'd5;//L
			note_a0=4'd0;//A
		end
		4'd13:
		begin
			note_div_left=20'd25510;
			note_div_right=20'd40485;
			note_a3=4'd9;//S
			note_a2=4'd7;//o
			note_a1=4'd9;//S
			note_a0=4'd4;//I
		end
		4'd14:
		begin
			note_div_left=20'd22727;
			note_div_right=20'd38167;
			note_a3=4'd5;//L
			note_a2=4'd0;//A
			note_a1=4'd1;//D
			note_a0=4'd7;//o
		end
		4'd15:
		begin
			note_div_left=20'd20242;
			note_div_right=20'd34013;
			note_a3=4'd9;//S
			note_a2=4'd4;//I
			note_a1=4'd8;//R
			note_a0=4'd2;//E
		end
		endcase
	end
end




freq_div f1(
	.clk_ctl(clk_ctl),
	.clk_150(clk_150),
	.clk(clk)
	);


keypad_scan k1(
    .clk(clk_150),
	 .rst_n(rst_n),
	 .col_n(col_n),
	 .row_n(row_n),
	 .key(key),
	 .pressed(pressed)
	 );



buzzer_control b1(
    .clk(clk),
	 .rst_n(rst_n),
	 .note_div_left(note_div_left),
	 .note_div_right(note_div_right),
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




scan_ctl sc1(
	.ftsd_ctl(ftsd_ctl),
	.ftsd_in(ftsd_in),
	.in0(note_a3),
	.in1(note_a2),
	.in2(note_a1),
	.in3(note_a0),
	.ftsd_ctl_en(clk_ctl)
    );



bcd2ftsegdec bcd1(
	.display(display),
	.bcd(ftsd_in)
    );


endmodule
