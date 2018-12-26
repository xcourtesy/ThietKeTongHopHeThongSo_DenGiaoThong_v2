module DenGiaoThong
(
clock,
rst,
R1,
G1,
Y1,
R2,
G2,
Y2,
D1Red7Seg0,
D1Red7Seg1,
D1Green7Seg0,
D1Green7Seg1,
D2Red7Seg0,
D2Red7Seg1,
D2Green7Seg0,
D2Green7Seg1
);

input clock,rst;
output wire R1,G1,Y1,R2,G2,Y2;
output wire [6:0]	D1Red7Seg0,
					D1Red7Seg1,
					D1Green7Seg0,
					D1Green7Seg1,
					D2Red7Seg0,
					D2Red7Seg1,
					D2Green7Seg0,
					D2Green7Seg1;
wire [7:0] NUM1,NUM2;
wire clock1Hz,clock1KHz;

FreqDivision T1a
(
.clockIn(clock),
.rst(rst),
.clockOut(clock1Hz)
);
defparam T1a.SCALE = 10;

FreqDivision T1b
(
.clockIn(clock),
.rst(rst),
.clockOut(clock1KHz)
);
defparam T1b.SCALE = 2;

Control T2
(
.clock1Hz(clock1Hz),
.clock1KHz(clock1KHz),
.rst(rst),
.R1(R1),
.G1(G1),
.Y1(Y1),
.NUM1(NUM1),
.R2(R2),
.G2(G2),
.Y2(Y2),
.NUM2(NUM2)
);


Display T3DEN1
(
.clock1KHz(clock1KHz),
.rst(rst),
.R(R1),
.NUM(NUM1),
.Red7Seg0(D1Red7Seg0),
.Red7Seg1(D1Red7Seg1),
.Green7Seg0(D1Green7Seg0),
.Green7Seg1(D1Green7Seg1)
);

Display T3DEN2
(
.clock1KHz(clock1KHz),
.rst(rst),
.R(R2),
.NUM(NUM2),
.Red7Seg0(D2Red7Seg0),
.Red7Seg1(D2Red7Seg1),
.Green7Seg0(D2Green7Seg0),
.Green7Seg1(D2Green7Seg1)
);



endmodule
