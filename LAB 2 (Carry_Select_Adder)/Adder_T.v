module adder_T;

reg[3:0] X;
reg[3:0] Y;
reg cin;

wire[3:0] sum;
wire cout;

Adder add(
    .X(X),
    .Y(Y),
    .cin(cin),
    .sum(sum),
    .cout(cout)
);


initial begin
    X = 4'b0000;
    Y = 4'b0000;
    #2 X = 4'b1111;
    Y = 4'b1111;
    #2 X = 4'b0010;
    Y= 4'b0011;

    #2 X = 4'b1111;
    Y= 4'b0001;

    #2 X = 4'b1001;
    Y= 4'b0110;
end
endmodule