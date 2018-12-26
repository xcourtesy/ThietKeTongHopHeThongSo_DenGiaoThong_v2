module Control
(
clock1Hz,
clock1KHz,
rst,
R1,
G1,
Y1,
NUM1,
R2,
G2,
Y2,
NUM2
);

input clock1Hz,clock1KHz,rst;
output wire R1,G1,Y1,R2,G2,Y2;
output wire [7:0] NUM1,NUM2;
reg rst1,rst2;

parameter	RedState = 2'b00,
			GreenState = 2'b01,
			YellowState = 2'b10;


FSM DEN1
(
.clock1Hz(clock1Hz),
.rst(rst1),
.initialState(RedState),
.R(R1),
.G(G1),
.Y(Y1),
.NUM(NUM1)
);
defparam DEN1.RedTime = 30;
defparam DEN1.GreenTime = 25;
defparam DEN1.YellowTime = 5;

FSM DEN2
(
.clock1Hz(clock1Hz),
.rst(rst2),
.initialState(GreenState),
.R(R2),
.G(G2),
.Y(Y2),
.NUM(NUM2)
);
defparam DEN2.RedTime = 30;
defparam DEN2.GreenTime = 25;
defparam DEN2.YellowTime = 5;

always @ (rst)
begin
  #20;
  rst1 = rst;
  rst2 = rst;
end


endmodule
