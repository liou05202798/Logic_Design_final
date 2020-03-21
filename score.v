`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/09 21:45:16
// Design Name: 
// Module Name: score
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


module score(
input apple_valid,
input score_zero,
input rst,
input clk_mode,
input speed,
output reg [3:0]score_digit3,
output reg [3:0]score_digit2,
output reg [3:0]score_digit1,
output reg [3:0]score_digit0
    );

reg[13:0]score, temp_score;

always@*
begin
score_digit0 = score%10;
score_digit1 = (score/10)%10;
score_digit2 = (score/100)%10;
score_digit3 = (score/1000)%10;
end

always@*
if(apple_valid==1 && speed==0)
    temp_score = score + 14'd10;
else if(apple_valid==1 && speed==1)
    temp_score = score + 14'd30;
else if(score_zero == 1)
    temp_score = 0;
else
    temp_score = score;
     
always @(posedge clk_mode or posedge rst)
     if(rst==1) 
         score <= 0;        
     else 
         score <= temp_score;

endmodule
