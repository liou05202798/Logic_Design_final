`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/09 21:17:31
// Design Name: 
// Module Name: display
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
`define SSD_ZERO   8'b0000_0011 // 0
`define SSD_ONE    8'b1001_1111 // 1
`define SSD_TWO    8'b0010_0101 // 2
`define SSD_THREE  8'b0000_1101 // 3
`define SSD_FOUR   8'b1001_1001 // 4
`define SSD_FIVE   8'b0100_1001 // 5
`define SSD_SIX    8'b0100_0001 // 6
`define SSD_SEVEN  8'b0001_1111 // 7
`define SSD_EIGHT  8'b0000_0001 // 8
`define SSD_NINE   8'b0000_1001 // 9

module display(
input [3:0]binary,
output reg [7:0]segs
    );
    
always@*
  case(binary)
  4'd0: segs = `SSD_ZERO;
  4'd1: segs = `SSD_ONE;
  4'd2: segs = `SSD_TWO;
  4'd3: segs = `SSD_THREE;
  4'd4: segs = `SSD_FOUR;
  4'd5: segs = `SSD_FIVE;
  4'd6: segs = `SSD_SIX;
  4'd7: segs = `SSD_SEVEN;
  4'd8: segs = `SSD_EIGHT;
  4'd9: segs = `SSD_NINE;
  default: segs = `SSD_ZERO;
 endcase
 
endmodule
