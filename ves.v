`timescale 1ns / 10ps
 
module ves (input clk,
				input data_ready,
				input [7:0] a,
				input [7:0] w,
				output reg [7:0] q);

reg [15:0] p;//res

always @(posedge clk) begin
	if (~data_ready) begin
		p = a * w;
		q[7:0] = p[15:8] ? 255 : p[7:0];
	end
end

endmodule 