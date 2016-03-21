`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2015 04:02:33 PM
// Design Name: 
// Module Name: morphOp_top
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
/////////////////////////////////////////////////////////////////////////////////
module morphOp_top(
        clk,
        rst,       
        in_active,
        in_data,
        in_hsync,
        in_vsync,
        out_active,
        out_data,
        out_hsync,
        out_vsync
    );
    
 parameter OP_MODE = 1;   
 parameter VIDEO_WIDTH = 1280;
 parameter OPERATOR_SIZE = 3;
 parameter VIDEO_DATA_WIDTH = 8;

 input  clk;
 input  rst;
    
 input in_active;
 input [VIDEO_DATA_WIDTH - 1 : 0] in_data;
 input in_hsync;
 input in_vsync;
 output out_active;
 output [VIDEO_DATA_WIDTH - 1 : 0] out_data;
 output out_hsync;
 output out_vsync;
 
 wire w_linebuffer_valid;
 wire [VIDEO_DATA_WIDTH * OPERATOR_SIZE - 1:0] w_linebuffer_data;
 
 linebuffer #(
     .LINEBUFFER_WIDTH(VIDEO_WIDTH),
     .LINEBUFFER_DEPTH(OPERATOR_SIZE - 1),
     .LINEBUFFER_DATA_WIDTH(VIDEO_DATA_WIDTH)
 )linebuffer_morphOP_0(
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
 )operator_morphOP_0(
     .in_valid(w_linebuffer_valid),
     .in_data(w_linebuffer_data),
     .clk(clk),
     .out_valid(w_operator_valid),
     .out_data(w_operator_out_data)    
 );
 
 wire w_morp_kernel_out_valid;
 wire [VIDEO_DATA_WIDTH - 1 : 0] w_morp_kernel_out_data;    
 
 morpOP_kernel#(
     .OP_MODE(OP_MODE),
     .VIDEO_DATA_WIDTH(VIDEO_DATA_WIDTH),
     .OPERATOR_SIZE(OPERATOR_SIZE)        
  )  morpOP_kernel_0 (
     .clk(clk),
     .in_data(w_operator_out_data),
     .in_valid(w_operator_valid),
     .out_data(w_morp_kernel_out_data),
     .out_valid(w_morp_kernel_out_valid)
 );
 
SRL16E #(
    .INIT(16'h0000) // Initial Value of Shift Register
) SRL16E_active_inst (
    .Q(out_active),       // SRL data output
    .A0(1'b0),     // Select[0] input
    .A1(1'b1),     // Select[1] input
    .A2(1'b1),     // Select[2] input
    .A3(1'b0),     // Select[3] input
    .CE(1'b1),     // Clock enable input
    .CLK(clk),   // Clock input
    .D(in_active)        // SRL data input
); 
 
SRL16E #(
     .INIT(16'h0000) // Initial Value of Shift Register
 ) SRL16E_hsync_inst (
     .Q(out_hsync),       // SRL data output
     .A0(1'b0),     // Select[0] input
     .A1(1'b1),     // Select[1] input
     .A2(1'b1),     // Select[2] input
     .A3(1'b0),     // Select[3] input
     .CE(1'b1),     // Clock enable input
     .CLK(clk),   // Clock input
     .D(in_hsync)        // SRL data input
);  

SRL16E #(
     .INIT(16'h0000) // Initial Value of Shift Register
 ) SRL16E_vsync_inst (
     .Q(out_vsync),       // SRL data output
     .A0(1'b0),     // Select[0] input
     .A1(1'b1),     // Select[1] input
     .A2(1'b1),     // Select[2] input
     .A3(1'b0),     // Select[3] input
     .CE(1'b1),     // Clock enable input
     .CLK(clk),   // Clock input
     .D(in_vsync)        // SRL data input
); 

assign out_data = w_morp_kernel_out_valid?w_morp_kernel_out_data:0;

endmodule
