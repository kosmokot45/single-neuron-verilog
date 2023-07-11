`timescale 1ns / 10ps

module sum4 (	input clk,
					input data_ready,
					input [7:0] a0,
					input [7:0] a1,
					input [7:0] a2,
					input [7:0] a3,
					output reg [7:0] q);

reg [9:0] p;

always @(posedge clk) begin
	if(~data_ready) begin
		p = a3 + a2 + a1 + a0;
		q[7:0] = p[9:8] ? 255 : p[7:0];
	end
end

endmodule 