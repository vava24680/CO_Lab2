//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o,
		  shift_select_o
          );

//I/O ports
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;
output shift_select_o;
//Internal Signals
reg        [4-1:0] ALUCtrl_o;
reg shift_select_o;
//Parameter

/*ALUCtrl_o signal corresponding to What kind of operation
------------------------
ALUCtrl_o,operation    -
   0000  ,   AND       -
   0001  ,   OR        -
   0010  ,   ADD       -
   0011  ,   Shift_Left-
   0100  ,   LUI       -
   0101  ,   N/A       -
   0110  ,   SUB,BEQ   -
   0111  ,   SLT       -
   1000  ,   N/A       -
   1001  ,   N/A       -
   1010  ,   N/A       -
   1011  ,   N/A       -
   1100  ,   N/A       -
   1101  ,   N/A       -
   1110  ,   BNE       -
   1111  ,   SLTU      -
------------------------
*/
//Select exact operation

always @ ( * ) begin
	case(ALUOp_i)
		3'b000://R-type
			begin
				case(funct_i)
					6'd32: {shift_select_o,ALUCtrl_o}=5'b00010;//Addition
					6'd34: {shift_select_o,ALUCtrl_o}=5'b00110;//Subtraction
					6'd36: {shift_select_o,ALUCtrl_o}=5'b00000;//AND
					6'd37: {shift_select_o,ALUCtrl_o}=5'b00001;//OR
					6'd42: {shift_select_o,ALUCtrl_o}=5'b00111;//SLT
					6'd43: {shift_select_o,ALUCtrl_o}=5'b01111; //For sltu still thinking, maybe change the 1-bit ALU turth table which is designed for slt instruction
					6'd0: {shift_select_o,ALUCtrl_o}=5'b10011;
					6'd4: {shift_select_o,ALUCtrl_o}=5'b00011;
				endcase
			end
		3'b001://Branch
			begin
				{shift_select_o,ALUCtrl_o} = 5'b00110;
			end
		3'b010://Branch not Equal
			begin
				{shift_select_o,ALUCtrl_o} = 5'b01110;
			end
		3'b011://Addi
			begin
				{shift_select_o,ALUCtrl_o} = 5'b00010;
			end
		3'b100://LUI
			begin
				{shift_select_o,ALUCtrl_o} = 5'b00100;
			end
		3'b101://ORI
			begin
				{shift_select_o,ALUCtrl_o} = 5'b00001;
			end
		default:
			begin
				ALUCtrl_o=4'bxxxx;
			end
	endcase
end
endmodule






