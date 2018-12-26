
module Display
(
rst,
clock1KHz,
R,
NUM,
Red7Seg0,
Red7Seg1,
Green7Seg0,
Green7Seg1
);

input R,rst,clock1KHz;
input [7:0] NUM;
output wire [6:0] Red7Seg0,Red7Seg1,Green7Seg0,Green7Seg1;
reg [4:0] NUMR1,NUMR0,NUMG1,NUMG0;
parameter OFF = 5'b11111;

SevenSegment Red1
(
.clock(clock1KHz),
.NUM(NUMR1),
.SEG(Red7Seg1)
);

SevenSegment Red0
(
.clock(clock1KHz),
.NUM(NUMR0),
.SEG(Red7Seg0)
);

SevenSegment Green1
(
.clock(clock1KHz),
.NUM(NUMG1),
.SEG(Green7Seg1)
);

SevenSegment Green0
(
.clock(clock1KHz),
.NUM(NUMG0),
.SEG(Green7Seg0)
);


always @ (negedge clock1KHz or posedge rst)
begin 
	if(rst == 1)
	if(R == 1)
		begin
			NUMR1 = NUM/10;
			NUMR0 = NUM - (NUM/10)*10;
			NUMG1 = OFF;
			NUMG0 = OFF;
		end
	else if(R == 0)
		begin
			NUMG1 = NUM/10;
			NUMG0 = NUM - (NUM/10)*10;
			NUMR1 = OFF;
			NUMR0 = OFF;
		end
end
endmodule
