module SevenSegment
(
clock,
NUM,
SEG
);
parameter OFF = 5'b11111;
input [4:0] NUM;
input clock;
output reg [6:0] SEG;

always @ (negedge clock)
begin
	case(NUM)
		5'd0: SEG = 7'b1000000;
		5'd1: SEG = 7'b1111001;
		5'd2: SEG = 7'b0100100;
		5'd3: SEG = 7'b0110000;
		5'd4: SEG = 7'b0011001;
		5'd5: SEG = 7'b0010010;
		5'd6: SEG = 7'b0000010;
		5'd7: SEG = 7'b1111000;
		5'd8: SEG = 7'b0000000;
		5'd9: SEG = 7'b0010000;
		default: SEG = 7'b1111111;
	endcase
end

endmodule
