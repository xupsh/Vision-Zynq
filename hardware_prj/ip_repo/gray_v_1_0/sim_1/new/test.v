`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2015 04:09:50 PM
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

reg clk;
reg in_valid;
reg hsync;
reg vsync;
reg [23:0] in_data;
reg [31:0] count;

wire vid_out_active;
wire vid_out_hsync;
wire vid_out_vsync;
wire [7:0] vid_out_gray;
wire [15:0] P;
wire [15:0] P_1;
wire [15:0] P_2;
wire [15:0] S;

rgb2gray_wrapper rgb2gray_wrapper_0_0(
    .CLK(clk),
    .P(P),
    .P_1(P_1),
    .P_2(P_2),
    .S(S),
    .vid_in_active(in_valid),
    .vid_in_hsync(hsync),
    .vid_in_rgb(in_data),
    .vid_in_vsync(vsync),
    .vid_out_active(vid_out_active),
    .vid_out_gray(vid_out_gray),
    .vid_out_hsync(vid_out_hsync),
    .vid_out_vsync(vid_out_vsync)
    );

initial begin
        in_valid <= 1'h0;
        hsync <= 1'b0;
        in_data <= 24'h0;
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
                hsync <= 1'b1;
            end
            31'd1380,
            31'd2760,
            31'd4140,
            31'd5520:
            begin
                in_valid <= 1'h0;
                hsync <= 1'b0;
            end
            default:
            begin
                in_valid <= in_valid;
                hsync <= hsync;
            end
        endcase
    end
    
    always@(posedge clk)
    begin
        if(count == 31'd50)
        begin
            in_data <= 24'h0;
        end
        else
        begin
            in_data <= in_data + 24'h0a0a0a;
        end
    end


endmodule
