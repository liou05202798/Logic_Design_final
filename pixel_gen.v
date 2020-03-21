module pixel_gen(
  input [9:0] h_cnt,
  input [9:0] v_cnt,
  input [2:0]direction,
  input gaming,
  input clk,
  input rst,
  input [4:0]apple_x,
  input [4:0]apple_y,
  input [4:0]drug_x,
  input [4:0]drug_y,
  input valid,
  output reg [3:0] vgaRed,
  output reg [3:0] vgaGreen,
  output reg [3:0] vgaBlue,
  output reg gameover,
  output reg apple_valid,
  output reg drug_valid,
  output reg opposite,
  output reg apple_conflict
);

reg [11:0]vga_RGB;
reg [5:0]x, y, x1, y1, x2, y2, x3, y3, x4, y4, x5, y5, x6, y6, x7, y7, x8, y8, x9, y9, x10, y10, x11, y11, x12, y12, x13, y13, x14, y14, x15, y15, x16, y16, x17, y17, x18, y18, x19, y19, x20 ,y20, x21, y21, x22, y22, x23, y23, x24, y24, x25, y25, x26, y26, x27, y27, x28, y28, x29, y29, x30, y30;
reg [5:0]temp_x, temp_y;
reg [5:0]x_axis, y_axis;
reg [5:0]head_x, head_y;
reg [4:0]length, temp_length;
reg temp_opposite;
reg unplay;

//X-Y, position of head
always@*
begin
x_axis = h_cnt/10'd20;
y_axis = v_cnt/10'd20;
head_x = x;
head_y = y;
end

//color
always@*
if(!valid)
    vga_RGB = 12'h000;
else if((x_axis == x) && (y_axis == y)) //snake head
    vga_RGB = 12'h0F0;
    
else if((x_axis == x1) && (y_axis == y1)) //body1
case(gameover)
1'b0:
  case(length)
      5'd1: vga_RGB = 12'h000;
      5'd2: vga_RGB = 12'h0F0;
      5'd3: vga_RGB = 12'h0F0;
      5'd4: vga_RGB = 12'h0F0;
      5'd5: vga_RGB = 12'h0F0;
      5'd6: vga_RGB = 12'h0F0;
      5'd7: vga_RGB = 12'h0F0;
      5'd8: vga_RGB = 12'h0F0;
      5'd9: vga_RGB = 12'h0F0;
      5'd10: vga_RGB = 12'h0F0;
      5'd11: vga_RGB = 12'h0F0;
      5'd12: vga_RGB = 12'h0F0;
      5'd13: vga_RGB = 12'h0F0;
      5'd14: vga_RGB = 12'h0F0;
      5'd15: vga_RGB = 12'h0F0;
      5'd16: vga_RGB = 12'h0F0;
      5'd17: vga_RGB = 12'h0F0;
      5'd18: vga_RGB = 12'h0F0;
      5'd19: vga_RGB = 12'h0F0;
      5'd20: vga_RGB = 12'h0F0;
      5'd21: vga_RGB = 12'h0F0;
      5'd22: vga_RGB = 12'h0F0;
      5'd23: vga_RGB = 12'h0F0;
      5'd24: vga_RGB = 12'h0F0;
      5'd25: vga_RGB = 12'h0F0;
      5'd26: vga_RGB = 12'h0F0;
      5'd27: vga_RGB = 12'h0F0;
      5'd28: vga_RGB = 12'h0F0;
      5'd29: vga_RGB = 12'h0F0;
      5'd30: vga_RGB = 12'h0F0;
      5'd31: vga_RGB = 12'h0F0;
      default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x2) && (y_axis == y2)) //body2
case(gameover)
1'b0:
  case(length)
    5'd1: vga_RGB = 12'h000;
    5'd2: vga_RGB = 12'h000;
    5'd3: vga_RGB = 12'h0F0;
    5'd4: vga_RGB = 12'h0F0;
    5'd5: vga_RGB = 12'h0F0;
    5'd6: vga_RGB = 12'h0F0;
    5'd7: vga_RGB = 12'h0F0;
    5'd8: vga_RGB = 12'h0F0;
    5'd9: vga_RGB = 12'h0F0;
    5'd10: vga_RGB = 12'h0F0;
    5'd11: vga_RGB = 12'h0F0;
    5'd12: vga_RGB = 12'h0F0;
    5'd13: vga_RGB = 12'h0F0;
    5'd14: vga_RGB = 12'h0F0;
    5'd15: vga_RGB = 12'h0F0;
    5'd16: vga_RGB = 12'h0F0;
    5'd17: vga_RGB = 12'h0F0;
    5'd18: vga_RGB = 12'h0F0;
    5'd19: vga_RGB = 12'h0F0;
    5'd20: vga_RGB = 12'h0F0;
    5'd21: vga_RGB = 12'h0F0;
    5'd22: vga_RGB = 12'h0F0;
    5'd23: vga_RGB = 12'h0F0;
    5'd24: vga_RGB = 12'h0F0;
    5'd25: vga_RGB = 12'h0F0;
    5'd26: vga_RGB = 12'h0F0;
    5'd27: vga_RGB = 12'h0F0;
    5'd28: vga_RGB = 12'h0F0;
    5'd29: vga_RGB = 12'h0F0;
    5'd30: vga_RGB = 12'h0F0;
    5'd31: vga_RGB = 12'h0F0;
    default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase
    
else if((x_axis == x3) && (y_axis == y3)) //body3
case(gameover)
1'b0:
  case(length)
    5'd1: vga_RGB = 12'h000;
    5'd2: vga_RGB = 12'h000;
    5'd3: vga_RGB = 12'h000;
    5'd4: vga_RGB = 12'h0F0;
    5'd5: vga_RGB = 12'h0F0;
    5'd6: vga_RGB = 12'h0F0;
    5'd7: vga_RGB = 12'h0F0;
    5'd8: vga_RGB = 12'h0F0;
    5'd9: vga_RGB = 12'h0F0;
    5'd10: vga_RGB = 12'h0F0;
    5'd11: vga_RGB = 12'h0F0;
    5'd12: vga_RGB = 12'h0F0;
    5'd13: vga_RGB = 12'h0F0;
    5'd14: vga_RGB = 12'h0F0;
    5'd15: vga_RGB = 12'h0F0;
    5'd16: vga_RGB = 12'h0F0;
    5'd17: vga_RGB = 12'h0F0;
    5'd18: vga_RGB = 12'h0F0;
    5'd19: vga_RGB = 12'h0F0;
    5'd20: vga_RGB = 12'h0F0;
    5'd21: vga_RGB = 12'h0F0;
    5'd22: vga_RGB = 12'h0F0;
    5'd23: vga_RGB = 12'h0F0;
    5'd24: vga_RGB = 12'h0F0;
    5'd25: vga_RGB = 12'h0F0;
    5'd26: vga_RGB = 12'h0F0;
    5'd27: vga_RGB = 12'h0F0;
    5'd28: vga_RGB = 12'h0F0;
    5'd29: vga_RGB = 12'h0F0;
    5'd30: vga_RGB = 12'h0F0;
    5'd31: vga_RGB = 12'h0F0;
    default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x4) && (y_axis == y4)) //body4
case(gameover)
1'b0:
  case(length)
    5'd1: vga_RGB = 12'h000;
    5'd2: vga_RGB = 12'h000;
    5'd3: vga_RGB = 12'h000;
    5'd4: vga_RGB = 12'h000;
    5'd5: vga_RGB = 12'h0F0;
    5'd6: vga_RGB = 12'h0F0;
    5'd7: vga_RGB = 12'h0F0;
    5'd8: vga_RGB = 12'h0F0;
    5'd9: vga_RGB = 12'h0F0;
    5'd10: vga_RGB = 12'h0F0;
    5'd11: vga_RGB = 12'h0F0;
    5'd12: vga_RGB = 12'h0F0;
    5'd13: vga_RGB = 12'h0F0;
    5'd14: vga_RGB = 12'h0F0;
    5'd15: vga_RGB = 12'h0F0;
    5'd16: vga_RGB = 12'h0F0;
    5'd17: vga_RGB = 12'h0F0;
    5'd18: vga_RGB = 12'h0F0;
    5'd19: vga_RGB = 12'h0F0;
    5'd20: vga_RGB = 12'h0F0;
    5'd21: vga_RGB = 12'h0F0;
    5'd22: vga_RGB = 12'h0F0;
    5'd23: vga_RGB = 12'h0F0;
    5'd24: vga_RGB = 12'h0F0;
    5'd25: vga_RGB = 12'h0F0;
    5'd26: vga_RGB = 12'h0F0;
    5'd27: vga_RGB = 12'h0F0;
    5'd28: vga_RGB = 12'h0F0;
    5'd29: vga_RGB = 12'h0F0;
    5'd30: vga_RGB = 12'h0F0;
    5'd31: vga_RGB = 12'h0F0;
    default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x5) && (y_axis == y5)) //body5
case(gameover)
1'b0:
  case(length)
    5'd1: vga_RGB = 12'h000;
    5'd2: vga_RGB = 12'h000;
    5'd3: vga_RGB = 12'h000;
    5'd4: vga_RGB = 12'h000;
    5'd5: vga_RGB = 12'h000;
    5'd6: vga_RGB = 12'h0F0;
    5'd7: vga_RGB = 12'h0F0;
    5'd8: vga_RGB = 12'h0F0;
    5'd9: vga_RGB = 12'h0F0;
    5'd10: vga_RGB = 12'h0F0;
    5'd11: vga_RGB = 12'h0F0;
    5'd12: vga_RGB = 12'h0F0;
    5'd13: vga_RGB = 12'h0F0;
    5'd14: vga_RGB = 12'h0F0;
    5'd15: vga_RGB = 12'h0F0;
    5'd16: vga_RGB = 12'h0F0;
    5'd17: vga_RGB = 12'h0F0;
    5'd18: vga_RGB = 12'h0F0;
    5'd19: vga_RGB = 12'h0F0;
    5'd20: vga_RGB = 12'h0F0;
    5'd21: vga_RGB = 12'h0F0;
    5'd22: vga_RGB = 12'h0F0;
    5'd23: vga_RGB = 12'h0F0;
    5'd24: vga_RGB = 12'h0F0;
    5'd25: vga_RGB = 12'h0F0;
    5'd26: vga_RGB = 12'h0F0;
    5'd27: vga_RGB = 12'h0F0;
    5'd28: vga_RGB = 12'h0F0;
    5'd29: vga_RGB = 12'h0F0;
    5'd30: vga_RGB = 12'h0F0;
    5'd31: vga_RGB = 12'h0F0;
    default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x6) && (y_axis == y6)) //body6
case(gameover)
1'b0:
  case(length)
    5'd1: vga_RGB = 12'h000;
    5'd2: vga_RGB = 12'h000;
    5'd3: vga_RGB = 12'h000;
    5'd4: vga_RGB = 12'h000;
    5'd5: vga_RGB = 12'h000;
    5'd6: vga_RGB = 12'h000;
    5'd7: vga_RGB = 12'h0F0;
    5'd8: vga_RGB = 12'h0F0;
    5'd9: vga_RGB = 12'h0F0;
    5'd10: vga_RGB = 12'h0F0;
    5'd11: vga_RGB = 12'h0F0;
    5'd12: vga_RGB = 12'h0F0;
    5'd13: vga_RGB = 12'h0F0;
    5'd14: vga_RGB = 12'h0F0;
    5'd15: vga_RGB = 12'h0F0;
    5'd16: vga_RGB = 12'h0F0;
    5'd17: vga_RGB = 12'h0F0;
    5'd18: vga_RGB = 12'h0F0;
    5'd19: vga_RGB = 12'h0F0;
    5'd20: vga_RGB = 12'h0F0;
    5'd21: vga_RGB = 12'h0F0;
    5'd22: vga_RGB = 12'h0F0;
    5'd23: vga_RGB = 12'h0F0;
    5'd24: vga_RGB = 12'h0F0;
    5'd25: vga_RGB = 12'h0F0;
    5'd26: vga_RGB = 12'h0F0;
    5'd27: vga_RGB = 12'h0F0;
    5'd28: vga_RGB = 12'h0F0;
    5'd29: vga_RGB = 12'h0F0;
    5'd30: vga_RGB = 12'h0F0;
    5'd31: vga_RGB = 12'h0F0;
    default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x7) && (y_axis == y7)) //body7
case(gameover)
1'b0:
  case(length)
    5'd1: vga_RGB = 12'h000;
    5'd2: vga_RGB = 12'h000;
    5'd3: vga_RGB = 12'h000;
    5'd4: vga_RGB = 12'h000;
    5'd5: vga_RGB = 12'h000;
    5'd6: vga_RGB = 12'h000;
    5'd7: vga_RGB = 12'h000;
    5'd8: vga_RGB = 12'h0F0;
    5'd9: vga_RGB = 12'h0F0;
    5'd10: vga_RGB = 12'h0F0;
    5'd11: vga_RGB = 12'h0F0;
    5'd12: vga_RGB = 12'h0F0;
    5'd13: vga_RGB = 12'h0F0;
    5'd14: vga_RGB = 12'h0F0;
    5'd15: vga_RGB = 12'h0F0;
    5'd16: vga_RGB = 12'h0F0;
    5'd17: vga_RGB = 12'h0F0;
    5'd18: vga_RGB = 12'h0F0;
    5'd19: vga_RGB = 12'h0F0;
    5'd20: vga_RGB = 12'h0F0;
    5'd21: vga_RGB = 12'h0F0;
    5'd22: vga_RGB = 12'h0F0;
    5'd23: vga_RGB = 12'h0F0;
    5'd24: vga_RGB = 12'h0F0;
    5'd25: vga_RGB = 12'h0F0;
    5'd26: vga_RGB = 12'h0F0;
    5'd27: vga_RGB = 12'h0F0;
    5'd28: vga_RGB = 12'h0F0;
    5'd29: vga_RGB = 12'h0F0;
    5'd30: vga_RGB = 12'h0F0;
    5'd31: vga_RGB = 12'h0F0;
    default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x8) && (y_axis == y8)) //body8
case(gameover)
1'b0:
  case(length)
    5'd1: vga_RGB = 12'h000;
    5'd2: vga_RGB = 12'h000;
    5'd3: vga_RGB = 12'h000;
    5'd4: vga_RGB = 12'h000;
    5'd5: vga_RGB = 12'h000;
    5'd6: vga_RGB = 12'h000;
    5'd7: vga_RGB = 12'h000;
    5'd8: vga_RGB = 12'h000;
    5'd9: vga_RGB = 12'h0F0;
    5'd10: vga_RGB = 12'h0F0;
    5'd11: vga_RGB = 12'h0F0;
    5'd12: vga_RGB = 12'h0F0;
    5'd13: vga_RGB = 12'h0F0;
    5'd14: vga_RGB = 12'h0F0;
    5'd15: vga_RGB = 12'h0F0;
    5'd16: vga_RGB = 12'h0F0;
    5'd17: vga_RGB = 12'h0F0;
    5'd18: vga_RGB = 12'h0F0;
    5'd19: vga_RGB = 12'h0F0;
    5'd20: vga_RGB = 12'h0F0;
    5'd21: vga_RGB = 12'h0F0;
    5'd22: vga_RGB = 12'h0F0;
    5'd23: vga_RGB = 12'h0F0;
    5'd24: vga_RGB = 12'h0F0;
    5'd25: vga_RGB = 12'h0F0;
    5'd26: vga_RGB = 12'h0F0;
    5'd27: vga_RGB = 12'h0F0;
    5'd28: vga_RGB = 12'h0F0;
    5'd29: vga_RGB = 12'h0F0;
    5'd30: vga_RGB = 12'h0F0;
    5'd31: vga_RGB = 12'h0F0;
    default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x9) && (y_axis == y9)) //body9
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h0F0;
  5'd11: vga_RGB = 12'h0F0;
  5'd12: vga_RGB = 12'h0F0;
  5'd13: vga_RGB = 12'h0F0;
  5'd14: vga_RGB = 12'h0F0;
  5'd15: vga_RGB = 12'h0F0;
  5'd16: vga_RGB = 12'h0F0;
  5'd17: vga_RGB = 12'h0F0;
  5'd18: vga_RGB = 12'h0F0;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x10) && (y_axis == y10)) //body10
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h0F0;
  5'd12: vga_RGB = 12'h0F0;
  5'd13: vga_RGB = 12'h0F0;
  5'd14: vga_RGB = 12'h0F0;
  5'd15: vga_RGB = 12'h0F0;
  5'd16: vga_RGB = 12'h0F0;
  5'd17: vga_RGB = 12'h0F0;
  5'd18: vga_RGB = 12'h0F0;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x11) && (y_axis == y11)) //body11
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h0F0;
  5'd13: vga_RGB = 12'h0F0;
  5'd14: vga_RGB = 12'h0F0;
  5'd15: vga_RGB = 12'h0F0;
  5'd16: vga_RGB = 12'h0F0;
  5'd17: vga_RGB = 12'h0F0;
  5'd18: vga_RGB = 12'h0F0;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x12) && (y_axis == y12)) //body12
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h0F0;
  5'd14: vga_RGB = 12'h0F0;
  5'd15: vga_RGB = 12'h0F0;
  5'd16: vga_RGB = 12'h0F0;
  5'd17: vga_RGB = 12'h0F0;
  5'd18: vga_RGB = 12'h0F0;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x13) && (y_axis == y13)) //body13
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h0F0;
  5'd15: vga_RGB = 12'h0F0;
  5'd16: vga_RGB = 12'h0F0;
  5'd17: vga_RGB = 12'h0F0;
  5'd18: vga_RGB = 12'h0F0;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x14) && (y_axis == y14)) //body14
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h0F0;
  5'd16: vga_RGB = 12'h0F0;
  5'd17: vga_RGB = 12'h0F0;
  5'd18: vga_RGB = 12'h0F0;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x15) && (y_axis == y15)) //body15
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h0F0;
  5'd17: vga_RGB = 12'h0F0;
  5'd18: vga_RGB = 12'h0F0;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x16) && (y_axis == y16)) //body16
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h0F0;
  5'd18: vga_RGB = 12'h0F0;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x17) && (y_axis == y17)) //body17
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h0F0;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x18) && (y_axis == y18)) //body18
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h0F0;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x19) && (y_axis == y19)) //body19
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h0F0;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x20) && (y_axis == y20)) //body20
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h0F0;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x21) && (y_axis == y21)) //body21
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h0F0;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x22) && (y_axis == y22)) //body22
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h000;
  5'd23: vga_RGB = 12'h0F0;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x23) && (y_axis == y23)) //body23
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h000;
  5'd23: vga_RGB = 12'h000;
  5'd24: vga_RGB = 12'h0F0;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x24) && (y_axis == y24)) //body24
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h000;
  5'd23: vga_RGB = 12'h000;
  5'd24: vga_RGB = 12'h000;
  5'd25: vga_RGB = 12'h0F0;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x25) && (y_axis == y25)) //body25
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h000;
  5'd23: vga_RGB = 12'h000;
  5'd24: vga_RGB = 12'h000;
  5'd25: vga_RGB = 12'h000;
  5'd26: vga_RGB = 12'h0F0;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x26) && (y_axis == y26)) //body26
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h000;
  5'd23: vga_RGB = 12'h000;
  5'd24: vga_RGB = 12'h000;
  5'd25: vga_RGB = 12'h000;
  5'd26: vga_RGB = 12'h000;
  5'd27: vga_RGB = 12'h0F0;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x27) && (y_axis == y27)) //body27
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h000;
  5'd23: vga_RGB = 12'h000;
  5'd24: vga_RGB = 12'h000;
  5'd25: vga_RGB = 12'h000;
  5'd26: vga_RGB = 12'h000;
  5'd27: vga_RGB = 12'h000;
  5'd28: vga_RGB = 12'h0F0;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x28) && (y_axis == y28)) //body28
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h000;
  5'd23: vga_RGB = 12'h000;
  5'd24: vga_RGB = 12'h000;
  5'd25: vga_RGB = 12'h000;
  5'd26: vga_RGB = 12'h000;
  5'd27: vga_RGB = 12'h000;
  5'd28: vga_RGB = 12'h000;
  5'd29: vga_RGB = 12'h0F0;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x29) && (y_axis == y29)) //body29
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h000;
  5'd23: vga_RGB = 12'h000;
  5'd24: vga_RGB = 12'h000;
  5'd25: vga_RGB = 12'h000;
  5'd26: vga_RGB = 12'h000;
  5'd27: vga_RGB = 12'h000;
  5'd28: vga_RGB = 12'h000;
  5'd29: vga_RGB = 12'h000;
  5'd30: vga_RGB = 12'h0F0;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == x30) && (y_axis == y30)) //body30
case(gameover)
1'b0:
  case(length)
  5'd1: vga_RGB = 12'h000;
  5'd2: vga_RGB = 12'h000;
  5'd3: vga_RGB = 12'h000;
  5'd4: vga_RGB = 12'h000;
  5'd5: vga_RGB = 12'h000;
  5'd6: vga_RGB = 12'h000;
  5'd7: vga_RGB = 12'h000;
  5'd8: vga_RGB = 12'h000;
  5'd9: vga_RGB = 12'h000;
  5'd10: vga_RGB = 12'h000;
  5'd11: vga_RGB = 12'h000;
  5'd12: vga_RGB = 12'h000;
  5'd13: vga_RGB = 12'h000;
  5'd14: vga_RGB = 12'h000;
  5'd15: vga_RGB = 12'h000;
  5'd16: vga_RGB = 12'h000;
  5'd17: vga_RGB = 12'h000;
  5'd18: vga_RGB = 12'h000;
  5'd19: vga_RGB = 12'h000;
  5'd20: vga_RGB = 12'h000;
  5'd21: vga_RGB = 12'h000;
  5'd22: vga_RGB = 12'h000;
  5'd23: vga_RGB = 12'h000;
  5'd24: vga_RGB = 12'h000;
  5'd25: vga_RGB = 12'h000;
  5'd26: vga_RGB = 12'h000;
  5'd27: vga_RGB = 12'h000;
  5'd28: vga_RGB = 12'h000;
  5'd29: vga_RGB = 12'h000;
  5'd30: vga_RGB = 12'h000;
  5'd31: vga_RGB = 12'h0F0;
  default: vga_RGB = 12'h000;
  endcase
1'b1:
    vga_RGB = 12'h000;
endcase

else if((x_axis == apple_x) && (y_axis == apple_y)) //apple
    vga_RGB = 12'hF00;
else if((x_axis == drug_x) && (y_axis == drug_y)) //drug
    vga_RGB = 12'h00F;  
else
    vga_RGB = 12'h000;
    
always@*
begin
vgaRed = vga_RGB[11:8];
vgaGreen = vga_RGB[7:4];
vgaBlue = vga_RGB[3:0];
end

//direction  combinational
always@*
if(gaming==1 && direction==3'b000) //up
  begin
    temp_x = x;
    temp_y = y - 1;
  end
else if(gaming==1 && direction==3'b001) //down
  begin
    temp_x = x;
    temp_y = y + 1;
  end
else if(gaming==1 && direction==3'b010) //left
  begin
     temp_x = x - 1;
     temp_y = y;
  end
else if(gaming==1 && direction==3'b011) //right
    begin
       temp_x = x + 1;
       temp_y = y;
    end
else if(gaming==0)
    begin
      temp_x = 6'd16;
      temp_y = 6'd12;
    end
else 
    begin
       temp_x = x;
       temp_y = y;
    end

//direction flip flop
always@(posedge clk or posedge rst)
if(rst==1)
  begin
    x <= 6'd16;
    y <= 6'd12; 
  end
else
  begin
    x <= temp_x;
    y <= temp_y;
    x1 <= x;
    y1 <= y;
    x2 <= x1;
    y2 <= y1;
    x3 <= x2;
    y3 <= y2;
    x4 <= x3;
    y4 <= y3;   
    x5 <= x4;
    y5 <= y4;   
    x6 <= x5;
    y6 <= y5;   
    x7 <= x6;
    y7 <= y6;   
    x8 <= x7;
    y8 <= y7;   
    x9 <= x8;
    y9 <= y8;   
    x10 <= x9;
    y10 <= y9;   
    x11 <= x10;
    y11 <= y10;   
    x12 <= x11;
    y12 <= y11;   
    x13 <= x12;
    y13 <= y12;
    x14 <= x13;
    y14 <= y13; 
    x15 <= x14;
    y15 <= y14; 
    x16 <= x15;
    y16 <= y15; 
    x17 <= x16;
    y17 <= y16; 
    x18 <= x17;
    y18 <= y17; 
    x19 <= x18;
    y19 <= y18; 
    x20 <= x19;
    y20 <= y19; 
    x21 <= x20;
    y21 <= y20; 
    x22 <= x21;
    y22 <= y21; 
    x23 <= x22;
    y23 <= y22; 
    x24 <= x23;
    y24 <= y23; 
    x25 <= x24;
    y25 <= y24; 
    x26 <= x25;
    y26 <= y25; 
    x27 <= x26;
    y27 <= y26; 
    x28 <= x27;
    y28 <= y27; 
    x29 <= x28;
    y29 <= y28; 
    x30 <= x29;
    y30 <= y29; 
  end

//game over
always@*
if(x==6'd63 || x==6'd32 || y==6'd63 || y==6'd24)
        gameover = 1;
else if(length==5'd5 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4)))
        gameover = 1;
else if(length==5'd6 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)))
        gameover = 1;
else if(length==5'd7 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6)))
        gameover = 1;
else if(length==5'd8 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7)))
        gameover = 1;
else if(length==5'd9 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8)))
        gameover = 1;
else if(length==5'd10 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)))
        gameover = 1;
else if(length==5'd11 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10)))
        gameover = 1;
else if(length==5'd12 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11)))
        gameover = 1;
else if(length==5'd13 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12)))
        gameover = 1;
else if(length==5'd14 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13)))
        gameover = 1;
else if(length==5'd15 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14)))
        gameover = 1;
else if(length==5'd16 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)))
        gameover = 1;
else if(length==5'd17 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)  || (x==x16 && y==y16)))
        gameover = 1;
else if(length==5'd18 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)  || (x==x16 && y==y16) || (x==x17 && y==y17)))
        gameover = 1;
else if(length==5'd19 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)  || (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18)))
        gameover = 1;
else if(length==5'd20 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)  || (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19)))
        gameover = 1;
else if(length==5'd21 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)  || (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20)))
        gameover = 1;
else if(length==5'd22 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)  || (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)))
        gameover = 1;
else if(length==5'd23 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)|| (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)  || (x==x22 && y==y22)))
        gameover = 1;
else if(length==5'd24 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)|| (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)  || (x==x22 && y==y22) || (x==x23 && y==y23)))
        gameover = 1;
else if(length==5'd25 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)|| (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)  || (x==x22 && y==y22) || (x==x23 && y==y23) || (x==x24 && y==y24)))
        gameover = 1;
else if(length==5'd26 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)|| (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)  || (x==x22 && y==y22) || (x==x23 && y==y23) || (x==x24 && y==y24) || (x==x25 && y==y25)))
        gameover = 1;
else if(length==5'd27 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15)|| (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)  || (x==x22 && y==y22) || (x==x23 && y==y23) || (x==x24 && y==y24) || (x==x25 && y==y25)  || (x==x26 && y==y26)))
        gameover = 1;
else if(length==5'd28 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15) || (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)  || (x==x22 && y==y22) || (x==x23 && y==y23) || (x==x24 && y==y24) || (x==x25 && y==y25)  || (x==x26 && y==y26) || (x==x27 && y==y27)))
        gameover = 1;
else if(length==5'd29 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15) || (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)  || (x==x22 && y==y22) || (x==x23 && y==y23) || (x==x24 && y==y24) || (x==x25 && y==y25)  || (x==x26 && y==y26) || (x==x27 && y==y27) || (x==x28 && y==y28)))
        gameover = 1;
else if(length==5'd30 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15) || (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)  || (x==x22 && y==y22) || (x==x23 && y==y23) || (x==x24 && y==y24) || (x==x25 && y==y25)  || (x==x26 && y==y26) || (x==x27 && y==y27) || (x==x28 && y==y28) || (x==x29 && y==y29)))
        gameover = 1;
else if(length==5'd31 && ((x==x1 && y==y1) || (x==x2 && y==y2) || (x==x3 && y==y3) || (x==x4 && y==y4) || (x==x5 && y==y5)  || (x==x6 && y==y6) || (x==x7 && y==y7) || (x==x8 && y==y8) || (x==x9 && y==y9)  || (x==x10 && y==y10) || (x==x11 && y==y11) || (x==x12 && y==y12) || (x==x13 && y==y13) || (x==x14 && y==y14) || (x==x15 && y==y15) || (x==x16 && y==y16) || (x==x17 && y==y17)  || (x==x18 && y==y18) || (x==x19 && y==y19) || (x==x20 && y==y20) || (x==x21 && y==y21)  || (x==x22 && y==y22) || (x==x23 && y==y23) || (x==x24 && y==y24) || (x==x25 && y==y25)  || (x==x26 && y==y26) || (x==x27 && y==y27) || (x==x28 && y==y28) || (x==x29 && y==y29) || (x==x30 && y==y30)))
        gameover = 1;
else
        gameover = 0;
    
// apple, drug
always@*
if((head_x == apple_x ) && (head_y == apple_y))
  begin
    apple_valid = 1;
    apple_conflict = 0;
    drug_valid = 0;
  end
else if((head_x == drug_x ) && (head_y == drug_y))
  begin
    apple_valid = 0;
    apple_conflict = 0;
    drug_valid = 1;
  end
else if((apple_x == drug_x ) && (apple_y == drug_y))
  begin
    apple_valid = 0;
    apple_conflict = 1;
    drug_valid = 0;
  end
else
  begin
    apple_valid = 0;
    apple_conflict = 0;
    drug_valid = 0;
  end

//length
always@*
if(apple_valid==1 && length < 5'd31)
   temp_length = length + 1;
else if(gaming==0)
   temp_length = 5'd1;
else
   temp_length = length;

always@(posedge clk or posedge rst)  
if(rst==1)
    length <= 5'd1;
else
    length <= temp_length;

// opposit direction
always@*
if((head_x == drug_x ) && (head_y == drug_y))
    temp_opposite = ~opposite;
else
    temp_opposite = opposite;

always@(posedge clk or posedge rst)  
if(rst==1 || gameover==1)
    opposite <= 0;
else
    opposite <= temp_opposite;
    
endmodule
