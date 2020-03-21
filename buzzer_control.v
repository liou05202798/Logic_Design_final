module buzzer_control(
	input clk,
	input rst,
	input [21:0] note_div,
	input [15:0] audio_max, 
	input [15:0] audio_min,	
	output [15:0] audio_left,	
	output [15:0] audio_right
	);

    reg [21:0] clk_cnt_next, clk_cnt;
    reg b_clk, b_clk_next;
    
    // Note frequency generation
    always @(posedge clk or posedge rst)
        if (rst==1)
        begin
            clk_cnt <= 22'd0;
            b_clk <= 1'b0;
        end
        else
        begin
            clk_cnt <= clk_cnt_next;
            b_clk <= b_clk_next;
        end
        
    always @*
        if (clk_cnt == note_div)
        begin
            clk_cnt_next = 22'd0;
            b_clk_next = ~b_clk;
        end
        else
        begin
            clk_cnt_next = clk_cnt + 1'b1;
            b_clk_next = b_clk;
        end
        
    // Assign the amplitude of the note
    assign audio_left = (b_clk == 1'b0) ? audio_max : audio_min;
    assign audio_right = (b_clk == 1'b0) ? audio_max : audio_min;
    
endmodule