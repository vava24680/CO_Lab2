//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o
	);

//I/O ports
input  [6-1:0] instr_op_i;

output         RegWrite_o;
output [3-1:0] ALU_op_o;
output         ALUSrc_o;
output         RegDst_o;
output         Branch_o;

//Internal Signals
reg    [3-1:0] ALU_op_o;
reg            ALUSrc_o;
reg            RegWrite_o;
reg            RegDst_o;
reg            Branch_o;

//Parameter


//Main function
always @ ( * ) begin
	case (instr_op_i)
		6'b000000://R-type
			begin
				/*{ALU_op_o,ALUSrc_o,RegWrite_o,RegDst_o,Branch_o}=7'b0000110;*/
				ALU_op_o = 3'b000;
				ALUSrc_o = 1'b0;
				RegWrite_o = 1'b1;
				RegDst_o = 1'b1;
				Branch_o = 1'b0;
			end
		6'b000100://Branch Equal
			begin
				//{ALU_op_o,ALUSrc_o,RegWrite_o,RegDst_o,Branch_o}=7'b0010001;
				ALU_op_o = 3'b001;
				ALUSrc_o = 1'b0;
				RegWrite_o = 1'b0;
				RegDst_o = 1'b0;
				Branch_o = 1'b1;
			end
		6'b000101://Brach not Equal
			begin
				ALU_op_o = 3'b010;
				ALUSrc_o = 1'b0;
				RegWrite_o = 1'b0;
				RegDst_o = 1'b0;
				Branch_o = 1'b1;
			end
		6'b001000://Addi
			begin
				//{ALU_op_o,ALUSrc_o,RegWrite_o,RegDst_o,Branch_o}=7'b0101100;
				ALU_op_o = 3'b011;
				ALUSrc_o = 1'b1;
				RegWrite_o = 1'b1;
				RegDst_o = 1'b0;
				Branch_o = 1'b0;
			end
		6'b001111://For LUI
			begin
				ALU_op_o = 3'b100;
				ALUSrc_o = 1'b1;
				RegWrite_o = 1'b1;
				RegDst_o = 1'b0;
				Branch_o = 1'b0;
			end
		6'b001101://For ORI
			begin
				ALU_op_o = 3'b101;
				ALUSrc_o = 1'b1;
				RegWrite_o = 1'b1;
				RegDst_o = 1'b0;
				Branch_o = 1'b0;
			end
		default:
			begin
				{ALU_op_o,ALUSrc_o,RegWrite_o,RegDst_o,Branch_o}=7'bxxxxxxx;
			end
	endcase
end
endmodule






