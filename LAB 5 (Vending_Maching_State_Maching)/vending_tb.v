module vending_tb ();
    reg clk;
    reg reset, en, val;
    wire pencil, extra, o1,o2,o3,o4,o5,o6;

    initial begin
        clk=0;
        reset = 1;
        en = 0;
        val = 0;
        #4 reset = 0;
        #2 en = 1;
        #7 val = 1;
        #2 val = 0;
    end
vending c(clk, reset, en, val, pencil, extra, o1, o2, o3, o4, o5, o6);
    always #1 clk = ~clk;

endmodule