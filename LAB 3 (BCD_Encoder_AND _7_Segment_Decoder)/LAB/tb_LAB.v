module tb_LAB();
reg [3:0] ain;
reg [3:0] bin;
reg cin;
wire [6:0] T,O,H;
initial begin
    ain = 8'b0000_0000;
    bin = 8'b0000_0010;
    #25 $finish;
end

always #1 ain = ain + 1;
LAB e(
    .A(ain),
    .B(bin),
    .cin(cin),
    .T(T),
    .O(O)
);

endmodule