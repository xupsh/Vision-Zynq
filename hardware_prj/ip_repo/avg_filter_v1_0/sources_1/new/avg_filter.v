`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2015 11:38:12 AM
// Design Name: 
// Module Name: avg_filter
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


module avg_filter(
        in_active,
        in_data,
        in_hsync,
        in_vsync,
        
        clk,
        rst,
        
        out_active,
        out_data,
        out_hsync,
        out_vsync,
    );
 
 parameter VIDEO_WIDTH = 1280;
 localparam OPERATOR_SIZE = 3;
 parameter VIDEO_DATA_WIDTH = 8;
 
    
input     in_active;
input   [VIDEO_DATA_WIDTH - 1 : 0]  in_data;
input     in_hsync;
input     in_vsync;

input     clk;
input     rst;

output      out_active;
output   [VIDEO_DATA_WIDTH - 1 : 0]   out_data;
output      out_hsync;
output      out_vsync;
    wire w_linebuffer_valid;
    wire [VIDEO_DATA_WIDTH * OPERATOR_SIZE - 1:0] w_linebuffer_data;
    
    linebuffer #(
        .LINEBUFFER_WIDTH(VIDEO_WIDTH),
        .LINEBUFFER_DEPTH(OPERATOR_SIZE - 1),
        .LINEBUFFER_DATA_WIDTH(VIDEO_DATA_WIDTH)
    )linebuffer_avg_filter_0(
        .in_valid(in_active),
        .in_data(in_data),
        .clk(clk),
        .rst(rst),
        .out_valid(w_linebuffer_valid),
        .out_data(w_linebuffer_data)
    );
//    assign out_linebuffer_valid = w_linebuffer_valid;
    wire w_operator_valid;
    wire [VIDEO_DATA_WIDTH * OPERATOR_SIZE * OPERATOR_SIZE - 1: 0] w_operator_out_data;
    
    operator #(
        .OPERATOR_SIZE(OPERATOR_SIZE), 
        .OPERATOR_DATA_WIDTH(VIDEO_DATA_WIDTH)
    )operator_avg_filter_0(
        .in_valid(w_linebuffer_valid),
        .in_data(w_linebuffer_data),
        .clk(clk),
        .out_valid(w_operator_valid),
        .out_data(w_operator_out_data)    
    );
    
    wire w_avg_kernel_out_valid;
    wire [VIDEO_DATA_WIDTH - 1 : 0] w_avg_kernel_out_data;

    avg_kernel#(.VIDEO_DATA_WIDTH(VIDEO_DATA_WIDTH),
    .OPERATOR_SIZE(OPERATOR_SIZE)
    )avg_kernel_avg_filter_0(
        .in_data(w_operator_out_data),
        .in_valid(w_operator_valid),

        .clk(clk),
        .out_data(w_avg_kernel_out_data),
        .out_valid(w_avg_kernel_out_valid)
    );
    
    assign out_active = w_avg_kernel_out_valid;
    assign out_hsync = w_avg_kernel_out_valid;
    assign out_data = w_avg_kernel_out_data;
    assign out_vsync = in_vsync;
    
endmodule
