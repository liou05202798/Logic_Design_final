module speaker_control(
    input clk,
    input rst,
    input [15:0]audio_right,
    input [15:0]audio_left,
    
    output reg audio_sdin,
    output reg audio_sck,
    output reg audio_lrck,
    output reg audio_mclk
);


    reg [8:0] cnt_temp;
    reg cnt_r;        // buffer
    reg cnt_m;              // buffer
    reg [3:0] cnt_l;        // buffer
    
    always @* begin
        cnt_temp  = {audio_lrck, cnt_l, audio_sck, cnt_m, audio_mclk, cnt_r} + 9'd1;
        end
    
    always @(posedge clk or posedge rst) begin
        if (rst==1) {audio_lrck, cnt_l, audio_sck, cnt_m, audio_mclk, cnt_r} <= 9'd0;
        else {audio_lrck, cnt_l, audio_sck, cnt_m, audio_mclk, cnt_r} <= cnt_temp;
        end
        
// design a 32 counter to send the data to the audio_sdin
reg [4:0] cnt_32;
reg [4:0] cnt_next_32;

// use D FF to send the value to the audio_sdin
// in the frequency of audio_sck
always@(posedge audio_sck or posedge rst)
if(rst==1)
    cnt_32 <= 5'd0;
else
    cnt_32 <= cnt_next_32;

    always@*
        cnt_next_32 = cnt_32 + 1;
        
    always@*
    begin
    case(cnt_32)
       5'd0: audio_sdin = audio_left[15];
       5'd1: audio_sdin = audio_left[14];
       5'd2: audio_sdin = audio_left[13];
       5'd3: audio_sdin = audio_left[12];
       5'd4: audio_sdin = audio_left[11];
       5'd5: audio_sdin = audio_left[10];
       5'd6: audio_sdin = audio_left[9];
       5'd7: audio_sdin = audio_left[8];
       5'd8: audio_sdin = audio_left[7];
       5'd9: audio_sdin = audio_left[6];
       5'd10: audio_sdin = audio_left[5];
       5'd11: audio_sdin = audio_left[4];
       5'd12: audio_sdin = audio_left[3];
       5'd13: audio_sdin = audio_left[2];                             
       5'd14: audio_sdin = audio_left[1];
       5'd15: audio_sdin = audio_left[0];
       5'd16: audio_sdin = audio_right[15];
       5'd17: audio_sdin = audio_right[14];
       5'd18: audio_sdin = audio_right[13];
       5'd19: audio_sdin = audio_right[12];
       5'd20: audio_sdin = audio_right[11];
       5'd21: audio_sdin = audio_right[10];
       5'd22: audio_sdin = audio_right[9];
       5'd23: audio_sdin = audio_right[8];
       5'd24: audio_sdin = audio_right[7];
       5'd25: audio_sdin = audio_right[6];
       5'd26: audio_sdin = audio_right[5];
       5'd27: audio_sdin = audio_right[4];
       5'd28: audio_sdin = audio_right[3];
       5'd29: audio_sdin = audio_right[2];
       5'd30: audio_sdin = audio_right[1];
       5'd31: audio_sdin = audio_right[0];
       default: audio_sdin = audio_right[0];
    endcase
    end
    
endmodule