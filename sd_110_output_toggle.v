`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2024 08:33:49
// Design Name: 
// Module Name: sd_110_output_toggle
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


module sd_110_output_toggle(clk,rst,in,out);
input clk,rst,in;
output out;
parameter s0 = 3'b000, s1 = 3'b001, s2= 3'b010, s3 = 3'b011, s4 = 3'b100, s5 = 3'b101;
reg [2:0] present_state, next_state;
always@(posedge clk)
begin
  if (rst)
    present_state <= s0;
  else
    present_state <= next_state;
end
always@(in or present_state)
begin
  next_state = s0;
  case(present_state)
  s0: if (in) next_state <= s1;
    else next_state <= s0;
  s1: if (in) next_state <= s2;
    else next_state <= s1;
  s2: if (!in) next_state <= s3;
    else next_state <= s2;
  s3: if (in) next_state <= s4;
    else next_state <= s3;
  s4: if (in) next_state <= s5;
    else next_state <= s3;
  s5: if (!in) next_state <= s0;
    else next_state <= s5;
    endcase
end
assign out = (present_state == s3) || (present_state == s4) || (present_state == s5);

endmodule
