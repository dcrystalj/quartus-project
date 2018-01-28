module up_down_counter(clock, button0, button1, HEX0, HEX1);//
	output [6:0] HEX0, HEX1;
	input clock, button0, button1;
	
	wire [3:0] D0, D1;
	wire divided_clock_200ms;
	wire enable;
	
	assign enable = button0 ^ button1;
	
	tick_200ms tick (enable, clock, divided_clock_200ms);	
	
	up_down_counter_to_99 up99 (divided_clock_200ms, ~button0, D0, D1);

	char_7seg H0 (D0, HEX0);
	char_7seg H1 (D1, HEX1);
	
endmodule 