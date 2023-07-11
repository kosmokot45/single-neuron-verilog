`timescale 1ns / 10ps

module data (	input clk,
					input [7:0] datain,
					input data_ready,
					output reg [7:0] dataout0,
					output reg [7:0] dataout1,
					output reg [7:0] dataout2,
					output reg [7:0] dataout3);
					
reg [1:0] cnt = 2'b00;


always @(posedge clk) begin
	if(~data_ready) begin
	
//		if (cnt == 2'b00) begin dataout0 = datain; cnt <= cnt + 2'b01; end
//		else if (cnt == 2'b01) begin dataout1 = datain; cnt <= cnt + 2'b01; end
//		else if (cnt == 2'b10) begin dataout2 = datain; cnt <= cnt + 2'b01; end
//		else if (cnt == 2'b11) begin dataout3 = datain; cnt <= cnt + 2'b01; end
	
		case(cnt)
			2'b00 : begin dataout0 = datain; cnt <= cnt + 2'b01; end
			2'b01 : begin dataout1 = datain; cnt <= cnt + 2'b01; end
			2'b10 : begin dataout2 = datain; cnt <= cnt + 2'b01; end
			2'b11 : begin dataout3 = datain; cnt <= cnt + 2'b01; end
		endcase
	end
end 

endmodule 