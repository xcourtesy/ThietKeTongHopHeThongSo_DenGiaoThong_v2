
module BoDem
(
clock,
rst,
COUNT,
NUM,
trigger
);

input clock,rst;
input wire [7:0] COUNT;
output reg [7:0] NUM;
output reg trigger;


always @ (negedge clock or negedge rst)
begin
	if(rst == 0)
		begin
			NUM = COUNT;
			trigger = 1;
		end
	else
		
		begin
			if (NUM == 1)
				trigger = 0;
			else
				NUM = NUM - 1;
		end
end
endmodule
