`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/22/2015 06:25:06 PM
// Design Name: 
// Module Name: linebuffer
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

module linebuffer(
    in_valid,
    in_data,
    clk,
    rst,
    out_valid,
    out_data
    );
    
    parameter LINEBUFFER_WIDTH = 1280;
    parameter LINEBUFFER_DEPTH = 2;
    parameter LINEBUFFER_DATA_WIDTH = 8;
    
    input in_valid;
    input [LINEBUFFER_DATA_WIDTH - 1 : 0] in_data;
    input clk;
    input rst;
    
    output out_valid;
    output [LINEBUFFER_DATA_WIDTH * (LINEBUFFER_DEPTH + 1) - 1 : 0] out_data;
     reg r_valid[LINEBUFFER_DEPTH - 1 : 0];
      reg r_sync_valid[LINEBUFFER_DEPTH : 0];
      wire w_ALMOST_FULL[LINEBUFFER_DEPTH : 0];
      wire [LINEBUFFER_DATA_WIDTH  - 1 : 0] w_data [LINEBUFFER_DEPTH: 0]; 
      wire w_valid[LINEBUFFER_DEPTH : 0];
      reg [LINEBUFFER_DATA_WIDTH * (LINEBUFFER_DEPTH + 1) : 0] r_out_data[LINEBUFFER_DEPTH  + 1: 0];     
  generate
      genvar i;
      localparam  FIFO_D_M_MAX_SIZE = 36864;
      localparam  fifo_depth = (LINEBUFFER_WIDTH < 513)? 513 :
                                  (LINEBUFFER_WIDTH < 1025)? 1025 :
                                  (LINEBUFFER_WIDTH < 2049)? 2049 :
                                  (LINEBUFFER_WIDTH < 4097)? 4097 :
                                  (LINEBUFFER_WIDTH < 8193)? 8193 :
                                  0;      
      initial begin
          if (LINEBUFFER_DATA_WIDTH * (fifo_depth) > FIFO_D_M_MAX_SIZE)begin
              $display("Error: fifo size is out of max FIFO_DUALCLOCK_MACRO size");
                  $finish;
          end
      end
      for(i=0;i<LINEBUFFER_DEPTH;i=i+1)
      begin:fifo_gen
          if(LINEBUFFER_DATA_WIDTH * (fifo_depth) < FIFO_D_M_MAX_SIZE / 2 + 1)begin:fifo18_inst
              FIFO_DUALCLOCK_MACRO  #(
                 .ALMOST_EMPTY_OFFSET(8'h80), 
                 .ALMOST_FULL_OFFSET(fifo_depth - LINEBUFFER_WIDTH),  
                 .DATA_WIDTH(LINEBUFFER_DATA_WIDTH),   
                 .DEVICE("7SERIES"), 
                 .FIFO_SIZE ("18Kb"), 
                 .FIRST_WORD_FALL_THROUGH ("FALSE")
              ) FIFO_DUALCLOCK_MACRO_inst (
                 .ALMOSTFULL(w_ALMOST_FULL[i]),   
                 .DO(w_data[i + 1]),                   
                 .DI(w_data[i]),                 
                 .RDCLK(clk),            
                 .RDEN(w_valid[i + 1]),              
                 .RST(rst),                 
                 .WRCLK(clk),                
                 .WREN(w_valid[i])                
              );
          end
          else if(LINEBUFFER_DATA_WIDTH * (fifo_depth) < FIFO_D_M_MAX_SIZE + 1)begin:fifo36_inst
              FIFO_DUALCLOCK_MACRO  #(
                     .ALMOST_EMPTY_OFFSET(8'h80), 
                     .ALMOST_FULL_OFFSET(fifo_depth - LINEBUFFER_WIDTH), 
                     .DATA_WIDTH(LINEBUFFER_DATA_WIDTH),   
                     .DEVICE("7SERIES"), 
                     .FIFO_SIZE ("36Kb"), 
                     .FIRST_WORD_FALL_THROUGH ("FALSE") 
                  ) FIFO_DUALCLOCK_MACRO_inst (
                     .ALMOSTFULL(w_ALMOST_FULL[i]),  
                     .DO(w_data[i + 1]),                  
                     .DI(w_data[i]),                  
                     .RDCLK(clk),             
                     .RDEN(w_valid[i + 1]),            
                     .RST(rst),                
                     .WRCLK(clk),            
                     .WREN(w_valid[i])               
                  );
          end
      end
  endgenerate  
  
  generate
      for(i=0;i<LINEBUFFER_DEPTH;i=i+1)
      begin:data_sync
          always@(posedge clk)
          begin
              r_out_data[i + 2][(LINEBUFFER_DEPTH + 1) * LINEBUFFER_DATA_WIDTH - 1: (LINEBUFFER_DEPTH - 1-i) * LINEBUFFER_DATA_WIDTH] 
                                      <= {w_data[i + 1], r_out_data[LINEBUFFER_DEPTH - i][(i + 1) * LINEBUFFER_DATA_WIDTH - 1 : 0]};
              r_out_data[LINEBUFFER_DEPTH - i - 1][LINEBUFFER_DATA_WIDTH * (i + 2) - 1: 0] 
                                      <=  r_out_data[i + 2][(LINEBUFFER_DEPTH + 1) * LINEBUFFER_DATA_WIDTH - 1: (LINEBUFFER_DEPTH - 1-i) * LINEBUFFER_DATA_WIDTH];
          end
      end
  endgenerate
  
  generate
      for(i=0;i<LINEBUFFER_DEPTH;i=i+1)
      begin:valid_sync
          always@(posedge clk)
          begin
              r_valid[i] <= w_ALMOST_FULL[i] && w_valid[i];
              r_sync_valid[i + 1] <= r_sync_valid[i];
          end
          assign w_valid[i + 1] = r_valid[i];
      end
  endgenerate
  
  always@(posedge clk)
  begin
      r_out_data[1][(LINEBUFFER_DEPTH + 1) * LINEBUFFER_DATA_WIDTH - 1 : LINEBUFFER_DEPTH * LINEBUFFER_DATA_WIDTH] 
                          <= w_data[0];
      r_out_data[LINEBUFFER_DEPTH][LINEBUFFER_DATA_WIDTH - 1 : 0] 
                          <= r_out_data[1][(LINEBUFFER_DEPTH + 1) * LINEBUFFER_DATA_WIDTH - 1 : LINEBUFFER_DEPTH * LINEBUFFER_DATA_WIDTH];
      r_sync_valid[0] <= w_valid[LINEBUFFER_DEPTH];
  end
      
      assign w_valid[0] = in_valid;
      assign w_data[0] = in_data;
              
      assign out_data = r_sync_valid[LINEBUFFER_DEPTH]?r_out_data[LINEBUFFER_DEPTH + 1]:0;
      assign out_valid = r_sync_valid[LINEBUFFER_DEPTH];
endmodule
