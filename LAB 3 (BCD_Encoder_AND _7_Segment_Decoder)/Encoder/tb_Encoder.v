module tb_Encoder();
reg [7:0] ain;
wire [3:0] ht,ot,tt;
initial begin
    ain = 8'b0000_0000;
    #25 $finish;
end

always #1 ain = ain + 1;
Encoder e(
    .a(ain),
    .H(ht),
    .T(tt),
    .O(ot)
);

endmodule