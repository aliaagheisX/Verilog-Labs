module vending (
    input clk,rst, coin_en, coin_val,
    output reg pencil,extra_mon,
    output wire clk_o, rst_o, en_o, val_o, p_o, m_o
    
);

localparam IDLE = 0;
localparam coin_in = 1;
localparam out = 2;
assign clk_o = clk;
assign rst_o = rst;
assign en_o = coin_en;
assign val_o = coin_val;
assign p_o = pencil;
assign m_o = extra_mon;

reg [1:0] state ;
//reg [1:0]state_next ;
reg [5:0] coins;
always @(posedge clk, posedge rst) begin

    if(rst) begin
        state=IDLE;
        coins = 0;
        pencil = 0;
        extra_mon = 0;
end
else begin
    
        case (state)
        IDLE: begin
            pencil = 0;
            extra_mon = 0;
            if(coin_en) state = coin_in; 
            else state = IDLE;
        end
        coin_in: begin
            if(coin_val) coins = coins + 10;
            else coins = coins +5;
            
            if(coins >= 15) state = out;
            else if(!coin_en) state = IDLE;
            else state = coin_in;
        end
        out: begin
            extra_mon = (coins > 15) ? 1 : 0;
            pencil = 1;
            coins = 0;
            state = IDLE;
        end

        default: 
            state = IDLE;
    endcase
end	 
end
/* 
always @(state, coin_en, coin_val ) begin
    case (state)
        IDLE: begin
            if(coin_en) state_next = coin_in; 
            else state_next = IDLE;
        end
        coin_in: begin
            if(coins >= 15) state_next = out;
            else if(!coin_en) state_next = IDLE;
            else state_next = coin_in;
        end
        out: begin
            state_next = IDLE;
        end

        default: 
            state_next = IDLE;
    endcase
end */
endmodule