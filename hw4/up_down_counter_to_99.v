module up_down_counter_to_99 (clock, up, out0, out1);
	output [3:0] out0, out1;
	input wire clock, up;
	reg [3:0] counter0, counter1;
	
	task calculate_time;
		input [3:0] direction, min, max;
		
		if (counter0 == max) begin
				counter0 <= min;
				
				if (counter1 != max)
					counter1 <= counter1 + direction;
				else
					counter1 <= min;
		end else 
				counter0 <= counter0 + direction;
	endtask
	
	always @(posedge clock)
		if (up) begin
			calculate_time (4'd1, 4'd0, 4'd9);			
		end else
			calculate_time (-4'd1, 4'd9, 4'd0);
		
		assign out0 = counter0;
		assign out1 = counter1;
endmodule 



/* long version
if (up) begin
			if (counter0 == 4'd9) begin
				counter0 <= 4'd0;
				
				if (counter1 != 4'd9)
					counter1 <= counter1 + 4'd1;
				else
					counter1 <= 4'd0;
					
			end else 
				counter0 <= counter0 + 4'd1;
				
		end else begin //down
			
			if (counter0 == 4'd0) begin
				counter0 <= 4'd9;
				
				if (counter1 != 0)
					counter1 <= counter1 - 4'd1;
				else
					counter1 <= 4'd9;
					
			end else begin
				counter0 <= counter0 - 4'd1;
			end			
			
		end*/