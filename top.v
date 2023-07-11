`timescale 1ns / 10ps

module top (input clk,
				input cs,
				input sck,
				input mosi,
				output [7:0] neuronout);

wire [7:0] dataout0;
wire [7:0] dataout1;
wire [7:0] dataout2;
wire [7:0] dataout3;
wire data_ready;
wire [7:0] datain;

SPI spi(
	.clk(clk), 
	.cs(cs), 
	.sck(sck), 
	.mosi(mosi),
	.received_data(datain),
	.data_ready(data_ready)
);

data data(
	.clk(clk),
	.datain(datain),
	.dataout0(dataout0),
	.dataout1(dataout1),
	.dataout2(dataout2),
	.dataout3(dataout3),
	.data_ready(data_ready)
);

neuron neuron(
	.clk(clk),
	.data_ready(data_ready),
	.data0(dataout0),
	.data1(dataout1),
	.data2(dataout2),
	.data3(dataout3),
	.neuronout(neuronout)
);

				
endmodule 