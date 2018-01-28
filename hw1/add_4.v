module add_4 (x1, x2, c_in, r, c_out);
	
	parameter SIZE = 4;
	
	input [SIZE-1:0] x1, x2;
	input c_in;
	output [SIZE-1:0] r;
	output c_out;
	
	//create extra values for carry in loop
	wire [SIZE:0] c_tmp;
	
	//first value should be input of the module, other values are calculated later
	assign c_tmp[0] = c_in;
	
	genvar i;
	generate
		for (i = 0; i < SIZE; i = i+1) 
			begin: gen_full_adder
				full_adder fa ( .x1(x1[i]), .x2(x2[i]), .c_in(c_tmp[i]), 
								 .c_out(c_tmp[i+1]), .r(r[i]));
		end
	endgenerate
	
	//assign correct carry from temporal extra values
	assign c_out = c_tmp[SIZE];
	
endmodule

