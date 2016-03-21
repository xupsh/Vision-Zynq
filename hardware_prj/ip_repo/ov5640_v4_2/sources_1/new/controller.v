`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2015 06:27:08 PM
// Design Name: 
// Module Name: controller
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


module controller(
        in_hsync,
        in_vsync,
        clk,
        rst,
        mode,
        out_vsync
  //      out_hsync
    );
    
    input in_hsync;
    input in_vsync;
    input clk;
    input rst;
    output [1 : 0]mode;
    output out_vsync;
 //   output out_hsync;
    
    reg pre_hsync;
    reg pre_vsync;
    reg r_vsync;
    reg r_vsync_flag;
    reg r_hsync_flag;
    
    reg [11:0] r_xPOS;
    reg [11:0] r_yPOS;
    
    always@(posedge clk)
    begin
        pre_hsync <= in_hsync;
        pre_vsync <= in_vsync;
    end
    
    always@(posedge clk)
    begin
        if(({pre_vsync, in_vsync}) == 2'b01) begin
            r_vsync <= 1'b1;
            r_vsync_flag <= 1'b1;
        end else if(({pre_vsync, in_vsync}) == 2'b10) begin
            r_vsync <= 1'b0;
            r_vsync_flag <= 1'b0;
        end else begin
            r_vsync <= 1'b0;
            r_vsync_flag <= r_vsync_flag;
        end 
    end
    
    always@(posedge clk)
    begin
        if(in_hsync && r_vsync_flag) begin
            r_xPOS <= r_xPOS + 1'b1;
        end else begin
            r_xPOS <= 16'h0;
        end
    end
    
    always@(posedge clk)
    begin
        if({pre_hsync, in_hsync} == 2'b01 && r_vsync_flag) begin
             r_yPOS <= r_yPOS +1'b1;
        end else if(r_vsync_flag) begin
            r_yPOS <= r_yPOS;
        end else begin
            r_yPOS <= 0;
        end
    end
    
    SRL16E #(
          .INIT(16'h0000) // Initial Value of Shift Register
       ) SRL16E_xPOS_inst (
          .Q(mode[0]),       // SRL data output
          .A0(1'b1),     // Select[0] input
          .A1(1'b0),     // Select[1] input
          .A2(1'b1),     // Select[2] input
          .A3(1'b0),     // Select[3] input
          .CE(1'b1),     // Clock enable input
          .CLK(clk),   // Clock input
          .D(pre_hsync?r_xPOS[0]:1'b0)        // SRL data input
       );
       
   SRL16E #(
        .INIT(16'h0000) // Initial Value of Shift Register
    ) SRL16E_yPOS_inst (
        .Q(mode[1]),       // SRL data output
        .A0(1'b1),     // Select[0] input
        .A1(1'b0),     // Select[1] input
        .A2(1'b1),     // Select[2] input
        .A3(1'b0),     // Select[3] input
        .CE(1'b1),     // Clock enable input
        .CLK(clk),   // Clock input
        .D(pre_hsync?r_yPOS[0]:1'b0)        // SRL data input
    );
    
    SRL16E #(
            .INIT(16'h0000) // Initial Value of Shift Register
        ) SRL16E_vsync_inst (
            .Q(out_vsync),       // SRL data output
            .A0(1'b1),     // Select[0] input
            .A1(1'b1),     // Select[1] input
            .A2(1'b1),     // Select[2] input
            .A3(1'b0),     // Select[3] input
            .CE(1'b1),     // Clock enable input
            .CLK(clk),   // Clock input
            .D(r_vsync)        // SRL data input
        );
    //mode   [1:0]      {pre_hsync?r_yPOS[0],r_xPOS[0]:2'b00}
    //assign out_vsync = r_vsync;
   // assign out_hsync = pre_hsync;
endmodule
