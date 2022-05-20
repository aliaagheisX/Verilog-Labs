module mux(X, Y, S, out);
input X, Y, S;
output wire out;

assign out = S ? Y : X;
endmodule