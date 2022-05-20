module SSD_tb();
reg [3:0] bcd;
wire [6:0] seg;
integer i;
SSD s(bcd,seg);
initial begin 
for(i=0;i<10;i=i+1)
begin
bcd=i;
#10;
end
end
endmodule
