module half_adder (x1, x2, c, r);
 input x1, x2;
 output c, r; //c-carry, r-result

 and(c, x1, x2);
 xor(r, x1, x2);
 
endmodule 