module trifid(
    input ready,
    input clk,
	 input crypt, //if 0 we do encryption else decryption
    input [7:0] data0,
    input [7:0] data1,
    input [7:0] data2,
    input [7:0] data3,
    input [7:0] data4,
    input [7:0] data5,
    input [7:0] data6,
    input [7:0] data7,
    input [7:0] data8,
    input [7:0] data9,
    input [7:0] data10,
    input [7:0] data11,
    input [7:0] data12,
    input [7:0] data13,
    input [7:0] data14,
    input [7:0] data15,
    input [7:0] data16,
    input [7:0] data17,

    output reg done,
    output reg [7:0] cipher0,
    output reg [7:0] cipher1,
    output reg [7:0] cipher2,
    output reg [7:0] cipher3,
    output reg [7:0] cipher4,
    output reg [7:0] cipher5,
    output reg [7:0] cipher6,
    output reg [7:0] cipher7,
    output reg [7:0] cipher8,
    output reg [7:0] cipher9,
    output reg [7:0] cipher10,
    output reg [7:0] cipher11,
    output reg [7:0] cipher12,
    output reg [7:0] cipher13,
    output reg [7:0] cipher14,
    output reg [7:0] cipher15,
    output reg [7:0] cipher16,
    output reg [7:0] cipher17
);


wire [5:0] coded0, coded1, coded2, coded3, coded4, coded5, coded6, coded7, coded8, coded9, coded10, coded11, coded12, coded13, coded14, coded15, coded16, coded17;

wire [5:0] transposed0, transposed1, transposed2, transposed3, transposed4, transposed5, transposed6, transposed7, transposed8, transposed9, transposed10, transposed11, transposed12, transposed13, transposed14, transposed15, transposed16, transposed17;
wire [5:0] de_transposed0, de_transposed1, de_transposed2, de_transposed3, de_transposed4, de_transposed5, de_transposed6, de_transposed7, de_transposed8, de_transposed9, de_transposed10, de_transposed11, de_transposed12, de_transposed13, de_transposed14, de_transposed15, de_transposed16, de_transposed17;

wire [5:0] extra0, extra1, extra2, extra3, extra4, extra5, extra6, extra7, extra8, extra9, extra10, extra11, extra12, extra13, extra14, extra15, extra16, extra17;

wire [7:0] decoded0, decoded1, decoded2, decoded3, decoded4, decoded5, decoded6, decoded7, decoded8, decoded9, decoded10, decoded11, decoded12, decoded13, decoded14, decoded15, decoded16, decoded17;

//code input in triplets
encoder e0 (data0, coded0);
encoder e1 (data1, coded1);
encoder e2 (data2, coded2);
encoder e3 (data3, coded3);
encoder e4 (data4, coded4);
encoder e5 (data5, coded5);
encoder e6 (data6, coded6);
encoder e7 (data7, coded7);
encoder e8 (data8, coded8);
encoder e9 (data9, coded9);
encoder e10 (data10, coded10);
encoder e11 (data11, coded11);
encoder e12 (data12, coded12);
encoder e13 (data13, coded13);
encoder e14 (data14, coded14);
encoder e15 (data15, coded15);
encoder e16 (data16, coded16);
encoder e17 (data17, coded17);

// transpose triplets in rows
transposer t0 (
    coded0, coded1, coded2, coded3, coded4, coded5, coded6, coded7, coded8, coded9, coded10, coded11, coded12, coded13, coded14, coded15, coded16, coded17, 
    transposed0, transposed1, transposed2, transposed3, transposed4, transposed5, transposed6, transposed7, transposed8, transposed9, transposed10, transposed11, transposed12, transposed13, transposed14, transposed15, transposed16, transposed17
); 


de_transposer de_t0 (
    coded0, coded1, coded2, coded3, coded4, coded5, coded6, coded7, coded8, coded9, coded10, coded11, coded12, coded13, coded14, coded15, coded16, coded17, 
    de_transposed0, de_transposed1, de_transposed2, de_transposed3, de_transposed4, de_transposed5, de_transposed6, de_transposed7, de_transposed8, de_transposed9, de_transposed10, de_transposed11, de_transposed12, de_transposed13, de_transposed14, de_transposed15, de_transposed16, de_transposed17
); 

extra e (
 crypt,
 transposed0, transposed1, transposed2, transposed3, transposed4, transposed5, transposed6, transposed7, transposed8, transposed9, transposed10, transposed11, transposed12, transposed13, transposed14, transposed15, transposed16, transposed17, 

 de_transposed0, de_transposed1, de_transposed2, de_transposed3, de_transposed4, de_transposed5, de_transposed6, de_transposed7, de_transposed8, de_transposed9, de_transposed10, de_transposed11, de_transposed12, de_transposed13, de_transposed14, de_transposed15, de_transposed16, de_transposed17,

 extra0, extra1, extra2, extra3, extra4, extra5, extra6, extra7, extra8, extra9, extra10, extra11, extra12, extra13, extra14, extra15, extra16, extra17
);

//decode triplets back to original
decoder d0 (extra0, decoded0);
decoder d1 (extra1, decoded1);
decoder d2 (extra2, decoded2);
decoder d3 (extra3, decoded3);
decoder d4 (extra4, decoded4);
decoder d5 (extra5, decoded5);
decoder d6 (extra6, decoded6);
decoder d7 (extra7, decoded7);
decoder d8 (extra8, decoded8);
decoder d9 (extra9, decoded9);
decoder d10 (extra10, decoded10);
decoder d11 (extra11, decoded11);
decoder d12 (extra12, decoded12);
decoder d13 (extra13, decoded13);
decoder d14 (extra14, decoded14);
decoder d15 (extra15, decoded15);
decoder d16 (extra16, decoded16);
decoder d17 (extra17, decoded17);

always @(posedge clk) begin
    if (ready) begin
       done <= 1'b1;
		  
		 cipher0 <= decoded0;
		 cipher1 <= decoded1;
		 cipher2 <= decoded2;
		 cipher3 <= decoded3;
		 cipher4 <= decoded4;
		 cipher5 <= decoded5;
		 cipher6 <= decoded6;
		 cipher7 <= decoded7;
		 cipher8 <= decoded8;
		 cipher9 <= decoded9;
		 cipher10 <= decoded10;
		 cipher11 <= decoded11;
		 cipher12 <= decoded12;
		 cipher13 <= decoded13;
		 cipher14 <= decoded14;
		 cipher15 <= decoded15;
		 cipher16 <= decoded16;
		 cipher17 <= decoded17;
    end
end

endmodule