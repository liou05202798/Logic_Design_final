`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/09 20:43:00
// Design Name: 
// Module Name: upcounter
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


module upcounter(
	value,		// counter value
	carry,		
	clk,
	rst,
	increase, 	
	limit,
	gaming,
	score_zero			
);

output [3:0] value;
output carry;
input clk, rst, increase, gaming, score_zero;
input [3:0] limit;

reg [3:0] value;
reg [3:0] value_tmp;	
reg carry;

always @*
	if ((gaming==1 && (value == limit) && increase))	
		begin
			value_tmp = 4'd0;	// insert smallest num
			carry = 1'b1;		// tell upper digit increase
		end
	else if (gaming==1 && increase==1'b1) 		
		begin
			value_tmp = value + 1'b1;	// increase
			carry = 1'b0;		
		end
    else if(score_zero==1)
        begin
            value_tmp = 4'd0;
            carry = 1'b0;
        end
	else 
		begin
			value_tmp = value;	// keep same num
			carry = 1'b0;		
		end



always @(posedge clk or posedge rst)
if(rst==1) 
    value <= 0;		
else 
	value <= value_tmp;

endmodule
