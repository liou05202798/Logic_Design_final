`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/09 21:09:37
// Design Name: 
// Module Name: time_of_playing
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


module time_of_playing(
input gaming,
input score_zero,
input clk,
input rst,
output [3:0]digit3,
output [3:0]digit2,
output [3:0]digit1,
output [3:0]digit0
    );
    
wire carry0, carry1, carry2, carry3;

upcounter up0(
.value(digit0),
.carry(carry0),		
.clk(clk),
.rst(rst),
.increase(1'b1), 	
.limit(4'd9),
.gaming(gaming),
.score_zero(score_zero)	
);

upcounter up1(
.value(digit1),
.carry(carry1),		
.clk(clk),
.rst(rst),
.increase(carry0), 	
.limit(4'd5),
.gaming(gaming),
.score_zero(score_zero)	
);

upcounter up2(
.value(digit2),
.carry(carry2),		
.clk(clk),
.rst(rst),
.increase(carry1), 	
.limit(4'd9),
.gaming(gaming),
.score_zero(score_zero)	
);

upcounter up3(
.value(digit3),
.carry(carry3),		
.clk(clk),
.rst(rst),
.increase(carry2), 	
.limit(4'd5),
.gaming(gaming),
.score_zero(score_zero)	
);

endmodule

