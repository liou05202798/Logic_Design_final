`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 12:48:56
// Design Name: 
// Module Name: one_pulse
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


module one_pulse(
  clk,  // clock input
  rst, //active low reset
  in_trig, // input trigger
  out_pulse // output one pulse 
);

// Declare I/Os
input clk;  // clock input
input rst; //active low reset
input in_trig; // input trigger
output out_pulse; // output one pulse 
reg out_pulse; // output one pulse 

// Declare internal nodes
reg in_trig_delay;

// Buffer input 
always @(posedge clk or posedge rst)
  if (rst==1)
    in_trig_delay <= 1'b0; 
  else
    in_trig_delay <= in_trig;

// Pulse generation
assign out_pulse_next = in_trig & (~in_trig_delay);

always @(posedge clk or posedge rst)
  if (rst==1)
    out_pulse <=1'b0;
  else
    out_pulse <= out_pulse_next;

endmodule

