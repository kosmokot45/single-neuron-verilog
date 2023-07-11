`timescale 1ns / 10ps
 
module synchronization (input clk,
								input sck,
								input cs,
								output sck_r,
								output sck_f,
								output cs_r,
								output cs_f,
								output cs_sync);
								
reg [2:0] sck_shiftreg;
reg [2:0] cs_shiftreg;

always @(negedge clk) begin
	sck_shiftreg <= {sck_shiftreg[1:0], sck};
	cs_shiftreg <= {cs_shiftreg[1:0], cs};
end

assign sck_r = (sck_shiftreg[2:1] == 2'b01);
assign sck_f = (sck_shiftreg[2:1] == 2'b10);

assign cs_r = (cs_shiftreg[2:1] == 2'b01);
assign cs_f =(cs_shiftreg[2:1] == 2'b10);

assign cs_sync = cs_shiftreg[2];

endmodule 