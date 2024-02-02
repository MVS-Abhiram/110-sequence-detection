`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2024 08:41:06
// Design Name: 
// Module Name: sd_110_output_toggle_tb
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


module sd_110_output_toggle_tb();
reg clk,rst,in;
wire out;
sd_110_output_toggle uut (clk,rst,in,out);
initial begin
  clk = 1'b0;
  while(1)
  #5 clk = ~clk;
end

task initialize();
begin
  {rst, in} = 2'b10;
end
endtask

task reset();
begin
  @(negedge clk)
  rst = 1'b1;
  @(negedge clk)
  rst = 1'b0;
end
endtask

task inputs(input x);
begin
  @(negedge clk)
  in = x;
end
endtask

initial begin
  initialize();
  reset();
  #10;
  inputs(1'b1);
  inputs(1'b1);
  inputs(1'b0);
  #10;
  inputs(1'b1);
  inputs(1'b1);
  inputs(1'b0);
end
endmodule
