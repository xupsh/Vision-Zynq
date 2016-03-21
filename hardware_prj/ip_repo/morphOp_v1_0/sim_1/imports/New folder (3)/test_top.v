`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2015 01:25:50 PM
// Design Name: 
// Module Name: test
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


module test();

localparam VIDEO_WIDTH = 1280;
localparam VIDEO_DATA_WIDTH = 8;
    
    reg in_active;
    reg in_hsync;
    reg in_vsync;
    reg [VIDEO_DATA_WIDTH - 1 : 0]   in_data;
    reg clk;
    reg rst;
    wire out_active;
    wire out_hsync;
    wire out_vsync;
    wire  [VIDEO_DATA_WIDTH - 1 : 0]   out_data;
//    wire [71:0] out_data1;
    reg [31 : 0]                      count;

morphOp_top morphOp_top_0(
    .in_active(in_active),
    .in_hsync(in_hsync),
    .in_vsync(in_vsync),
    .in_data(in_data),
    .clk(clk),
    .rst(rst),
    .out_active(out_active),
    .out_hsync(out_hsync),
    .out_vsync(out_vsync),
    .out_data(out_data)
//    .out_data1(out_data1)
    );
   
    initial begin
        in_active <= 1'h0;
        in_hsync <= 1'b0;
        in_data <= 8'h0;
        clk <= 1'b0;
        count <= 32'h0;
        in_vsync <= 0;
        rst <= 0;
    end
    
     parameter PERIOD = 10;
     always begin
         clk <= 1'b0;
         #(PERIOD/2); 
         clk <= 1'b1;
         #(PERIOD/2);
     end

    always@(posedge clk)
    begin
        count <= count + 1'b1;
    end
    
    always@(posedge clk)
    begin
        case(count)
            31'd100,
            31'd1480,
            31'd2860,
            31'd4240:
            begin
                in_active <= 1'h1;
                in_hsync <= 1'h1;
            end
            31'd1380,
            31'd2760,
            31'd4140,
            31'd5520:
            begin
                in_active <= 1'h0;
                in_hsync <= 1'h0;
            end
            default:
            begin
                in_active <= in_active;
                in_hsync <= in_hsync;
            end
        endcase
    end
    
    always@(posedge clk)
    begin
        in_data <=~in_data;
    end

endmodule
