`timescale 1ns / 10ps

module SPI (input clk,
				input cs,
				input sck, 
				input mosi,
				output data_ready,
				output reg [7:0] received_data);

wire SPI_start;
wire SPI_stop;
wire sck_r;
wire sck_f;
wire cs_s;
wire data_read = sck_r;

reg [7:0] data;

always @(posedge data_read) begin
	if (~cs_s) begin 
		data <= {data[6:0], mosi};
	end 
	received_data <= data;
end

assign data_ready = cs_s;

//assign received_data = data;

synchronization i_dut0(
	.clk(clk),
	.sck(sck),
	.cs(cs),
	.sck_r(sck_r),
	.sck_f(sck_f),
	.cs_r(SPI_stop),
	.cs_f(SPI_start),
	.cs_sync(cs_s));

endmodule 