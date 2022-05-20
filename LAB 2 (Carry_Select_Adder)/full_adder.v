module full_adder (
    input Y,
    input X,
    input cin,
    output wire sum,
    output wire carry
);
assign {carry, sum} = X + Y + cin;
endmodule