module average_filter_4 (
    clk,
	 enable,
    signal,
	 result
);




parameter AUDIO_DATA_WIDTH  = 6'd24;
parameter NUMBER_OF_SAMPLES = 4; //do not use something like 8'd64 here !!
parameter N = 2; // set it to LOG(NUMBER_OF_SAMPLES)

//calculated parameters dependand on previous parameters
parameter FIFO_WIDTH = NUMBER_OF_SAMPLES * AUDIO_DATA_WIDTH-1;
parameter LAST_SAMPLE_IN_FIFO = (NUMBER_OF_SAMPLES-1) * AUDIO_DATA_WIDTH;

//in out
input													clk;
input													enable;
input			signed [AUDIO_DATA_WIDTH-1:0]	signal;
output reg	signed [AUDIO_DATA_WIDTH-1:0]	result;

//extra registers
reg [FIFO_WIDTH:0] fifo;

reg signed [AUDIO_DATA_WIDTH+2:0] acc;
reg signed [AUDIO_DATA_WIDTH+2:0] tmp;
reg signed [AUDIO_DATA_WIDTH-1:0] data;



always @ (posedge clk ) begin	
	if (enable) begin		  
		//divide input
		data <= signal / N;

		//put it in fifo
		fifo <= {fifo, data};

		tmp <= data - fifo[FIFO_WIDTH:LAST_SAMPLE_IN_FIFO];

		result <= tmp + acc;

		acc <= result;
	end
end

endmodule