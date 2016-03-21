`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/13/2013 07:19:11 PM
// Design Name: 
// Module Name: vga_driver
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


module vga_driver(
    input vsync_i,
    input hsync_i,
    input valid,
    input [23:0] rgb_i,
    output vsync_o,
    output hsync_o,
    output [4:0] r,
    output [5:0] g,
    output [4:0] b
    
    );
    
 reg vsync_o, hsync_o;
 reg [23:0] rgb_o;
 assign r=rgb_o[23:19];
 assign g=rgb_o[15:10];
 assign b=rgb_o[7:3];
 
 always@(*) begin
     vsync_o <= vsync_i;
     hsync_o <= hsync_i;
     rgb_o <= 24'b00000000_00000000_00000000;
   if(valid==1) begin
    rgb_o <= rgb_i;
   end
 end
    
endmodule
