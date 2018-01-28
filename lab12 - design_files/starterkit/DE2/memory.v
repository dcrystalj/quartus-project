module memory (
	output reg [23:0] q, 
	input [15:0] address,
	input [23:0] data,
	input we, //write enable
	input clk
);

reg [23:0] mem [12000:0];

always @ (posedge clk)
	if (we)
		mem[address] = data;
	else
		q = mem[address];

endmodule