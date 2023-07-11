`timescale 1ns / 10ps

module sigmoida (input clk, input data_ready, input [7:0] sigmoidain, output reg [7:0] sigmoidaout);

reg [8:0] temp;

always @(posedge clk) begin
if(~data_ready) begin
	if (sigmoidain < 128)
	begin
		if (sigmoidain < 25)
		begin
			sigmoidaout <= 0;
		end
		else
		begin
			if (sigmoidain < 107)
			begin
				temp = sigmoidain - 25;
				sigmoidaout = ((temp << 2) + temp) >> 4; 
			end
			else
			begin
				temp = 127 - sigmoidain;
				sigmoidaout = 126 - ((temp << 2) + temp);
			end
		end
	end
	else
	begin
		if (sigmoidain < 148)
		begin
			temp = sigmoidain - 128;
			sigmoidaout = 131 + ((temp << 2) + temp);
		end
		else
		begin
			if (sigmoidain < 230)
			begin
				temp = sigmoidain - 148;
				sigmoidaout = 229 + (((temp << 2) + temp) >> 4);
			end
			else
			begin
				sigmoidaout <= 255;
			end
		end
	end
end
end
endmodule 