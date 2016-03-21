`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2015 04:03:04 PM
// Design Name: 
// Module Name: morpOp_kernel
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


module morpOP_kernel(
        clk,
        in_data,
        in_valid,
        out_data,
        out_valid
    );
    
    input     clk; 
    input     [OP_SIZE * VIDEO_DATA_WIDTH - 1 : 0]  in_data;
    input     in_valid;
    
    output    [VIDEO_DATA_WIDTH - 1 : 0]   out_data;
    output    out_valid;   
    reg       [VIDEO_DATA_WIDTH -1  : 0]r_out_data;
    reg       r_out_valid;
    
    parameter OP_MODE = 1;  
    parameter VIDEO_DATA_WIDTH = 8;
    parameter OPERATOR_SIZE = 3;
    localparam OP_SIZE = OPERATOR_SIZE * OPERATOR_SIZE;
    localparam MAX_VALUE_PIX = (1 << VIDEO_DATA_WIDTH) - 1;
    localparam MIN_VALUE_PIX = 0;

wire [OP_SIZE - 1 : 0] w_data_most_bit;

generate 
        genvar i;
        for(i = 0;i < OP_SIZE; i = i + 1)
        begin:morpOP
            assign w_data_most_bit[i] = in_data[(i + 1)*VIDEO_DATA_WIDTH - 1];
        end
endgenerate  
  
always@(posedge clk)
begin 
    if(OP_MODE)begin
        if(&w_data_most_bit) begin
            r_out_data <=  MAX_VALUE_PIX; 
        end
        else begin
            r_out_data <=  MIN_VALUE_PIX; 
        end
    end
    else begin
        if(|w_data_most_bit) begin
            r_out_data <=  MAX_VALUE_PIX; 
        end
        else begin
            r_out_data <=  MIN_VALUE_PIX; 
        end
    end
end    

always@(posedge clk)
begin
    r_out_valid <= in_valid;
end
                   
assign out_data = r_out_data;
assign out_valid = r_out_valid;  

endmodule
