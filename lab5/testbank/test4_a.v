module test4_a(input [5:0] sel,
input [3:0] a,b,
output reg [3:0] result);

always @(*) begin
	result = sel[0] ? a + b : sel[1] ? a - b :
				sel[2] ? a & b : sel[3] ? a ^ b :
				sel[4] ? ~a : ~ b;
	if(~|sel)
		result = 4'b0;
end

endmodule