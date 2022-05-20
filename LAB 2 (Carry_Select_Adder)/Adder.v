

module Adder(
    input [3 : 0]X,
    input [3 : 0]Y,
    input cin,
    output wire [3:0]sum,
    output wire cout
);

wire [3:0] S1;
wire [3:0] C1;
wire [3:0] S2;
wire [3:0] C2;

wire [2:0] carry;

full_adder f0 (Y[0], X[0], 1'b0, S1[0], C1[0]);
full_adder f1 (Y[1], X[1], 1'b0, S1[1], C1[1]);
full_adder f2 (Y[2], X[2], 1'b0, S1[2], C1[2]);
full_adder f3 (Y[3], X[3], 1'b0, S1[3], C1[3]);


full_adder f00 (Y[0], X[0], 1'b1, S2[0], C2[0]);
full_adder f01 (Y[1], X[1], 1'b1, S2[1], C2[1]);
full_adder f02 (Y[2], X[2], 1'b1, S2[2], C2[2]);
full_adder f03 (Y[3], X[3], 1'b1, S2[3], C2[3]);

mux c0(C1[0], C2[0], cin, carry[0]);
mux c1(C1[1], C2[1],carry[0], carry[1]);
mux c2(C1[2], C2[2],carry[1], carry[2]);
mux c3(C1[3], C2[3],carry[2], cout);


mux mux1(S1[0], S2[0], cin, sum[0]);
mux mux2(S1[1], S2[1], carry[0], sum[1]);
mux mux3(S1[2], S2[2], carry[1], sum[2]);
mux mux4(S1[3], S2[3], carry[2], sum[3]);


endmodule