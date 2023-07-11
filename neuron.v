`timescale 1ns / 10ps

module neuron (input clk,
					input data_ready,
					input [7:0] data0,
					input [7:0] data1,
					input [7:0] data2,
					input [7:0] data3,
					output [7:0] neuronout);
					
wire [7:0] q0,q1,q2,q3; // провод от ves к sum4
wire [7:0] w0,w1,w2,w3;
wire [7:0] sumres; 		//провод от sum4 к sigmoida
wire [7:0] sigres;

wire [7:0] data0_toves;
wire [7:0] data1_toves;
wire [7:0] data2_toves;
wire [7:0] data3_toves;

assign data0_toves = data0;
assign data1_toves = data1;
assign data2_toves = data2;
assign data3_toves = data3;
					
reg [7:0] weight0 = 1;
reg [7:0] weight1 = 1;
reg [7:0] weight2 = 1;
reg [7:0] weight3 = 1;

assign w0 = weight0;
assign w1 = weight1;
assign w2 = weight2;
assign w3 = weight3;

assign neuronout = sigres;

ves ves0(.clk(clk),.data_ready(data_ready),.a(data0_toves),.w(w0),.q(q0));
ves ves1(.clk(clk),.data_ready(data_ready),.a(data1_toves),.w(w1),.q(q1));
ves ves2(.clk(clk),.data_ready(data_ready),.a(data2_toves),.w(w2),.q(q2));
ves ves3(.clk(clk),.data_ready(data_ready),.a(data3_toves),.w(w3),.q(q3));

sum4 sum4(.clk(clk),.data_ready(data_ready),.a0(q0),.a1(q1),.a2(q2),.a3(q3),.q(sumres));

sigmoida sigmoida(.clk(clk),.data_ready(data_ready),.sigmoidain(sumres),.sigmoidaout(sigres));
	
		
endmodule 