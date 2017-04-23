`timescale 1ns/1ps

module compare(
	bonus_control,
	less,
	equal,
	bonus_mux_out
	);
input [3-1:0] bonus_control;
input less;
input equal;

output reg bonus_mux_out;

always @ ( * ) begin
	case(bonus_control)
		3'bzzz://For basic data
			begin
				bonus_mux_out = less&(~equal);
			end
		3'b000://For set less than
			begin
				bonus_mux_out = less&(~equal);
			end
		3'b001://For set greater than
			begin
				bonus_mux_out = (~less)&(~equal);
			end
		3'b010://For set less equal
			begin
				bonus_mux_out = less|equal;
			end
		3'b011://For set greater equal
			begin
				bonus_mux_out = (~less)|equal;
			end
		3'b110://For set equal
			begin
				bonus_mux_out = equal;
			end
		3'b100://For set not equal
			begin
				bonus_mux_out = ~equal;
			end
		default://For other condition
			begin
				bonus_mux_out = 1'b0;
			end
	endcase
end
endmodule