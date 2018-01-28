module full_adder (x1, x2, c_in, c_out, r);

	input x1, x2, c_in;
	output c_out, r;
	
	wire r_ha_1, c1, c2;//r_ha_1 == reuslt of first half adder, c1 - carry from first adder, c2 - carry from second
	
	half_adder ha1( .x1(x1), .x2(x2), .r(r_ha_1), .c(c1)); //sum and save result in r_ha_1
	half_adder ha2( .x1(r_ha_1), .x2(c_in), .r(r), .c(c2)); //sum r_ha_1 and carry from input and save in final result r
	
	or(c_out, c1, c2); //save final carry for next full adder to c_out
	
endmodule