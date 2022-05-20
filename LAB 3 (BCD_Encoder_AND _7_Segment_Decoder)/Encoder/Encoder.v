module Encoder (
    input [7:0] a,
    output [3:0] H,
    output [3:0] T,
    output [3:0] O
);
wire [3:0] out1, out2, out3, out4,out5,out6, out7;

macro m1(
    .in({1'b0,a[7],a[6],a[5]}),
    .out(out1)
);
macro m2(
    .in({out1[2],out1[1],out1[0],a[4]}),
    .out(out2)
);
macro m3(
    .in({out2[2],out2[1],out2[0],a[3]}),
    .out(out3)
);

macro m4(
    .in({out3[2],out3[1],out3[0],a[2]}),
    .out(out4)
);

macro m5(
    .in({1'b0,out1[3],out2[3],out3[3]}),
    .out(out5)
);


macro m6(
    .in({out4[2],out4[1],out4[0], a[1]}),
    .out(out6)
);

macro m7(
    .in({out5[2],out5[1],out5[0], out4[3]}),
    .out(out7)
);
assign H = {1'b0,1'b0, out5[3], out7[3]};
assign T = {out7[2], out7[1], out7[0], out6[3]};
assign O = {out6[2], out6[1], out6[0], a[0]};



endmodule