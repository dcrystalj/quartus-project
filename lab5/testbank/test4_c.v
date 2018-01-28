module test4_c(input [5:0] sel,
input [3:0] a,b,
output reg [3:0] result);

always @(*) begin
	result = 4'b0;
	casex(1'b1)
		sel[0]: result = a + b;
		sel[1]: result = a - b;
		sel[2]: result = a & b;
		sel[3]: result = a ^+ b;
		sel[4]: result = ~a;
		sel[5]: result = ~b;
	endcase
end

endmodule