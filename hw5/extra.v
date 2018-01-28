module extra (
    input crypt,
    input [5:0] transposed0,
    input [5:0] transposed1,
    input [5:0] transposed2,
    input [5:0] transposed3,
    input [5:0] transposed4,
    input [5:0] transposed5,
    input [5:0] transposed6,
    input [5:0] transposed7,
    input [5:0] transposed8,
    input [5:0] transposed9,
    input [5:0] transposed10,
    input [5:0] transposed11,
    input [5:0] transposed12,
    input [5:0] transposed13,
    input [5:0] transposed14,
    input [5:0] transposed15,
    input [5:0] transposed16,
    input [5:0] transposed17,
    input [5:0] de_transposed0,
    input [5:0] de_transposed1,
    input [5:0] de_transposed2,
    input [5:0] de_transposed3,
    input [5:0] de_transposed4,
    input [5:0] de_transposed5,
    input [5:0] de_transposed6,
    input [5:0] de_transposed7,
    input [5:0] de_transposed8,
    input [5:0] de_transposed9,
    input [5:0] de_transposed10,
    input [5:0] de_transposed11,
    input [5:0] de_transposed12,
    input [5:0] de_transposed13,
    input [5:0] de_transposed14,
    input [5:0] de_transposed15,
    input [5:0] de_transposed16,
    input [5:0] de_transposed17,
    output reg [5:0] extra0,
    output reg [5:0] extra1,
    output reg [5:0] extra2,
    output reg [5:0] extra3,
    output reg [5:0] extra4,
    output reg [5:0] extra5,
    output reg [5:0] extra6,
    output reg [5:0] extra7,
    output reg [5:0] extra8,
    output reg [5:0] extra9,
    output reg [5:0] extra10,
    output reg [5:0] extra11,
    output reg [5:0] extra12,
    output reg [5:0] extra13,
    output reg [5:0] extra14,
    output reg [5:0] extra15,
    output reg [5:0] extra16,
    output reg [5:0] extra17
);


always @ (*) begin
if (~crypt) begin
	extra0 <= transposed0; 
    extra1 <= transposed1; 
    extra2 <= transposed2; 
    extra3 <= transposed3; 
    extra4 <= transposed4; 
    extra5 <= transposed5; 
    extra6 <= transposed6; 
    extra7 <= transposed7; 
    extra8 <= transposed8; 
    extra9 <= transposed9; 
    extra10 <= transposed10; 
    extra11 <= transposed11; 
    extra12 <= transposed12; 
    extra13 <= transposed13; 
    extra14 <= transposed14; 
    extra15 <= transposed15; 
    extra16 <= transposed16; 
    extra17 <= transposed17;
end else begin 
    extra0 <= de_transposed0; 
    extra1 <= de_transposed1; 
    extra2 <= de_transposed2; 
    extra3 <= de_transposed3; 
    extra4 <= de_transposed4; 
    extra5 <= de_transposed5; 
    extra6 <= de_transposed6; 
    extra7 <= de_transposed7; 
    extra8 <= de_transposed8; 
    extra9 <= de_transposed9; 
    extra10 <= de_transposed10; 
    extra11 <= de_transposed11; 
    extra12 <= de_transposed12; 
    extra13 <= de_transposed13; 
    extra14 <= de_transposed14; 
    extra15 <= de_transposed15; 
    extra16 <= de_transposed16; 
    extra17 <= de_transposed17;
end end
endmodule