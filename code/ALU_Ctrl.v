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
          ALUCtrl_o
          );

//I/O ports
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;

//Internal Signals
reg        [4-1:0] ALUCtrl_o;

//Parameter


//Select exact operation
always @ ( * ) begin
	case(ALUOp_i)
		3'b000://R-type
			begin
				case(funct_i)
					6'd32: ALUCtrl_o=4'b0010;//Addition
					6'd34: ALUCtrl_o=4'b0110;//Subtraction
					6'd36: ALUCtrl_o=4'b0000;
					6'd37: ALUCtrl_o=4'b0001;
					6'd42: ALUCtrl_o=4'b0111;
					6'd43: ALUCtrl_o=4'b1111; //For sltu still thinking, maybe change the 1-bit ALU turth table which is designed for slt instruction
					/*
					For advanced instruction
					*/
				endcase
			end
		3'b001://Branch
			begin
				ALUCtrl_o=4'b0110;
			end
		3'b010://Addi
			begin
				ALUCtrl_o=4'b0010;
			end
		default:
			begin
				ALUCtrl_o=4'bxxxx;
			end
	endcase
end
endmodule






