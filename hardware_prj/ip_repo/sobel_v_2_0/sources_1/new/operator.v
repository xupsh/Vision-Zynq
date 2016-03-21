`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2015 03:15:15 PM
// Design Name: 
// Module Name: operator
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


module operator(
    in_valid,
    in_data,
    clk,
    out_valid,
    out_data
    );
    
parameter OPERATOR_SIZE = 3;
parameter OPERATOR_DATA_WIDTH = 8;   
input in_valid;
input [OPERATOR_DATA_WIDTH * OPERATOR_SIZE - 1 : 0] in_data;
input clk;
output out_valid;
output [OPERATOR_DATA_WIDTH * OPERATOR_SIZE * OPERATOR_SIZE - 1 : 0]out_data;    

reg [OPERATOR_DATA_WIDTH * OPERATOR_SIZE - 1 : 0] r_shifter [OPERATOR_SIZE - 2 : 0];
reg [OPERATOR_DATA_WIDTH * OPERATOR_SIZE * OPERATOR_SIZE - 1 : 0] r_out_data; 
reg r_out_valid;

always@(posedge clk)
begin
    r_shifter[0] <= in_valid?in_data:r_shifter[0];
end

generate
    genvar i;
    for(i = 1; i < OPERATOR_SIZE; i = i + 1)
    begin:r_shifter_run
        always@(posedge clk)
        begin
            r_shifter[i] <= in_valid?r_shifter[i-1]:r_shifter[i];
        end 
    end
endgenerate

always@(posedge clk)
begin
    r_out_valid <= in_valid;
    r_out_data[OPERATOR_DATA_WIDTH * OPERATOR_SIZE  - 1 : 0]    <= in_valid?in_data:0;
end

generate
    genvar j;
    for(j=1;j<OPERATOR_SIZE;j=j+1)
    begin:r_out_data_sync
        always@(posedge clk)
        begin
        r_out_data[(j+1) * OPERATOR_DATA_WIDTH * OPERATOR_SIZE - 1 : j * OPERATOR_DATA_WIDTH * OPERATOR_SIZE] = in_valid?r_shifter[j-1]:0;
        end
    end
endgenerate

assign out_valid = r_out_valid;
assign out_data = r_out_data;

endmodule
