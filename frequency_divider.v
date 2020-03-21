`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 12:56:20
// Design Name: 
// Module Name: frequency_divider
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


`define DIV_BY_50M 50_000_000
`define DIV_BY_50M_BIT_WIDTH 27
`define DIV_BY_2M 2_000_000
`define DIV_BY_2M_BIT_WIDTH 27
`define DIV_BY_500K 500_000
`define DIV_BY_500K_BIT_WIDTH 20
`define DIV_BY_4M 4_000_000
`define DIV_BY_4M_BIT_WIDTH 27

module frequency_divider(
  clk, // clock from crystal
  rst,
  clk_1, // generated 1 Hz clock
  clk_12_5,
  clk_25, // generated 25 Hz clock
  clk_100, // generated 100 Hz clock
  clk_ctl
);

// Declare I/Os
input clk; // clock from crystal
input rst;
output clk_1; // generated 1 Hz clock
output clk_12_5;
output clk_25;
output clk_100; // generated 100 Hz clock
output [1:0]clk_ctl;

reg clk_1; // generated 1 Hz clock
reg clk_100; // generated 100 Hz clock
reg clk_25;
reg clk_12_5;
reg [1:0]clk_ctl;

// Declare internal nodes
reg [`DIV_BY_50M_BIT_WIDTH-1:0] count_50M, count_50M_next;
reg [`DIV_BY_4M_BIT_WIDTH-1:0] count_4M, count_4M_next;
reg [`DIV_BY_500K_BIT_WIDTH-1:0] count_500K, count_500K_next;
reg [`DIV_BY_2M_BIT_WIDTH-1:0] count_2M, count_2M_next;
reg clk_1_next;
reg clk_12_5_next;
reg clk_25_next;
reg clk_100_next;

// Clock divider for 1 Hz
// Clock Divider: Counter operation
always @*
  if (count_50M == `DIV_BY_50M-1)
  begin
    count_50M_next = `DIV_BY_50M_BIT_WIDTH'd0;
    clk_1_next = ~clk_1;
  end
  else
  begin
    count_50M_next = count_50M + 1'b1;
    clk_1_next = clk_1;
  end

// Counter flip-flops
always @(posedge clk or posedge rst)
  if (rst==1)
  begin
    count_50M <=`DIV_BY_50M_BIT_WIDTH'd0;
    clk_1 <=1'd0;
  end
  else
  begin
    count_50M <= count_50M_next;
    clk_1 <= clk_1_next;
  end

// *********************
// Clock divider for 100 Hz
// *********************
// Clock Divider: Counter operation 
always @*
  if (count_500K == `DIV_BY_500K-1)
  begin
    count_500K_next = `DIV_BY_500K_BIT_WIDTH'd0;
    clk_100_next = ~clk_100;
  end
  else
  begin
    count_500K_next = count_500K + 1'b1;
    clk_100_next = clk_100;
  end


// Counter flip-flops
always @(posedge clk or posedge rst)
  if (rst==1)
  begin
    count_500K <=`DIV_BY_500K_BIT_WIDTH'b0;
    clk_100 <=1'b0;
  end
  else
  begin
    count_500K <= count_500K_next;
    clk_100 <= clk_100_next;
  end

// Clock divider for 25 Hz
// Clock Divider: Counter operation
always @*
  if (count_2M == `DIV_BY_2M-1)
  begin
    count_2M_next = `DIV_BY_2M_BIT_WIDTH'd0;
    clk_25_next = ~clk_25;
  end
  else
  begin
    count_2M_next = count_2M + 1'b1;
    clk_25_next = clk_25;
  end

// Counter flip-flops
always @(posedge clk or posedge rst)
  if (rst==1)
  begin
    count_2M <=`DIV_BY_2M_BIT_WIDTH'd0;
    clk_25 <=1'd0;
  end
  else
  begin
    count_2M <= count_2M_next;
    clk_25 <= clk_25_next;
  end

// Clock divider for 12.5 Hz
// Clock Divider: Counter operation
always @*
  if (count_4M == `DIV_BY_4M-1)
  begin
    count_4M_next = `DIV_BY_4M_BIT_WIDTH'd0;
    clk_12_5_next = ~clk_12_5;
  end
  else
  begin
    count_4M_next = count_4M + 1'b1;
    clk_12_5_next = clk_12_5;
  end

// Counter flip-flops
always @(posedge clk or posedge rst)
  if (rst==1)
  begin
    count_4M <=`DIV_BY_4M_BIT_WIDTH'd0;
    clk_12_5 <=1'd0;
  end
  else
  begin
    count_4M <= count_4M_next;
    clk_12_5 <= clk_12_5_next;
  end

always@*
clk_ctl = {count_50M[17],count_50M[16]};

endmodule

