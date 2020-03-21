module volume_control(
volume_amplitude,
audio_max,
audio_min
    );
    input [3:0]volume_amplitude;        // controled by up_down counter
    output reg [15:0]audio_max;             // the output frequency and will be sent to buzzer control module
    output reg [15:0]audio_min;             // the output frequency and will be sent to buzzer control module
    
    always@*
    begin           // under 2's complement principle
        audio_max = (16'd1400) * volume_amplitude + 16'd1400;
        audio_min = 16'd0 - ((16'd1400) * volume_amplitude + 16'd1400);
    end
endmodule