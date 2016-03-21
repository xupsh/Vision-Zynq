`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2015 03:03:36 PM
// Design Name: 
// Module Name: sobel
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


module sobel(
    vid_in_valid,
    vid_in_data,
    vid_in_hsync,
    vid_in_vsync,
    clk,
    rst,
    vid_out_valid,
    vid_out_data,
    vid_out_hsync,
    vid_out_vsync
    );

parameter VIDEO_WIDTH = 1280;
parameter VIDEO_HEIGHT = 960;
parameter VIDEO_IN_DATA_WIDTH = 8; 
parameter  VIDEO_OUT_DATA_WIDTH = 12;

localparam  SOBEL_OPERATOR_SIZE = 3;


input vid_in_valid;
input [VIDEO_IN_DATA_WIDTH - 1 : 0] vid_in_data;
input clk;
input rst;
input vid_in_hsync;
input vid_in_vsync;

output vid_out_valid;
output [VIDEO_OUT_DATA_WIDTH - 1 : 0]vid_out_data;
output vid_out_hsync;
output vid_out_vsync;

wire w_lbuf_out_valid;
wire [VIDEO_IN_DATA_WIDTH * SOBEL_OPERATOR_SIZE - 1 : 0] w_lbuf_out_data;

linebuffer #(
    .LINEBUFFER_WIDTH(VIDEO_WIDTH), 
    .LINEBUFFER_DATA_WIDTH(VIDEO_IN_DATA_WIDTH), 
    .LINEBUFFER_DEPTH(SOBEL_OPERATOR_SIZE - 1)
)linebuffer_0_0 (
  .in_valid(vid_in_valid && vid_in_hsync),    
  .in_data(vid_in_data),      
  .clk(clk),  
  .rst(rst),            
  .out_valid(w_lbuf_out_valid),  
  .out_data(w_lbuf_out_data)   
);

wire w_operator_valid;
wire [VIDEO_IN_DATA_WIDTH * SOBEL_OPERATOR_SIZE * SOBEL_OPERATOR_SIZE - 1 : 0] w_operator_out_data;

operator #(
    .OPERATOR_SIZE(SOBEL_OPERATOR_SIZE), 
    .OPERATOR_DATA_WIDTH(VIDEO_IN_DATA_WIDTH)
)operator_0_0(
    .in_valid(w_lbuf_out_valid),
    .in_data(w_lbuf_out_data),
    .clk(clk),
    .out_valid(w_operator_valid),
    .out_data(w_operator_out_data)    
);

wire w_convolution_valid;
wire [VIDEO_OUT_DATA_WIDTH - 1 : 0]w_convolution_Gx;
wire [VIDEO_OUT_DATA_WIDTH - 1 : 0]w_convolution_Gy;

convolution_3x3#(
    .CONVOLUTION_DATA_WIDTH(VIDEO_IN_DATA_WIDTH),
    . CONVOLUTION_OUT_DATA_WIDTH(VIDEO_OUT_DATA_WIDTH),
    .CONVOLUTION_OPERATOR_SIZE(SOBEL_OPERATOR_SIZE)
)convolution_3x3_0_0(
    .in_valid(w_operator_valid),
    .in_data(w_operator_out_data),
    .clk(clk),
    .out_valid(w_convolution_valid),
    .Gx(w_convolution_Gx),
    .Gy(w_convolution_Gy)
    );

wire w_gradient_out_valid;
wire [VIDEO_OUT_DATA_WIDTH - 1 : 0]w_gradient_out_data;

gradient#(.GRADIENT_DATA_WIDTH(VIDEO_OUT_DATA_WIDTH)
)gradient_0_0(
    .in_valid(w_convolution_valid),
    .Gx(w_convolution_Gx),
    .Gy(w_convolution_Gy),
    .clk(clk),
    .out_valid(w_gradient_out_valid),
    .out_data(w_gradient_out_data)
    );
    
assign vid_out_valid = w_gradient_out_valid;
assign vid_out_data = w_gradient_out_data;
assign vid_out_vsync = vid_in_vsync;
assign vid_out_hsync = w_gradient_out_valid;

endmodule
