`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2022 14:45:26
// Design Name: 
// Module Name: detector
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module detector(clk,reset,w,z);
input wire clk,reset,w;
output reg z;

parameter[3:0] S0=4'b0000;
parameter[3:0] S01=4'b0001;
parameter[3:0] S02=4'b0010;
parameter[3:0] S03=4'b0011;
parameter[3:0] S04=4'b0100;
parameter[3:0] S11=4'b0101;
parameter[3:0] S12=4'b0110;
parameter[3:0] S13=4'b0111;
parameter[3:0] S14=4'b1000;

reg[3:0] current_state;
reg[3:0] next_state;

always@(posedge clk)
    begin
        if(reset ==1)
            current_state <= S0;
        else
            current_state <= next_state;
    end
    
always@(w,current_state)
begin
case(current_state)
    S0 : begin
            if(w== 1'b0)
                next_state <= S01 ;
            else
                next_state <= S11;
         end
         
    S01 : begin
            if(w== 1'b0)
                next_state <= S02 ;
            else
                next_state <= S11;
         end
         
    S02 : begin
            if(w== 1'b0)
                next_state <= S03 ;
            else
                next_state <= S11;
         end
         
    S03 : begin
            if(w== 1'b0)
                next_state <= S04 ;
            else
                next_state <= S11;
         end
    S04 : begin
            if(w== 1'b0)
                next_state <= S04 ;
            else
                next_state <= S11;
         end
    S11 : begin
            if(w== 1'b0)
                next_state <= S01 ;
            else
                next_state <= S12;
         end
         
    S12 : begin
            if(w== 1'b0)
                next_state <= S01 ;
            else
                next_state <= S13;
         end
         
    S13 : begin
            if(w== 1'b0)
                next_state <= S01 ;
            else
                next_state <= S14;
         end
     S14 : begin
            if(w== 1'b0)
                next_state <= S01 ;
            else
                next_state <= S14;
         end
    default : next_state <= S0;
endcase
end

always@(current_state)
begin
case(current_state)
    S0 : z <=0;
    S01 : z <=0;
    S02 : z <=0;
    S03 : z <=0;
    S04 : z <=1;
    S11 : z <=0;
    S12 : z <=0;
    S13 : z <=0;
    S14 : z <=1;
    default : z<= 0;
endcase
end
    
endmodule
