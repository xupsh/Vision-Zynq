`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2015 04:32:16 PM
// Design Name: 
// Module Name: convolution_3x3
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


module convolution_3x3(
    in_valid,
    in_data,
    clk,
    out_valid,
    Gx,
    Gy
    );

        
parameter CONVOLUTION_DATA_WIDTH = 8;
parameter CONVOLUTION_OUT_DATA_WIDTH = 12;
parameter CONVOLUTION_OPERATOR_SIZE = 3;

input in_valid;
input [CONVOLUTION_OPERATOR_SIZE * CONVOLUTION_OPERATOR_SIZE * CONVOLUTION_DATA_WIDTH - 1 : 0] in_data;
input clk;
output out_valid;
output [CONVOLUTION_OUT_DATA_WIDTH - 1 : 0] Gx;
output [CONVOLUTION_OUT_DATA_WIDTH - 1 : 0] Gy;

wire [CONVOLUTION_OUT_DATA_WIDTH - 1 : 0] r_Gx_temp [1:0];
wire [CONVOLUTION_OUT_DATA_WIDTH - 1 : 0] r_Gy_temp [1:0];

reg [CONVOLUTION_OUT_DATA_WIDTH - 1 : 0] r_Gx;
reg [CONVOLUTION_OUT_DATA_WIDTH - 1 : 0] r_Gy;

reg r_shifter_valid [2:0];
/*  in_data format
    71:64       47:40       23:16
    63:56       39:32       15:08
    55:48       31:24       07:00
*/

wire [CONVOLUTION_OUT_DATA_WIDTH - 1 : 0] r_Gx_add_temp [1:0];
wire [CONVOLUTION_OUT_DATA_WIDTH - 1 : 0] r_Gy_add_temp [1:0];

reg [CONVOLUTION_DATA_WIDTH - 1 : 0] r_shifter_in_data [2:0];

c_addsub_0 Gx_add_0_0 (
  .A({3'b000,in_data[47 : 40],1'b0}), 
  .B({4'b0000,in_data[71 : 64]}),
  .CLK(clk),
  .S(r_Gx_add_temp[0])
);

c_addsub_0 Gx_add_0_1 (
  .A({3'b000,in_data[31 : 24],1'b0}),
  .B({4'b0000,in_data[55 : 48]}),
  .CLK(clk),
  .S(r_Gx_add_temp[1])
);


c_addsub_0 Gy_add_0_0 (
  .A({3'b000,in_data[63 : 56],1'b0}),
  .B({4'b0000,in_data[71 : 64]}),
  .CLK(clk),
  .S(r_Gy_add_temp[0])
);

c_addsub_0 Gy_add_0_1 (
  .A({3'b000,in_data[15 : 8],1'b0}),
  .B({4'b0000,in_data[23 : 16]}),
  .CLK(clk),
  .S(r_Gy_add_temp[1])
);

always@(posedge clk)
begin
    r_shifter_valid[0] <= in_valid;
    r_shifter_in_data[0] <= in_data[23 : 16];
    r_shifter_in_data[1] <= in_data[7 : 0];
    r_shifter_in_data[2] <= in_data[55 : 48];
end

c_addsub_0 Gx_add_1_0 (
  .A(r_Gx_add_temp[0]),
  .B({4'b0000,r_shifter_in_data[0]}),
  .CLK(clk),
  .S(r_Gx_temp[0])
);

c_addsub_0 Gx_add_1_1 (
  .A(r_Gx_add_temp[1]),
  .B({4'b0000,r_shifter_in_data[1]}),
  .CLK(clk),
  .S(r_Gx_temp[1])
);

c_addsub_0 Gy_add_1_0 (
  .A(r_Gy_add_temp[0]),
  .B({4'b0000,r_shifter_in_data[2]}),
  .CLK(clk),
  .S(r_Gy_temp[0])
);

c_addsub_0 Gy_add_1_1 (
  .A(r_Gy_add_temp[1]),
  .B({4'b0000,r_shifter_in_data[1]}),
  .CLK(clk),
  .S(r_Gy_temp[1])
);

always@(posedge clk)
begin
    r_shifter_valid[1] <= r_shifter_valid[0];
end

always@(posedge clk)
begin
    r_shifter_valid[2] <= r_shifter_valid[1];
    
	r_Gx <= r_Gx_temp[0] > r_Gx_temp[1]? r_Gx_temp[0] - r_Gx_temp[1] : r_Gx_temp[1] - r_Gx_temp[0];
    r_Gy <= r_Gy_temp[0] > r_Gy_temp[1] ? r_Gy_temp[0] - r_Gy_temp[1] : r_Gy_temp[1] - r_Gy_temp[0];
end

assign out_valid = r_shifter_valid[2];
assign Gx = r_Gx;
assign Gy = r_Gy;

endmodule
