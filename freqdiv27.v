`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/20 15:32:25
// Design Name: 
// Module Name: freqdiv27
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

module freqdiv27(
    output reg clk_1,        // 1Hz
    output reg [1:0] clk_ctl,        // seven segment display control signal
    output reg clk_5,       // 5Hz
    input clk,
    input rst
    );
       
// 1HZ
    reg [26:0] cnt;
    reg [26:0] cnt_next;
    
always @* begin
    cnt_next = cnt + 27'd1;
    clk_ctl = cnt[17:16];
    end
    
always @(posedge clk or posedge rst)
    if (rst==1) cnt <= 27'd0;
    else if (cnt == 27'd50000000) 
    begin
        cnt <= 27'd0;
        clk_1 <= clk_1 + 1'b1;  
    end
    else cnt <= cnt_next;

// 5HZ
reg [26:0] cnt_5;
reg [26:0] cnt_5_next;

always @* 
    cnt_5_next = cnt_5 + 27'd1;

always @(posedge clk or posedge rst)
    if (rst==1) cnt_5 <= 27'd0;
    else if (cnt_5 == 27'd10000000) begin
         cnt_5 <= 27'd0;
         clk_5 <= clk_5 + 1'b1;  
         end
    else cnt_5 <= cnt_5_next;

endmodule
