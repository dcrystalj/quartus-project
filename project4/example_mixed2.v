module example_mixed2 (w1, w2, w3, w4, x2, f);
	input w1, w2, w3, w4, x2;
	output f;
	
	verfunctions inst1 (w1, w1, w3, w4, g, h);
	lab1 inst2 (g, x2, h, f);
	
endmodule