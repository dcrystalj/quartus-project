module my_circuit (
    clk,
    read_ready, write_ready,
    readdata_left, readdata_right,
    read, write,
    writedata_left, writedata_right
);




parameter AUDIO_DATA_WIDTH  = 6'd24;

input                               		clk;
input                               		read_ready, write_ready;
input signed [AUDIO_DATA_WIDTH-1:0] 	   readdata_left, readdata_right;
output                              		read, write;
output reg [AUDIO_DATA_WIDTH-1:0] 			writedata_left;
output reg signed  [AUDIO_DATA_WIDTH-1:0] writedata_right;


reg [16:0] i = 0;

reg signed [23:0] buffer_left [127:0];
reg signed [23:0] buffer_right [127:0];

wire signed [AUDIO_DATA_WIDTH-1:0] result_left;
wire signed [AUDIO_DATA_WIDTH-1:0] result_right;

average_filter afl (clk, read_ready, readdata_left, result_left);
average_filter afr (clk, read_ready, readdata_right, result_right);

always @ (posedge clk ) begin
        //READ
        if (read_ready) begin
				//uncomment fo no noise reduction for left channel
            //data_left <= readdata_left;
				
				i <= i+1;
				buffer_left[i] <= result_left;
				buffer_right[i] <= result_right;
        end
        
        //WRITE
        else if (write_ready) begin
				i<=i-1;
            writedata_left <= buffer_left[i];
            writedata_right <= buffer_right[i];				
        end
end

assign write = write_ready;
assign read  = read_ready;


endmodule