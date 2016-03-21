`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2015 05:39:45 PM
// Design Name: 
// Module Name: cfa
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


module cfa(
        in_data,
        in_valid,
        in_mode,
        clk,
        out_data,
        out_valid
    );
    parameter VIDEO_DATA_WIDTH = 8;
    localparam TEMP_RGB_DATA_WIDTH = VIDEO_DATA_WIDTH + 2;
    
    input [71 : 0] in_data;
    input in_valid;
    input [1:0]in_mode;
    input clk;
   
    output [23:0] out_data;
    output out_valid;
    
    reg 	[TEMP_RGB_DATA_WIDTH - 1 : 0] 	r_RED;
    reg     [TEMP_RGB_DATA_WIDTH - 1 : 0]     r_GREEN;
    reg     [TEMP_RGB_DATA_WIDTH - 1 : 0]     r_BLUE;
    reg     [8 * 9 - 1 : 0] r_data;
    reg   [8 - 1 : 0]  r_Hg;
    reg   [8 - 1 : 0]  r_Vg;
    reg   [8 - 1 : 0] r_D1;
    reg   [8 - 1 : 0] r_D2;
    
    reg r_valid[1:0];
    
    always@(posedge clk)
    begin
        r_valid[0] <= in_valid;
        r_valid[1] <= r_valid[0];
        r_data <= in_data;
    end
  
    always@(posedge clk)
    begin
        r_Hg <= in_data[63:56] > in_data[15:8] ? in_data[63:56] - in_data[15:8] : in_data[15:8] - in_data[63:56];
        r_Vg <= in_data[47:40] > in_data[31:24] ? in_data[47:40] - in_data[31:24] : in_data[31:24] - in_data[47:40];
        
        r_D1 <= in_data[71:64] > in_data[7:0] ? in_data[71:64] - in_data[7:0] : in_data[7:0] - in_data[71:64];
        r_D2 <= in_data[23:16] > in_data[55:48] ? in_data[23:16] - in_data[55:48] : in_data[55:48] - in_data[23:16];
    end
  
    always@(posedge clk)
    begin
        case(in_mode)
        2'b10:begin   
            r_RED[TEMP_RGB_DATA_WIDTH - 1 : 2]   <= r_data[39:32];
            
            if(r_Hg > r_Vg) begin
                r_GREEN[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[47:40] + r_data[31:24]);
            end else if(r_Hg < r_Vg)begin
                r_GREEN[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[63:56] + r_data[15:8]);
            end else begin
                r_GREEN <= (r_data[47:40] + r_data[31:24]) + (r_data[63:56] + r_data[15:8]);
            end
            
            if(r_D1 > r_D2)begin
                r_BLUE[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[55:48] + r_data[23:16]);
            end else if(r_D1 < r_D2)begin
                r_BLUE[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[71:64] + r_data[7:0]);
            end else begin
                r_BLUE <= (r_data[71:64] + r_data[7:0]) + (r_data[55:48] + r_data[23:16]);
            end
        end
        2'b11:begin
            r_RED[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[63:56] + r_data[15:8]);
            
            r_GREEN[TEMP_RGB_DATA_WIDTH - 1 : 2] <= r_data[39:32];
            
            r_BLUE[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[47:40] + r_data[31:24]);
        end
        2'b00:begin
            r_RED[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[47:40] + r_data[31:24]);
            
            r_GREEN[TEMP_RGB_DATA_WIDTH - 1 : 2] <= r_data[39:32];
            
            r_BLUE[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[63:56] + r_data[15:8]);
        end
        2'b01:begin
            if(r_D1 > r_D2)begin
                r_RED[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[55:48] + r_data[23:16]);
            end else if(r_D1 < r_D2)begin
                r_RED[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[71:64] + r_data[7:0]);
            end else begin
                r_RED <= (r_data[71:64] + r_data[7:0]) + (r_data[55:48] + r_data[23:16]);
            end
            
            if(r_Hg > r_Vg) begin
                r_GREEN[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[47:40] + r_data[31:24]);
            end else if(r_Hg < r_Vg)begin
                r_GREEN[TEMP_RGB_DATA_WIDTH - 1 : 1] <= (r_data[63:56] + r_data[15:8]);
            end else begin
                r_GREEN <= (r_data[47:40] + r_data[31:24]) + (r_data[63:56] + r_data[15:8]);
            end
            
            r_BLUE[TEMP_RGB_DATA_WIDTH - 1 : 2] <= r_data[39:32];
        end
        default: ;
        endcase
    end
    
    assign out_data = {r_RED[TEMP_RGB_DATA_WIDTH - 1 : 2], r_GREEN[TEMP_RGB_DATA_WIDTH - 1 : 2], r_BLUE[TEMP_RGB_DATA_WIDTH - 1 : 2]};
    assign out_valid = r_valid[1];
endmodule
