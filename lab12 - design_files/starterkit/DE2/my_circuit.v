module my_circuit (
    clk,
    read_ready, write_ready,
    readdata_left, readdata_right,
    read, write,
    writedata_left, writedata_right
);

parameter AUDIO_DATA_WIDTH  = 6'd24;
parameter SAMPLING_RATE = 48000;
parameter PRECISION 		= 8;
parameter SKIP_RATE		= 4;
parameter SKIP_BITS 		= AUDIO_DATA_WIDTH - PRECISION;
parameter BUFFER_LENGTH = SAMPLING_RATE * 2 * PRECISION / SKIP_RATE;

input                               		clk;
input                               		read_ready, write_ready;
input signed [AUDIO_DATA_WIDTH-1:0] 	   readdata_left, readdata_right;
output                              		read, write;
output reg [AUDIO_DATA_WIDTH-1:0] 			writedata_left;
output reg signed  [AUDIO_DATA_WIDTH-1:0] writedata_right;


reg [3:0] i = 0;

reg [BUFFER_LENGTH-1:0] buffer_left;
reg [BUFFER_LENGTH-1:0] buffer_right;

wire signed [AUDIO_DATA_WIDTH-1:0] result_left;
wire signed [AUDIO_DATA_WIDTH-1:0] result_right;

wire signed [AUDIO_DATA_WIDTH-1:0] echoed_result_left;
wire signed [AUDIO_DATA_WIDTH-1:0] echoed_result_right;

reg signed [AUDIO_DATA_WIDTH-1:0] sum_left;
reg signed [AUDIO_DATA_WIDTH-1:0] sum_right;
reg signed [AUDIO_DATA_WIDTH-1:0] echo_left;
reg signed [AUDIO_DATA_WIDTH-1:0] echo_right;
reg signed [AUDIO_DATA_WIDTH:0] 	 tmp_left;
reg signed [AUDIO_DATA_WIDTH:0]   tmp_right;


average_filter_32 afl (clk, read_ready, readdata_left, result_left);
average_filter_32 afr (clk, read_ready, readdata_right, result_right);

average_filter_16 afll (clk, read_ready && (i == SKIP_RATE-1) , echo_left, echoed_result_left);
average_filter_16 aflr (clk, read_ready && (i == SKIP_RATE-1) , echo_right, echoed_result_right);

always @ (posedge clk ) begin
        //READ
        if (read_ready) begin

				tmp_left  <= (result_left  & 24'hff0000) >> SKIP_BITS;
				tmp_right <= (result_right & 24'hff0000) >> SKIP_BITS;
				
				if (i >= SKIP_RATE-1) begin;
					i <= 4'd0;
					buffer_left <= {buffer_left, tmp_left[PRECISION-1:0]};	
					echo_left 	<= (buffer_left[BUFFER_LENGTH-1:BUFFER_LENGTH-PRECISION] << SKIP_BITS);
					
					buffer_right <= {buffer_right, tmp_right[PRECISION-1:0]};						
					echo_right 	 <= (buffer_right[BUFFER_LENGTH-1:BUFFER_LENGTH-PRECISION] << SKIP_BITS);
					
				end else
					i <= i + 1'b1;
				
        end
        
        //WRITE
        else if (write_ready) begin
				sum_left 		<= (echoed_result_left) + (result_left >>> 1);
				writedata_left <= sum_left;
				
				sum_right 		 <= (echoed_result_right) + (result_right >>> 1);            
            writedata_right <= sum_right;				
        end
end

assign write = write_ready;
assign read  = read_ready;


endmodule