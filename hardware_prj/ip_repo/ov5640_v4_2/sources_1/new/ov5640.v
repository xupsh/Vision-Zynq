`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2015 07:03:29 PM
// Design Name: 
// Module Name: ov5640
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


module ov5640(
    in_data,
    in_vsync,
    in_hsync,
    out_ena,
    out_xclk,
    
    clk,
    clk24,
    rst,
    
    out_data,
    out_vsync,
    out_hsync,
    out_active
//    mode,
//    out_linebuffer_valid
    );
    
    parameter VIDEO_WIDTH = 1280;
    parameter VIDEO_DATA_WIDTH = 8;
    localparam OPERATOR_SIZE = 3;
    
    /*cap io interface*/
    input [VIDEO_DATA_WIDTH - 1:0] in_data;
    input in_vsync;
    input in_hsync;
    output out_ena;
    output out_xclk;
    
    input clk;
    input clk24;
    input rst;
    
    /*vid io interface*/
    output [VIDEO_DATA_WIDTH * OPERATOR_SIZE - 1:0] out_data;
    output out_vsync;
    output out_hsync;
    output out_active;
    
 //   output [1:0] mode;
//    output out_linebuffer_valid;
    
    wire [1:0] w_controller_mode;
    wire w_controller_vsync;
 //   wire w_controller_hsync;    
    controller controller_ov5640_0(
        .in_hsync(in_hsync),
        .in_vsync(in_vsync),
        .clk(clk),
        .rst(rst),
        .mode(w_controller_mode),
        .out_vsync(w_controller_vsync)
 //       .out_hsync(w_controller_hsync)
    );
    
    
    wire w_linebuffer_valid;
    wire [VIDEO_DATA_WIDTH * OPERATOR_SIZE - 1:0] w_linebuffer_data;
    
    linebuffer #(
        .LINEBUFFER_WIDTH(VIDEO_WIDTH),
        .LINEBUFFER_DEPTH(OPERATOR_SIZE - 1),
        .LINEBUFFER_DATA_WIDTH(VIDEO_DATA_WIDTH)
    )linebuffer_ov5640_0(
        .in_valid(in_hsync),
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
    )operator_ov5640_0(
        .in_valid(w_linebuffer_valid),
        .in_data(w_linebuffer_data),
        .clk(clk),
        .out_valid(w_operator_valid),
        .out_data(w_operator_out_data)    
    );
    
    wire [VIDEO_DATA_WIDTH * OPERATOR_SIZE - 1:0] w_cfa_data;
    wire w_cfa_valid;
    
    cfa cfa_ov5640_0(
            .in_data(w_operator_out_data),
            .in_valid(w_operator_valid),
            .in_mode(w_controller_mode),
            .clk(clk),
            .out_data(w_cfa_data),
            .out_valid(w_cfa_valid)
    );
    assign out_data = w_cfa_data;
    assign out_vsync = w_controller_vsync;
    assign out_hsync = w_cfa_valid;
    assign out_active = w_cfa_valid;
    assign clk24 = out_xclk;
    assign out_ena = 1;
//    assign mode = w_controller_mode;
endmodule
