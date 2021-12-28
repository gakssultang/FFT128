`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/28 13:22:20
// Design Name: 
// Module Name: BF
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



module BF 
#(
    parameter BW =16
)(
    input signed [BW-2:0] Gr,Gi,Hr,Hi,
    output signed[BW-1:0] Xr,Xi,Yr,Yi
);    
    assign Xr = Gr+Hr;
    assign Xi = Gi+Hi;
    assign Yr = Gr-Hr;
    assign Yi = Gi-Hi;
    
endmodule
