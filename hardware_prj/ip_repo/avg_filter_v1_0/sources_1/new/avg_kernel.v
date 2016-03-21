`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2015 12:55:59 PM
// Design Name: 
// Module Name: avg_kernel
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


module avg_kernel(
        in_data,
        in_valid,

        clk,
        
        out_data,
        out_valid
    );
    parameter VIDEO_DATA_WIDTH = 8;
    parameter OPERATOR_SIZE = 3;
    localparam AVG_SIZE = OPERATOR_SIZE * OPERATOR_SIZE;
    localparam SHIFT_SIZE = 4;
    
   input   [AVG_SIZE * VIDEO_DATA_WIDTH - 1 : 0]  in_data;
   input     in_valid;
   
   input     clk;

   output   [VIDEO_DATA_WIDTH - 1 : 0]   out_data;
   output      out_valid;
   
   
    reg [VIDEO_DATA_WIDTH + SHIFT_SIZE - 1 : 0]r_out_data;
    reg r_out_valid;

    always@(posedge clk)
    begin
        r_out_data <= ((in_data[VIDEO_DATA_WIDTH * 9 - 1 : VIDEO_DATA_WIDTH * (8)] + {in_data[VIDEO_DATA_WIDTH * (8) - 1 : VIDEO_DATA_WIDTH * (7)],1'b0})
                        + (in_data[VIDEO_DATA_WIDTH * (7) - 1 : VIDEO_DATA_WIDTH * (6)] + {in_data[VIDEO_DATA_WIDTH * (6) - 1 : VIDEO_DATA_WIDTH * (5)],1'b0}))
                        + (({in_data[VIDEO_DATA_WIDTH * (5) - 1 : VIDEO_DATA_WIDTH * (4)],2'b00} + {in_data[VIDEO_DATA_WIDTH * (4) - 1 : VIDEO_DATA_WIDTH * (3)],1'b0})
                        + (in_data[VIDEO_DATA_WIDTH * (3) - 1 : VIDEO_DATA_WIDTH * (2)] + {in_data[VIDEO_DATA_WIDTH * (2) - 1 : VIDEO_DATA_WIDTH * (1)],1'b0}))
                        + in_data[VIDEO_DATA_WIDTH * (1) - 1 : 0];
        r_out_valid <= in_valid;
    end

    assign out_data = r_out_data[VIDEO_DATA_WIDTH + SHIFT_SIZE - 1 : SHIFT_SIZE];
    assign out_valid = r_out_valid;
endmodule
