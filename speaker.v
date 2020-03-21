module speaker(
	input clk,
	input rst,
	input [21:0] note_div,
	input [15:0] audio_min, 
    input [15:0] audio_max,    
    
	output audio_mclk,
	output audio_lrck,
	output audio_sck,
	output audio_sdin
	);

	wire [15:0] audio_in_left, audio_in_right;

	buzzer_control Ung(
		.clk(clk),
		.rst(rst),
		.note_div(note_div),
		.audio_max(audio_max),
		.audio_min(audio_min),
		.audio_left(audio_in_left),
		.audio_right(audio_in_right)
		);

	speaker_control Usc(
		.clk(clk),
		.rst(rst),
		.audio_left(audio_in_left), // left channel audio data input
		.audio_right(audio_in_right), // right channel audio data input
		.audio_mclk(audio_mclk), // master clock
		.audio_lrck(audio_lrck), // left-right clock
		.audio_sck(audio_sck), // serial clock
		.audio_sdin(audio_sdin) // serial audio data input
		);
endmodule