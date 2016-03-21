`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2015 07:18:58 PM
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
                wire out_xclk;
                wire out_ena;
                reg clk24;
                reg clk;
                reg rst;
                reg [8 - 1 : 0] in_data;
                reg in_vsync;
                reg in_hsync;
                wire [23:0] out_data;
                wire out_vsync;
                wire out_hsync;
                wire out_active;
                wire [1:0] mode;
                wire out_linebuffer_valid;
                reg     [31: 0]        count;

    ov5640 u30(
                .in_data(in_data),
                .in_vsync(in_vsync),
                .in_hsync(in_hsync),
                .out_ena(out_ena),
                .out_xclk(out_xclk),
                
                .clk(clk),
                .clk24(clk24),
                .rst(rst),
               
                .out_data(out_data),
                .out_vsync(out_vsync),
                .out_hsync(out_hsync),
                .out_active(out_active)
             //   .mode(mode),
            //    .out_linebuffer_valid(out_linebuffer_valid)
        );

        
        initial begin
            in_data <= 8'h0;
            in_hsync <= 1'b0;
            in_vsync <= 1'b0;
            count <= 32'h0;
            rst <= 1'b0;   
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
            case(count)
                31'd80:
                begin
                    in_vsync <= 1'b1;
                    in_hsync <= in_hsync;
                end
                31'd100,
                31'd1480,
                31'd2860,
                31'd4240:
                begin
                    in_hsync <= 1'b1;
                    in_vsync <= in_vsync;
                end
                31'd1380,
                31'd2760,
                31'd4140,
                31'd5520:
                begin
                    in_hsync <= 1'b0;
                    in_vsync <= in_vsync;
                end
                default:
                begin
                    in_hsync <= in_hsync;
                    in_vsync <= in_vsync;
                end
            endcase
        end
        
        always@(posedge clk)
        begin
            in_data <= in_data + 1'b1;
            count <= count + 1'b1;
        end
       
endmodule
