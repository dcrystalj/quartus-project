module test2_b(q, done, a, b, start, clk);
output reg [15:0] q;
output done;
input [7:0] a, b;
input start;
input clk;
reg [4:0] ctr;
reg [15:0] shiftA;
reg [7:0] shiftB;

always @(posedge clk) begin
	ctr <= (start) ? 5'b0 : ((!done) ? ctr + 1 : ctr);
	q <= (start) ? 16'b0 : 
	(!done) ? (shiftB[0] ? q + shiftA : q) : q;
	shiftB <= (start) ? b : {1'b0, shiftB[7:1]};
	shiftA <= (start) ? a : {shiftA[14:0], 1'b0};
end

assign done = ctr[3];

endmodule