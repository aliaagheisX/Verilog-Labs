module wrapper(clk, load, reset, led_ON_OFF);

wire [95:0] inp = 96'hACBCD2114DAE1577C6DBF4C9;
wire [95:0] checkOutput = 96'h558AC4A53A1724E163AC2BF9;
reg [14:0] vect = 15'b011_0111_0001_0101;

input clk, load, reset;
output reg led_ON_OFF;

reg [95:0]outp  ;
wire out;
reg  enable, in;
integer i;
initial begin
    enable = 1;
    i = 95;
end

always @(posedge clk ) begin		
    outp[i+1] = out;
    if(reset == 1'b1 || load == 1'b1) begin
		i = 95;
		led_ON_OFF = 1'b0;
		end
    else if(enable == 1'b1 && load == 1'b0 ) i = (i >= 0) ? i-1 : i;
    if(i < 0) begin
        led_ON_OFF = outp==checkOutput;

        enable = 0;
    
    end 
    else begin
        led_ON_OFF = led_ON_OFF;
        enable = 1;
    end
end

Randomizer rand(clk,reset,load,inp[i],enable, vect, out);

endmodule