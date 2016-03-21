`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2015 09:51:41 PM
// Design Name: 
// Module Name: gradient
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


module gradient(
    in_valid,
    Gx,
    Gy,
    clk,
    out_valid,
    out_data
    );
parameter GRADIENT_DATA_WIDTH = 12;

input   in_valid;
input [GRADIENT_DATA_WIDTH - 1 : 0] Gx;
input [GRADIENT_DATA_WIDTH - 1 : 0] Gy;
input clk;

output out_valid;
output  [GRADIENT_DATA_WIDTH - 1 : 0] out_data;

wire [GRADIENT_DATA_WIDTH * 2 -1 : 0] w_squares_Gx;
wire [GRADIENT_DATA_WIDTH * 2 -1 : 0] w_squares_Gy;

reg r_shifter_valid[1:0];

mult_gen_0 squares_0_x_0 (
  .CLK(clk),  // input wire CLK
  .A(Gx),      // input wire [11 : 0] A
  .B(Gx),      // input wire [11 : 0] B
  .P(w_squares_Gx)      // output wire [23 : 0] P
);

mult_gen_0 squares_0_y_0 (
  .CLK(clk),  // input wire CLK
  .A(Gy),      // input wire [11 : 0] A
  .B(Gy),      // input wire [11 : 0] B
  .P(w_squares_Gy)      // output wire [23 : 0] P
);

wire [GRADIENT_DATA_WIDTH * 2 : 0] w_squares_sum;

c_addsub_1 squares_sum_0 (
  .A(w_squares_Gx),      // input wire [23 : 0] A
  .B(w_squares_Gy),      // input wire [23 : 0] B
  .CLK(clk),  // input wire CLK
  .S(w_squares_sum)      // output wire [24 : 0] S
);

always@(posedge clk)
begin
    r_shifter_valid[0] <= in_valid;
    r_shifter_valid[1] <= r_shifter_valid[0];
end

cordic_0 sqrt_gradient_0 (
  .aclk(clk),                                        
  .s_axis_cartesian_tvalid(r_shifter_valid[1]),  
  .s_axis_cartesian_tdata(w_squares_sum),   
  .m_axis_dout_tvalid(out_valid),           
  .m_axis_dout_tdata(out_data)         
);


endmodule
