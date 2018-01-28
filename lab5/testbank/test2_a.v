module test2_a(q, a, b);
output reg [15:0] q;
input [7:0] a, b;
reg [15:0] tmp [7:0];

always @(a or b) begin
	tmp[0] = b[0] ? a : 16'b0;
	tmp[1] = tmp[0] + (b[1] ? {a, 1'b0} : 16'b0);
	tmp[2] = tmp[1] + (b[2] ? {a, 2'b0} : 16'b0);
	tmp[3] = tmp[2] + (b[3] ? {a, 3'b0} : 16'b0);
	tmp[4] = tmp[3] + (b[4] ? {a, 4'b0} : 16'b0);
	tmp[5] = tmp[4] + (b[5] ? {a, 5'b0} : 16'b0);
	tmp[6] = tmp[5] + (b[6] ? {a, 6'b0} : 16'b0);
	tmp[7] = tmp[6] + (b[7] ? {a, 7'b0} : 16'b0);
	q = tmp[7];
end

endmodule