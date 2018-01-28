module mux(ENABLE, A, B, C, D, Out);
	input ENABLE, A, B, C, D;
	output Out;
	
	wire [7:0] I;
	assign I = {1'b0, 1'b0, 1'b0, ~D, 1'b0, 1'b1, D,  1'b0};
	
	wire [2:0] S;
	assign S = {C, B, A};
	
	wire mux_result;
	
	mux_8_1 mux8 (.I(I), .S(S), .Z(mux_result));
	
	wire Out = ENABLE ? ~mux_result : 1'bz;
		
endmodule