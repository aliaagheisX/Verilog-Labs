module LAB (
    input [3:0] A,
    input [3:0] B,
    input cin,

    output [6:0] T,
    output [6:0] O
);
wire [4:0] sum;
 wire [6:0] H;
Adder a(
    .X(A),
    .Y(B),
    .cin(cin),
    .sum({sum[3],sum[2],sum[1],sum[0]}),

    .cout(sum[4])
);
wire [3:0] hunderds,tens,ones;
Encoder e(
	.a({3'b000, sum}),
	.H(hunderds),
	.T(tens),
	.O(ones)
);

SSD sH(
    .bcd(hunderds),
    .seg(H)
);

SSD sT(
    .bcd(tens),
    .seg(T)
);

SSD sO(
    .bcd(ones),
    .seg(O)
);

endmodule