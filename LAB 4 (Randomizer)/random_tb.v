module random_tb(output reg led_ON_OFF);

wire [95:0] inp = 96'hACBCD2114DAE1577C6DBF4C9;
wire [95:0] checkOutput = 96'h558AC4A53A1724E163AC2BF9;
reg [14:0] vect = 15'b011_0111_0001_0101;
reg [95:0]outp  ;
wire out;
reg reset, en, load, in;
reg clk;
reg bool;
integer i;
initial begin
    reset = 0;
    en = 1;
    i = 95;

    clk = 0;
    load = 1;
end

always #5 clk = ~clk;

always @(posedge clk) begin
    load = 0;
    outp[i+1] = out;
    if(i < 0) begin
        if(outp==checkOutput) begin
            led_ON_OFF = 1;
            $display("woooooooooh");
        end
        else begin
            led_ON_OFF = 0;
            $display("NOOOOOOOOOOOOOOOOOOOOOOOh");
        end
        $finish;
    end
    i = (i >= 0) ? i-1 : i;
end


Randomizer rand(clk,reset,load,inp[i],en, vect, out);

endmodule