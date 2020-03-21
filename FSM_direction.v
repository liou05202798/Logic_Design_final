`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 12:32:09
// Design Name: 
// Module Name: FSM_direction
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
`define UP 3'b000
`define DOWN 3'b001
`define LEFT 3'b010
`define RIGHT 3'b011

module FSM_direction(
input clk, 
input rst,
input one_up,
input one_down,
input one_left,
input one_right,
input one_start,
input gameover,
input clk_1,
input opposite,
output reg [2:0]direction,
output reg gaming,
output reg score_zero,
output reg LED_play,
output reg [1:0]state2
    );
    
reg [2:0]state, next_state;
reg [1:0]next_state2;

//direction
always@*
case(state)

`UP:
    if(gaming==1 && one_left == 1 && opposite==0)
      begin
        next_state = `LEFT;
        direction = `LEFT;
      end  
    else if(gaming==1 && one_right == 1 && opposite==0)
      begin
        next_state = `RIGHT;
        direction = `RIGHT;
      end
    else if(gaming==1 && one_left == 1 && opposite==1)
      begin
         next_state = `RIGHT;
         direction = `RIGHT;
      end
    else if(gaming==1 && one_right == 1 && opposite==1)
      begin
         next_state = `LEFT;
         direction = `LEFT;
      end
    else
      begin
        next_state = `UP;
        direction = `UP;
      end

`DOWN:
    if(gaming==1 && one_left == 1 && opposite==0)
      begin
        next_state = `LEFT;
        direction = `LEFT;
      end  
    else if(gaming==1 && one_right == 1 && opposite==0)
      begin
        next_state = `RIGHT;
        direction = `RIGHT;
      end
    else if(gaming==1 && one_left == 1 && opposite==1)
      begin
         next_state = `RIGHT;
         direction = `RIGHT;
      end
    else if(gaming==1 && one_right == 1 && opposite==1)
        begin
           next_state = `LEFT;
           direction = `LEFT;
        end
    else
      begin
        next_state = `DOWN;
        direction = `DOWN;
      end
      
`LEFT: //left
          if(gaming==1 && one_up == 1 && opposite==0)
            begin
              next_state = `UP;
              direction = `UP;
            end
          else if(gaming==1 && one_down == 1 && opposite==0)
            begin
              next_state = `DOWN;
              direction = `DOWN;
            end  
          else if(gaming==1 && one_up == 1 && opposite==1)
            begin
              next_state = `DOWN;
              direction = `DOWN;
            end
          else if(gaming==1 && one_down == 1 && opposite==1)
            begin
               next_state = `UP;
               direction = `UP;
            end
          else 
            begin
               next_state = `LEFT;
               direction = `LEFT;
            end

`RIGHT: //right
                if(gaming==1 && one_up == 1 && opposite==0)
                  begin
                    next_state = `UP;
                    direction = `UP;
                  end
                else if(gaming==1 && one_down == 1 && opposite==0)
                  begin
                    next_state = `DOWN;
                    direction = `DOWN;
                  end  
                else if(gaming==1 && one_up == 1 && opposite==1)
                  begin
                    next_state = `DOWN;
                    direction = `DOWN;
                  end
               else if(gaming==1 && one_down == 1 && opposite==1)
                  begin
                    next_state = `UP;
                    direction = `UP;
                  end
               else
                  begin
                    next_state = `RIGHT;
                    direction = `RIGHT;
                  end
default:
                if(gaming==1 && one_up == 1 && opposite==0)
                  begin
                    next_state = `UP;
                    direction = `UP;
                  end
                else if(gaming==1 && one_down == 1 && opposite==0)
                  begin
                    next_state = `DOWN;
                    direction = `DOWN;
                  end  
                else if(gaming==1 && one_up == 1 && opposite==1)
                  begin
                    next_state = `DOWN;
                    direction = `DOWN;
                  end
               else if(gaming==1 && one_down == 1 && opposite==1)
                  begin
                    next_state = `UP;
                    direction = `UP;
                  end
               else
                  begin
                    next_state = `RIGHT;
                    direction = `RIGHT;
                  end                                             
endcase

always@(posedge clk or posedge rst)
if(rst==1 || gameover==1)
  state <= 3'b011;
else
  state <= next_state;

//start
always@*
case(state2)
2'b00: 
    if(one_start==1)
       begin
         next_state2 = 2'b01;
         gaming = 1'b1;
         score_zero = 1'b0;
       end   
    else
       begin
         next_state2 = 2'b00;
         gaming = 1'b0;
         score_zero = 1'b1;
       end      
2'b01: //playing
    if(gameover==1)
          begin
            next_state2 = 2'b10;
            gaming = 1'b0;
            score_zero = 1'b0;
          end   
       else
          begin
            next_state2 = 2'b01;
            gaming = 1'b1;
            score_zero = 1'b0;
          end 
2'b10: //Fail and score
    if(one_start==1)
      begin
        next_state2 = 2'b00;
        gaming = 1'b0;
        score_zero = 1'b1;
      end
    else
      begin
        next_state2 = 2'b10;
        gaming = 1'b0;
        score_zero = 1'b0;
      end
 
endcase
     
always@(posedge clk or posedge rst)
          if(rst==1)
            state2 <= 0;
          else
            state2 <= next_state2;            

always@*
if(state2==2'b10)
   LED_play=clk_1;
else
   LED_play=0;
   
endmodule
