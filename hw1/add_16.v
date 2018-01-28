module add_16 (x1, x2, c_in, r, c_out);
	
	parameter SIZE = 16;
	parameter SUB_MODULES = 4; 
	
	input [SIZE-1:0] x1, x2;
	input c_in;
	output [SIZE-1:0] r;
	output c_out;
	
	//create extra values for carry in loop
	wire [SUB_MODULES:0] c_tmp;
	
	//first value should be input of the module, other values are calculated later
	assign c_tmp[0] = c_in;
	
	genvar i;
	generate
		for (i = 0; i < SUB_MODULES; i = i + 1) 
			begin: gen_add4
				localparam integer j = i * SUB_MODULES;
				localparam integer k = (i+1) * SUB_MODULES - 1;
				add_4 add4 ( .x1(x1[k:j]), .x2(x2[k:j]), .c_in(c_tmp[i]), 
								 .c_out(c_tmp[i+1]), .r(r[k:j]));
		end
	endgenerate
	
	//assign correct carry from temporal extra values
	assign c_out = c_tmp[SUB_MODULES];
	
endmodule

