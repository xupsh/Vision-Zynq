`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/19/2015 10:15:27 AM
// Design Name: 
// Module Name: gray2rgb
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


module gray2rgb(
        vid_in_active,
        vid_in_data,
        vid_in_hsync,
        vid_in_vsync,
        clk,
        
        vid_out_active,
        vid_out_data,
        vid_out_hsync,
        vid_out_vsync
    );
    parameter VIDEO_GRAY_DATA_WIDTH = 8;
    parameter VIDEO_RGB_DATA_WIDTH = VIDEO_GRAY_DATA_WIDTH * 3;
    
    input vid_in_active;
    input [VIDEO_GRAY_DATA_WIDTH - 1 : 0] vid_in_data;
    input vid_in_hsync;
    input vid_in_vsync;
    input clk;
    
    output vid_out_active;
    output [VIDEO_RGB_DATA_WIDTH - 1 : 0] vid_out_data;
    output vid_out_hsync;
    output vid_out_vsync;
    
    assign vid_out_active = vid_in_active;
    assign vid_out_hsync = vid_in_hsync;
    assign vid_out_vsync = vid_in_vsync;
    assign vid_out_data = {vid_in_data,vid_in_data,vid_in_data};
    
endmodule
