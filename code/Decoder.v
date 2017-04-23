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
				{ALU_op_o,ALUSrc_o,RegWrite_o,RegDst_o,Branch_o}=7'b0000110;
			end
		6'b000100://Branch
			begin
				{ALU_op_o,ALUSrc_o,RegWrite_o,RegDst_o,Branch_o}=7'b0010001;
			end
		6'b001000://Addi
			begin
				{ALU_op_o,ALUSrc_o,RegWrite_o,RegDst_o,Branch_o}=7'b0101100;
			end
		/*6'b001111:
			begin

			end
		6'b001101:
			begin

			end
		*/
		default:
			begin
				{ALU_op_o,ALUSrc_o,RegWrite_o,RegDst_o,Branch_o}=7'bxxxxxxx;
			end
	endcase
end
endmodule






