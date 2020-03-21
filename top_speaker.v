`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/05/20 15:33:41
// Design Name: 
// Module Name: top_speaker
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
`define do 22'd191571
`define re 22'd170648
`define mi 22'd151515
`define fa 22'd143266
`define so 22'd127551
`define ra 22'd113636
`define si 22'd101215
`define Do 22'd95420
`define Re 22'd85034
`define Mi 22'd75756
`define Fa 22'd71633
`define So 22'd63776
`define Ra 22'd56818
`define Si 22'd50607
`define no 22'd0

module top_speaker(
clk,
rst,

PS2_DATA,
PS2_CLK,

audio_mclk,
audio_lrck,
audio_sck,
audio_sdin,
gaming,
volume_amplitude
);

    input clk;
    input rst;
    input gaming; 
    
    inout PS2_CLK;
    inout PS2_DATA;
    
    output audio_mclk;
    output audio_lrck;
    output audio_sck;
    output audio_sdin;
    output [3:0]volume_amplitude;
    
    wire [511:0] key_down;
    wire [8:0] last_change;
    wire key_valid; 
    wire [3:0]value1;
    wire [3:0]value0;
    wire clk_1;
    wire clk_5;
    wire [1:0]clk_ctl;
    wire [15:0]audio_max;
    wire [15:0]audio_min;
  
    wire [3:0]segs_ctl;
    reg up;
    reg down;
    
    always@*
    if(key_down[121] == 1'b1)
    begin 
        up = 1'b1;
        down = 1'b0;
    end
    else if(key_down[123] == 1'b1)
    begin
        up = 1'b0;
        down = 1'b1;
    end
    else
    begin
        up = 1'b0;
        down = 1'b0;
    end
    
    
    // control the frequency of the sound
    // by counter(0~13), 14 types
    reg [21:0]note_choose;
    reg [7:0]cnt_41;
    reg [7:0]cnt_next_41;
    always@(posedge clk_5 or posedge rst)
    if(rst==1 || cnt_next_41 == 8'd48)
        cnt_41 <= 8'd0;
    else
        cnt_41 <= cnt_next_41;
    
        always@*
        if(gaming==1)
            cnt_next_41 = cnt_41 + 1;
        else
            cnt_next_41 = 8'd47;    
            
    always@*
    begin
        case(cnt_41)
        8'd0: note_choose = `do;
        8'd1: note_choose = `re;
        8'd2: note_choose = `mi;
        8'd3: note_choose = `fa; 
        8'd4: note_choose = `so;
        8'd5: note_choose = `no;
        8'd6: note_choose = `ra;
        8'd7: note_choose = `fa;
        8'd8: note_choose = `mi;
        5'd9: note_choose = `mi;
        8'd10: note_choose = `re;
        8'd11: note_choose = `re;
        8'd12: note_choose = `do;
        8'd13: note_choose = `do;
        8'd14: note_choose = `no;
        8'd15: note_choose = `so;
        8'd16: note_choose = `fa;
        8'd17: note_choose = `mi;
        8'd18: note_choose = `so;
        8'd19: note_choose = `fa;
        8'd20: note_choose = `mi;
        8'd21: note_choose = `re;
        8'd22: note_choose = `no;
        8'd23: note_choose = `so;
        8'd24: note_choose = `fa;
        8'd25: note_choose = `mi;
        8'd26: note_choose = `so;
        8'd27: note_choose = `fa;
        8'd28: note_choose = `mi;
        8'd29: note_choose = `re;
        8'd30: note_choose = `no;
        8'd31: note_choose = `do;
        8'd32: note_choose = `re;
        8'd33: note_choose = `mi;
        8'd34: note_choose = `fa; 
        8'd35: note_choose = `so;
        8'd36: note_choose = `no;
        8'd37: note_choose = `ra;
        8'd38: note_choose = `fa;
        8'd39: note_choose = `mi;
        8'd40: note_choose = `mi;
        8'd41: note_choose = `re;
        8'd42: note_choose = `re;
        8'd43: note_choose = `do;
        8'd44: note_choose = `do;
        8'd45: note_choose = `no;
        8'd46: note_choose = `no;
        8'd47: note_choose = 22'd0;
        endcase
        end
        
        // keyboard recognition
        KeyboardDecoder U_keyBoard(
        .key_down(key_down),
        .last_change(last_change),
        .key_valid(key_valid),
        .PS2_DATA(PS2_DATA),
        .PS2_CLK(PS2_CLK),
        .rst(rst),
        .clk(clk)
        );
        
        
    freqdiv27 U_F(
    .clk(clk),
    .rst(rst),
    .clk_1(clk_1),
    .clk_5(clk_5),
    .clk_ctl(clk_ctl)
    );
    
    volume_control U_VC(
    .volume_amplitude(volume_amplitude),
    .audio_max(audio_max),
    .audio_min(audio_min)
    );
    
    up_and_down_counter U_UDC(
        .digit0(volume_amplitude),
        .clk(clk_5),
        .rst(rst),
        .increase(up),
        .decrease(down),
        .en(1'b1)
        );
    
    speaker U_speak(
    .clk(clk),
    .rst(rst),
    .note_div(note_choose),
    .audio_min(audio_min), 
    .audio_max(audio_max),    
    .audio_mclk(audio_mclk),
    .audio_lrck(audio_lrck),
    .audio_sck(audio_sck),
    .audio_sdin(audio_sdin)
    );

endmodule
