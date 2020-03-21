module up_and_down_counter(
    output reg [3:0] digit0,
    input clk,
    input rst,
    input increase,
    input decrease,
    input en
    );
    assign increase_enable = increase & (~(digit0 == 4'd15));
    assign decrease_enable = decrease & (~(digit0 == 4'd0));
    
    
    reg [3:0] value_tmp;	// input to dff in always
    
    always @* begin
        if (decrease & ~increase & en)    
            begin
                value_tmp <= digit0 - 1'd1;         // decrease condition
            end
        else if (increase & en)       
            begin
                value_tmp <= digit0 + 1'd1;         // increase condition
            end
        else if (en)
            begin
                value_tmp <= digit0;
            end
        else
            begin
                value_tmp <= 4'd0;
            end    
    end
    
    always @(posedge clk or posedge rst) begin
        if(rst==1) digit0 <= 4'd0;        // reset, resume to initial value
        else digit0 <= value_tmp;
    end
    
endmodule