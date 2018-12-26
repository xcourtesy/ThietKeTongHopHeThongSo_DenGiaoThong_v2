module FreqDivision
(
clockIn,
rst,
clockOut
);

parameter SCALE = 50000000;
parameter threshold = SCALE / 2;

reg [31:0] count;

input clockIn,rst;
output reg clockOut;

always @ (negedge clockIn or negedge rst)
begin
	if(rst == 0)
		begin 
		  count <= 0;
		  clockOut <= 0;
		end 
	else
		if(count == threshold - 1)
		  begin
			count <= 0;
			clockOut <= !clockOut;
			end
		else
			count <= count + 1;
end

endmodule
