module Randomizer (clk, reset, load,in, en, vect,out);

input clk, reset, en, load, in;
input [14:0] vect;
output reg out;


reg [14:0] play ;
reg feedback;



always @(posedge clk ,posedge  reset)begin
	 if(reset == 1'b1) play <= 15'b011_0111_0001_0101; 
	 else begin
		 if(load)  play<= vect;

		 
		 else if(en) begin
			  out <= in ^ play[0] ^ play[1];
			  //$display("play before: %b feedback: %b input: %b out: %b", play, feedback,in, out);

			  play <= play>> 1;
			  play[14] <= play[0] ^ play[1]; 

		 end


	end
end


endmodule

/* 


reset= 1 => out = 0 
enable=1 normal
      =0 old
load =1 inital value vector
     =0 normal
 */

