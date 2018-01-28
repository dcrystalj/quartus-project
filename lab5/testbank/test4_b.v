module test4_b(input [5:0] sel,
input [3:0] a,b,
output reg [3:0] result);

always @(*) begin
	casex(sel)
		6'bxxxxx1: result = a + b;
		6'bxxxx10: result = a - b;
		6'bxxx100: result = a & b;
		6'bxx1000: result = a ^+ b;
		6'bx10000: result = ~a;
		6'b100000: result = ~b;
		default: result = 4'b0;
	endcase	
end

endmodule