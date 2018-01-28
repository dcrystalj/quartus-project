module array_sum(input [128:0] array [0:128], output reg sum);
	genvar j;
	sum = 0;
	generate 
		for(i=0;i<128;i=i+1)begin
				sum <= sum + sig[i+1:i];
		end
	end
end