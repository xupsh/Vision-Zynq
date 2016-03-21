`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2015 03:43:51 PM
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


module test;

localparam VIDEO_WIDTH = 1280;
localparam VIDEO_HEIGHT = 960;

localparam VIDEO_IN_DATA_WIDTH = 8; 
localparam VIDEO_OUT_DATA_WIDTH = 12; 

localparam SOBEL_OPERATOR_SIZE = 3;
    
    reg in_valid;
    reg [VIDEO_IN_DATA_WIDTH - 1 : 0]   in_data;
    reg clk;
    
    wire out_valid;
    wire  [VIDEO_IN_DATA_WIDTH * 2 + 6: 0]   out_data;
    wire [VIDEO_IN_DATA_WIDTH * SOBEL_OPERATOR_SIZE * SOBEL_OPERATOR_SIZE - 1 : 0]raw_data;
    reg [31 : 0]                      count;

sobel #(
    .VIDEO_WIDTH(VIDEO_WIDTH),
    .VIDEO_IN_DATA_WIDTH(VIDEO_IN_DATA_WIDTH),
    .VIDEO_DATA_WIDTH(VIDEO_DATA_WIDTH),
    .VIDEO_OUT_DATA_WIDTH(VIDEO_OUT_DATA_WIDTH),
    .SOBEL_OPERATOR_SIZE(SOBEL_OPERATOR_SIZE)
)sobel_0_0
    (
    .vid_in_valid(in_valid),
    .vid_in_data(in_data),
    .clk(clk),
    .vid_out_valid(out_valid),
    .vid_out_data(out_data),
    .raw_data(raw_data)
    );
    
    initial begin
        in_valid <= 1'h0;
        in_data <= 8'h0;
        clk <= 1'b0;
        count <= 32'h0;
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
                in_valid <= 1'h1;
            end
            31'd1380,
            31'd2760,
            31'd4140,
            31'd5520:
            begin
                in_valid <= 1'h0;
            end
            default:
            begin
                in_valid <= in_valid;
            end
        endcase
    end
    
    always@(posedge clk)
    begin
        in_data <= in_data + 1'b1;
    end

endmodule