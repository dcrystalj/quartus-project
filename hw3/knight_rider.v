module knight_rider (clock, reset_n, led);
	input clock, reset_n;
	output [7:0] led;
	
	blink_leds blink_leds_inst
	(
		.clock(clock) ,	// input  clock_sig
		.reset_n(reset_n) ,	// input  reset_n_sig
		.led(led) 	// output [leds_num-1:0] led_sig
	);
	
endmodule