`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/06/07 12:51:47
// Design Name: 
// Module Name: Top
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


module Top(
input clk,
input rst,
input up,
input down,
input left,
input right,
input start,
input speed_control,
input display_control,
output [3:0] vgaRed,
output [3:0] vgaGreen,
output [3:0] vgaBlue,
output hsync,
output vsync,
output LED_play,
output [3:0]ssd_ctl,
output [7:0]segs,
inout PS2_CLK,
inout PS2_DATA,
output audio_mclk,
output audio_lrck,
output audio_sck,
output audio_sdin,
output reg [14:0]vol_LED
    );

wire clk_25MHz, clk_1, clk_12_5, clk_25, clk_100;
wire [1:0]clk_ctl;
wire [3:0]ssd_in;

wire de_up, de_down, de_left, de_right, de_start;
wire one_up, one_down, one_left, one_right, one_start;
wire [2:0]direction;
wire gaming, gameover;

wire [9:0] h_cnt; //640
wire [9:0] v_cnt; //480
wire valid;

wire[4:0]apple_x, apple_y, drug_x, drug_y;
wire apple_valid, score_zero, drug_valid;
reg clk_mode;

wire [3:0]digit3, digit2, digit1, digit0;
wire [3:0]score_digit3, score_digit2, score_digit1, score_digit0;
reg  [3:0]display3, display2, display1, display0;
wire [1:0]state2;
reg speed;

wire [3:0]volume_amplitude;
wire opposite;
wire apple_conflict;

//volume LED
always@*
case(volume_amplitude)
    4'd0: vol_LED = 15'b100_0000_0000_0000;
    4'd1: vol_LED = 15'b110_0000_0000_0000;
    4'd2: vol_LED = 15'b111_0000_0000_0000;
    4'd3: vol_LED = 15'b111_1000_0000_0000;
    4'd4: vol_LED = 15'b111_1100_0000_0000;
    4'd5: vol_LED = 15'b111_1110_0000_0000;                                              
    4'd6: vol_LED = 15'b111_1111_0000_0000;
    4'd7: vol_LED = 15'b111_1111_1000_0000;
    4'd8: vol_LED = 15'b111_1111_1100_0000;
    4'd9: vol_LED = 15'b111_1111_1110_0000;
    4'd10: vol_LED = 15'b111_1111_1111_0000;
    4'd11: vol_LED = 15'b111_1111_1111_1000;
    4'd12: vol_LED = 15'b111_1111_1111_1100;
    4'd13: vol_LED = 15'b111_1111_1111_1110;
    4'd14: vol_LED = 15'b111_1111_1111_1111;
    4'd15: vol_LED = 15'b111_1111_1111_1111;
    default: vol_LED = 15'b000_0000_0000_0000;
endcase
//display mux
always@*
if(state2 == 2'b00)
    begin
      display3 = 0;
      display2 = 0;
      display1 = 0;
      display0 = 0;
    end
else if((state2 == 2'b01||state2 == 2'b10) && display_control==0)
    begin
      display3 = score_digit3;
      display2 = score_digit2;
      display1 = score_digit1;
      display0 = score_digit0;
    end
else if((state2 == 2'b01||state2 == 2'b10) && display_control==1)
    begin
      display3 = digit3;
      display2 = digit2;
      display1 = digit1;
      display0 = digit0;
    end
else 
    begin
      display3 = 0;
      display2 = 0;
      display1 = 0;
      display0 = 0;
    end
    
//speed mode
always@*
if(speed_control==1)
  begin
    clk_mode = clk_25;
    speed = 1;
  end
else
  begin
    clk_mode = clk_12_5;
    speed = 0;
  end
    
clock_divisor clock0(
.clk(clk),
.clk1(clk_25MHz)
);

frequency_divider fre0(
.clk(clk),
.rst(rst),
.clk_1(clk_1),
.clk_12_5(clk_12_5),
.clk_25(clk_25),
.clk_100(clk_100),
.clk_ctl(clk_ctl)
);

//up
debounce De0(
.clk(clk_100),
.rst(rst),
.pb_in(up),
.pb_debounced(de_up)
);

one_pulse One0(
.clk(clk_100),
.rst(rst),
.in_trig(de_up),
.out_pulse(one_up)
);

//down
debounce De1(
.clk(clk_100),
.rst(rst),
.pb_in(down),
.pb_debounced(de_down)
);

one_pulse One1(
.clk(clk_100),
.rst(rst),
.in_trig(de_down),
.out_pulse(one_down)
);

//left
debounce De2(
.clk(clk_100),
.rst(rst),
.pb_in(left),
.pb_debounced(de_left)
);

one_pulse One2(
.clk(clk_100),
.rst(rst),
.in_trig(de_left),
.out_pulse(one_left)
);

//right
debounce De3(
.clk(clk_100),
.rst(rst),
.pb_in(right),
.pb_debounced(de_right)
);

one_pulse One3(
.clk(clk_100),
.rst(rst),
.in_trig(de_right),
.out_pulse(one_right)
);

//start
debounce De4(
.clk(clk_100),
.rst(rst),
.pb_in(start),
.pb_debounced(de_start)
);

one_pulse One4(
.clk(clk_100),
.rst(rst),
.in_trig(de_start),
.out_pulse(one_start)
);

//FSM
FSM_direction FSM0(
.clk(clk_100), 
.rst(rst),
.one_up(one_up),
.one_down(one_down),
.one_left(one_left),
.one_right(one_right),
.one_start(one_start),
.direction(direction),
.gaming(gaming),
.gameover(gameover),
.score_zero(score_zero),
.LED_play(LED_play),
.state2(state2),
.clk_1(clk_1),
.opposite(opposite)
);


//vga controller
vga_controller vga_inst(
.pclk(clk_25MHz),
.reset(rst),
.hsync(hsync),
.vsync(vsync),
.valid(valid),
.h_cnt(h_cnt),
.v_cnt(v_cnt)
);

//pixel_gen
pixel_gen Pix0(
.h_cnt(h_cnt),
.v_cnt(v_cnt),
.direction(direction),
.gaming(gaming),
.clk(clk_mode),
.rst(rst),
.apple_x(apple_x),
.apple_y(apple_y),
.drug_x(drug_x),
.drug_y(drug_y),
.vgaRed(vgaRed),
.vgaGreen(vgaGreen),
.vgaBlue(vgaBlue),
.gameover(gameover),
.apple_valid(apple_valid),
.drug_valid(drug_valid),
.valid(valid),
.opposite(opposite),
.apple_conflict(apple_conflict)
);

//apple
random_apple_generator random0(
.clk(clk_mode),
.rst(rst),
.apple_valid(apple_valid),
.apple_x(apple_x),
.apple_y(apple_y),
.apple_conflict(apple_conflict)
);

// time
time_of_playing time0(
.gaming(gaming),
.score_zero(score_zero),
.clk(clk_1),
.rst(rst),
.digit3(digit3),
.digit2(digit2),
.digit1(digit1),
.digit0(digit0)
);

//score
score score0(
.apple_valid(apple_valid),
.score_zero(score_zero),
.rst(rst),
.speed(speed),
.clk_mode(clk_mode),
.score_digit3(score_digit3),
.score_digit2(score_digit2),
.score_digit1(score_digit1),
.score_digit0(score_digit0)
);

//scan control
scan_ctl U_SC0(
.ssd_ctl(ssd_ctl), // ssd display control signal 
.ssd_in(ssd_in), // output to ssd display
.in0(display0), // 1st input
.in1(display1), // 2nd input
.in2(display2), // 3rd input
.in3(display3),  // 4th input
.ssd_ctl_en(clk_ctl) // divided clock for scan control
); 

//display
display dis0(
.binary(ssd_in),
.segs(segs)
);

//BGM
top_speaker top0(
.clk(clk),
.rst(rst),
.PS2_DATA(PS2_DATA),
.PS2_CLK(PS2_CLK),
.audio_mclk(audio_mclk),
.audio_lrck(audio_lrck),
.audio_sck(audio_sck),
.audio_sdin(audio_sdin),
.gaming(gaming),
.volume_amplitude(volume_amplitude)
);

//drug
random_drug_generator random1(
.clk(clk_mode),
.rst(rst),
.drug_valid(drug_valid),
.drug_x(drug_x),
.drug_y(drug_y)
);
endmodule
