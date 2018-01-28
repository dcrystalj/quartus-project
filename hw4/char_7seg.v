module char_7seg (C, Display);
	input [3:0] C; // input code
	output reg [6:0] Display; // output 7-seg code
	
	
	always @ (C)
		case (C)
			4'b0000: Display = 7'b1000000; //0
			4'b0001: Display = 7'b1111001; //1
			4'b0010: Display = 7'b0100100; //2
			4'b0011: Display = 7'b0110000; //3
			4'b0100: Display = 7'b0011001; //4
			4'b0101: Display = 7'b0010010; //5
			4'b0110: Display = 7'b0000010; //6
			4'b0111: Display = 7'b1111000; //7
			4'b1000: Display = 7'b0000000; //8
			4'b1001: Display = 7'b0011000; //9
			default: Display = 7'b1111111; //off
		endcase
	
endmodule