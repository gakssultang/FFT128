`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/12/27 15:11:16
// Design Name: 
// Module Name: Counter
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

module Counter(
    input 			 nrst,clk,start,
    input 			 valid,
    output reg [6:0] cnt
    );


always@(posedge clk)
    if(!nrst)
        cnt <= 7'b1111111;
    else if ((!start)&&valid)
        cnt <= 7'b1111111; 
    else if (valid)
        cnt<= cnt +1;

        
endmodule
