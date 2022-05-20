module wrapper_tb (
    
);

reg clk, load, reset;
wire led;

initial begin
    clk=0;
    load=0;
    reset = 1;  
    #100 reset = 0; 
    #10 load = 1;
	 #10 load = 0;
	 #1000 reset = 1;
	 #100 reset = 0; 
    #10 load = 1;
	 #10 load = 0; 
end
    
always #5 clk = ~clk;

wrapper w(clk, load, reset, led);
endmodule
