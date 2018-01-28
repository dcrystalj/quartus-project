module mux_8_1 (I, S, Z);
	input [7:0] I;
	input [2:0] S;
	output Z;
	reg Z;
	
	always @ (S or I) begin
		case (S)
			0: Z = I[0];
			1: Z = I[1];
			2: Z = I[2];
			3: Z = I[3];
			4: Z = I[4];
			5: Z = I[5];
			6: Z = I[6];
			7: Z = I[7];
			default: Z = 1'b0;
		endcase
	end

endmodule