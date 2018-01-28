module transposer (
    input [5:0] data0,
    input [5:0] data1,
    input [5:0] data2,
    input [5:0] data3,
    input [5:0] data4,
    input [5:0] data5,
    input [5:0] data6,
    input [5:0] data7,
    input [5:0] data8,
    input [5:0] data9,
    input [5:0] data10,
    input [5:0] data11,
    input [5:0] data12,
    input [5:0] data13,
    input [5:0] data14,
    input [5:0] data15,
    input [5:0] data16,
    input [5:0] data17,
    output reg [5:0] out0,
    output reg [5:0] out1,
    output reg [5:0] out2,
    output reg [5:0] out3,
    output reg [5:0] out4,
    output reg [5:0] out5,
    output reg [5:0] out6,
    output reg [5:0] out7,
    output reg [5:0] out8,
    output reg [5:0] out9,
    output reg [5:0] out10,
    output reg [5:0] out11,
    output reg [5:0] out12,
    output reg [5:0] out13,
    output reg [5:0] out14,
    output reg [5:0] out15,
    output reg [5:0] out16,
    output reg [5:0] out17
);

//rewire columns to rows

always @(*) begin
    out0 <= {data0[5:4], data1[5:4], data2[5:4]};
    out1 <= {data3[5:4], data4[5:4], data5[5:4]};
    out2 <= {data6[5:4], data7[5:4], data8[5:4]};
    out3 <= {data9[5:4], data10[5:4], data11[5:4]};
    out4 <= {data12[5:4], data13[5:4], data14[5:4]};
    out5 <= {data15[5:4], data16[5:4], data17[5:4]};

    out6 <= {data0[3:2], data1[3:2], data2[3:2]};
    out7 <= {data3[3:2], data4[3:2], data5[3:2]};
    out8 <= {data6[3:2], data7[3:2], data8[3:2]};
    out9 <= {data9[3:2], data10[3:2], data11[3:2]};
    out10<= {data12[3:2], data13[3:2], data14[3:2]};
    out11<= {data15[3:2], data16[3:2], data17[3:2]};

    out12 <= {data0[1:0], data1[1:0], data2[1:0]};
    out13 <= {data3[1:0], data4[1:0], data5[1:0]};
    out14 <= {data6[1:0], data7[1:0], data8[1:0]};
    out15 <= {data9[1:0], data10[1:0], data11[1:0]};
    out16<= {data12[1:0], data13[1:0], data14[1:0]};
    out17<= {data15[1:0], data16[1:0], data17[1:0]};
end

endmodule