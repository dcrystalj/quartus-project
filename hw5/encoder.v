module encoder (
    input [7:0] data,
    output reg [5:0] cipher
);

//SIMPLIFICATION/CONVERSION TABLE:
//1 = 00
//2 = 01
//3 = 10
//
//so A == 332 on wikipedia goes to [10 10 01] by looking in table
always @(data)
    case (data)
        8'b01000001: cipher = 6'b101001; //A = 332
        8'b01000010: cipher = 6'b000110; //B = 123
        8'b01000011: cipher = 6'b001001; //C = 132
        8'b01000100: cipher = 6'b010101; //D = 222
        8'b01000101: cipher = 6'b100000; //E = 311
        8'b01000110: cipher = 6'b000000; //F = 111
        8'b01000111: cipher = 6'b010001; //G = 212
        8'b01001000: cipher = 6'b100101; //H = 322
        8'b01001001: cipher = 6'b101010; //I = 333
        8'b01001010: cipher = 6'b000100; //J = 121
        8'b01001011: cipher = 6'b100110; //K = 323
        8'b01001100: cipher = 6'b011000; //L = 231
        8'b01001101: cipher = 6'b010010; //M = 213
        8'b01001110: cipher = 6'b100001; //N = 312
        8'b01001111: cipher = 6'b001000; //O = 131
        8'b01010000: cipher = 6'b011001; //P = 232
        8'b01010001: cipher = 6'b101000; //Q = 331
        8'b01010010: cipher = 6'b000001; //R = 112
        8'b01010011: cipher = 6'b001010; //S = 133
        8'b01010100: cipher = 6'b011010; //T = 233
        8'b01010101: cipher = 6'b100100; //U = 321
        8'b01010110: cipher = 6'b010000; //V = 211
        8'b01010111: cipher = 6'b010110; //W = 223
        8'b01011000: cipher = 6'b000101; //X = 122
        8'b01011001: cipher = 6'b000010; //Y = 113
        8'b01011010: cipher = 6'b010100; //Z = 221
        default:     cipher = 6'b100010; //. = 313
    endcase

endmodule

