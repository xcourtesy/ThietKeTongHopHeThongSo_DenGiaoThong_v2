module FSM
(
clock1Hz,
rst,
initialState,		//Khi reset, trang thai bat dau do mode quyet dinh
R,
G,
Y,
NUM
);

input clock1Hz,rst;
input [1:0] initialState;
output reg R,G,Y;
output wire [7:0] NUM;
reg rstCounter;
reg [7:0] COUNT;
reg [1:0] currentState,nextState;
wire trigger;

parameter 	RedTime = 8'd25,
			GreenTime = 8'd30,
			YellowTime = 8'd5;

BoDem COUNTER
(
.clock(clock1Hz),
.rst(rstCounter),
.COUNT(COUNT),
.NUM(NUM),
.trigger(trigger)
);


always @ (negedge trigger or negedge rst)
begin
	if(rst == 0)
		begin
			currentState <= initialState;
		end
	else
	  begin
		  currentState <= nextState;
		end
end




always @ (currentState or rst)
begin
	case(currentState)
		2'b00 : begin  R = 1; G = 0; Y = 0; COUNT = RedTime; end
		2'b01 : begin  R = 0; G = 1; Y = 0; COUNT = GreenTime;  end
		2'b10 : begin  R = 0; G = 0; Y = 1; COUNT = YellowTime;  end
	endcase
	rstCounter = 0;
	if(rst == 1)
	 begin
	   #1 rstCounter = 1;
	 end
end

always @ (currentState)
begin
	case(currentState)
		2'b00 : nextState = 2'b01;
		2'b01 : nextState = 2'b10;
		2'b10 : nextState = 2'b00;
	endcase
end
endmodule
