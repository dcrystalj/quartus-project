module test1_a(
output reg [7:0] XPower,
input clk,
input [7:0] X
);
reg [7:0] XPower1, XPower2, XPower3, XPower4;
reg [7:0] X1, X2, X3, X4;

always @(posedge clk) begin
	// Pipeline stage 1
	X1 <= X;
	XPower1 <= X;
	// Pipeline stage 2
	X2 <= X1;
	XPower2 <= XPower1 * X1;
	// Pipeline stage 3
	X3 <= X2;
	XPower3 <= XPower2 * X2;
	// Pipeline stage 4
	X4 <= X3;
	XPower4 <= XPower3 * X3;
	// Pipeline stage 5
	XPower <= XPower4 * X4;	
end

endmodule 