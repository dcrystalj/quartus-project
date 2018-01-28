/* 
* change output every 100 ms (every 5_000_000 ticks).
*
* it behaves like 5hz clock if it is
* connected to 50 Mhz clock outputs.
*/
module tick_200ms (enable, clock, out);
	output reg out = 1'b0;
	
	input enable, clock;
	reg [23:0] counter = 24'b0;
	
	always @(posedge clock)
		if (counter == 24'd5_000_000) begin
			counter <= 24'b0;
			out <= ~out;
		end else if (enable) begin
			counter <= counter + 4'd1;
		end
		
endmodule 