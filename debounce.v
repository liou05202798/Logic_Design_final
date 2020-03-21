`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 12:48:39
// Design Name: 
// Module Name: debounce
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


`define DEBOUNCE_WINDOW_SIZE 4
module debounce(
  clk, // clock control
  rst, // reset
  pb_in, //push button input
  pb_debounced // debounced push button output
);

// declare the I/Os
input clk; // clock control
input rst; // reset
input pb_in; //push button input
output pb_debounced; // debounced push button output
reg pb_debounced; // debounced push button output

// declare the internal nodes
reg [`DEBOUNCE_WINDOW_SIZE-1:0] debounce_window; // shift register flip flop
reg pb_debounced_next; // debounce result

// Shift register
always @(posedge clk or posedge rst)
  if (rst==1)
    debounce_window <= `DEBOUNCE_WINDOW_SIZE'd0;
  else
    debounce_window <= {debounce_window[`DEBOUNCE_WINDOW_SIZE-2:0],pb_in}; 

// debounce circuit
always @*
  if (debounce_window == `DEBOUNCE_WINDOW_SIZE'b1111) 
    pb_debounced_next = 1'b1;
  else
    pb_debounced_next = 1'b0;

always @(posedge clk or posedge rst)
  if (rst==1)
    pb_debounced <= 1'b0;
  else
    pb_debounced <= pb_debounced_next;
	 
endmodule


