`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:46:16 08/13/2015 
// Design Name: 
// Module Name:    bcd2ftsegdec 
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
module bcd2ftsegdec(
	display,
	bcd
    );
	 
	output [14:0] display; // SSD display output
	input [3:0] bcd; // BCD input
	reg [14:0] display; // SSD display output (in always)
	// Combinational logics:
	always @(bcd)
		case (bcd)
			4'd0: display = 15'b0001_0000_1111_111;    // A
			4'd1: display = 15'b1000_0100_1111_111;    // d
			4'd2: display = 15'b0110_0000_1111_111;    // E
			4'd3: display = 15'b0111_0000_1111_111;    // F
			4'd4: display = 15'b0110_1111_1011_011;    // I
			4'd5: display = 15'b1110_0011_1111_111;    // L
			4'd6: display = 15'b1001_0011_0101_111;    // M
			4'd7: display = 15'b1100_0100_1111_111;    // o
			4'd8: display = 15'b0011_0000_1111_101;    // R
			4'd9: display = 15'b0100_1000_1111_111;    // S
			4'd10: display = 15'b1111_1100_1111_111; // -
			default: display = 15'b1111_1111_1111_111;  // default
		endcase

	 


endmodule
