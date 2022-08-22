`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.08.2022 15:24:59
// Design Name: 
// Module Name: detector_tb
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


module detector_tb();
reg clk,w,reset;
wire z;
detector uut(.clk(clk),.reset(reset),.w(w),.z(z));
initial clk=0;
always #10 clk = ~clk ;

initial begin
    reset = 1; #20;
    reset = 0; w=0 ; #40;
    w = 1; #20;
    w = 0; #80;
    w=1 ; #20; 
    w=1 ; #20;
    w=1 ; #20;
    w=1 ; #20;
    w=1 ; #20;
    w=0; #20;
end
    
endmodule
