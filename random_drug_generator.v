`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/20 13:30:33
// Design Name: 
// Module Name: random_drug_generator
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


module random_drug_generator(
input clk,
input rst,
input drug_valid,
input one_start,
output reg[4:0]drug_x,
output reg[4:0]drug_y
    );
    
reg in, r1, r2, r3, r4, r5, r6, r7, r8;
reg [8:0]temp_sum, sum;

always@(posedge clk or posedge rst)
if(rst==1)
  begin
    in <= 0;
    r1 <= 0;
    r2 <= 0;
    r3 <= 1;
    r4 <= 0;
    r5 <= 0;
    r6 <= 0;
    r7 <= 1;
    r8 <= 0;
  end

else
  begin
    in <= r7 ^ r8;
    r1 <= in;
    r2 <= r1;
    r3 <= r2;
    r4 <= r3;
    r5 <= r4;
    r6 <= r5;
    r7 <= r6;
    r8 <= r7;
  end
  
always@*
if(drug_valid==1 || rst==1)
  temp_sum = {r8,r7,r6,r5,r4,r3,r2,r1,in};
else
  temp_sum = sum;

always@(posedge clk or posedge rst)
if(rst==1)
    sum <= 6'd40;
else
    sum <= temp_sum;

always@* 
begin
drug_x = sum%32;
drug_y = sum%24;
end

endmodule

