/** 
* author: Tomaz Tomazic, uco: 440885
*
* Trick here is to light first and last led for the same amount of time as others.
* In this solution we will use counting to 2 times number of lights - 2,
* to be flexible in duration and number of used leds. 
* If we count to ((2 * leds_num) - 2) we can achieve forward and backward direction in same loop.
* 
* If we add more leds then now we should specify more values on input and not change parameters only
*/ 

module blink_leds (clock, reset_n, led);
	
	parameter [4:0]  leds_num     = 4'b1000;		  //specify how many leds are you using
	parameter [25:0] led_duration = 25'd6_500_000; //specify how long is one led lighting
	
	input clock, reset_n;
	output reg [leds_num-1:0] led;
	
	reg [31:0] counter;	
	reg [31:0] max_duration = (leds_num-1) * led_duration; //just for simpler if statement
	reg [5:0]  i;
	
	
	always @ (posedge clock or negedge reset_n)
	begin
		if (reset_n == 0)
			begin
				counter <= 0;			
				led <= 8'b_0000_0000;
			end
		else
			begin
			
				//change leds				
				for(i = 5'h0; i < leds_num; i = i + 1) 
				begin	//open led in forward direction OR in backward but make sure to count(timer) to 2*num_leds-2!					
					if ( 
						 counter >= (led_duration * i) && counter <= (led_duration * (i+1)) |
							counter >= max_duration + (((leds_num-1)-i) * led_duration) && 
							counter <= max_duration + (((leds_num)-i) * led_duration) // maximum + (difference of curent to maximum)
						 ) 
						led[i] <= 1;
					else
						led[i] <= 0;
				end
				
				//change counter
				if (counter < ((leds_num << 1) - 2) * led_duration)
					counter <= counter + 1; 
				else 
					counter <= 0;
					
			end
	end
endmodule