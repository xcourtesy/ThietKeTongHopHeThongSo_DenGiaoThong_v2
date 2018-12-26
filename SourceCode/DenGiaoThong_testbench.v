

module DenGiaoThong_testbench;

reg clock,rst;
wire R1,G1,Y1,R2,G2,Y2;
wire [6:0]			D1Red7Seg0,
					D1Red7Seg1,
					D1Green7Seg0,
					D1Green7Seg1,
					D2Red7Seg0,
					D2Red7Seg1,
					D2Green7Seg0,
					D2Green7Seg1;

DenGiaoThong U1
(
.clock(clock),
.rst(rst),
.R1(R1),
.G1(G1),
.Y1(Y1),
.R2(R2),
.G2(G2),
.Y2(Y2),
.D1Red7Seg0(D1Red7Seg0),
.D1Red7Seg1(D1Red7Seg1),
.D1Green7Seg0(D1Green7Seg0),
.D1Green7Seg1(D1Green7Seg1),
.D2Red7Seg0(D2Red7Seg0),
.D2Red7Seg1(D2Red7Seg1),
.D2Green7Seg0(D2Green7Seg0),
.D2Green7Seg1(D2Green7Seg1)
);


initial
begin
rst = 0;
clock = 0;
#100;
rst = 1;
end

always
#1 clock = !clock;

endmodule