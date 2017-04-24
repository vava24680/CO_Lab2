//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------
//Done
module Simple_Single_CPU(
        clk_i,
		rst_i
		);

//I/O port
input         clk_i;
input         rst_i;

//Internal Signles
/*For SLL instruction*/
wire [32-1:0] shamt;
/*For PC Module*/
wire [32-1:0] pc_number;
wire [32-1:0] pc_number_next;
wire [32-1:0] pc_number_in;
/*For IM Module*/
wire [32-1:0] instruction_o;
/*For Reg_File Module*/
wire [5-1:0]  WriteReg;
wire [32-1:0] RSdata_o;
wire [32-1:0] RTdata_o;
/*For Decoder Module*/
wire RegWrite_o;
wire [3-1:0] ALU_op_o;
wire ALUSrc_o;
wire RegDst_o;
wire Branch_o;
/*For ALU_Ctrl Module*/
wire shift_select;
wire [4-1:0] ALUCtrl_o;
/*For Sign_Extend Module*/
wire [32-1:0] SE_data_o;
/*For ALU Module*/
wire [32-1:0] ALU_src_1;
wire [32-1:0] ALU_src_2;
wire [32-1:0] result_o;
wire zero_o;
/*For Adder2*/
wire [32-1:0] Adder2_result;
/*For Shift_Left_Two_32 Module*/
wire [32-1:0] SL_32_data_o;

wire Brach_signal;
assign shamt = {16'b0,instruction_o[16-1:0]};
assign Brach_signal = Branch_o & zero_o;
assign ALU_src_1=RSdata_o;
//Greate componentes
ProgramCounter PC(
		//Done
        .clk_i(clk_i),
	    .rst_i (rst_i),
	    .pc_in_i(pc_number_in),
	    .pc_out_o(pc_number)
	    );

Adder Adder1(
		//Done
        .src1_i(pc_number),
	    .src2_i(32'd4),
	    .sum_o(pc_number_next)
	    );

Instr_Memory IM(
		//Done
        .pc_addr_i(pc_number),
	    .instr_o(instruction_o)
	    );

MUX_2to1 #(.size(5)) Mux_Write_Reg(
		//Done
        .data0_i(instruction_o[20:16]),
        .data1_i(instruction_o[15:11]),
        .select_i(RegDst_o),
        .data_o(WriteReg)
        );

Reg_File RF(
		//Done
        .clk_i(clk_i),
	    .rst_i(rst_i),
        .RSaddr_i(instruction_o[25:21]),
        .RTaddr_i(instruction_o[20:16]),
        .RDaddr_i(WriteReg),
        .RDdata_i(result_o),
        .RegWrite_i (RegWrite_o),
        .RSdata_o(RSdata_o),
        .RTdata_o(RTdata_o)
        );

Decoder Decoder(
		//Done
        .instr_op_i(instruction_o[31:26]),
	    .RegWrite_o(RegWrite_o),
	    .ALU_op_o(ALU_op_o),
	    .ALUSrc_o(ALUSrc_o),
	    .RegDst_o(RegDst_o),
		.Branch_o(Branch_o)
	    );

ALU_Ctrl AC(
		//Done
        .funct_i(instruction_o[5:0]),
        .ALUOp_i(ALU_op_o),
        .ALUCtrl_o(ALUCtrl_o),
		.shift_select_o(shift_select)
        );

Sign_Extend SE(
		//Done
        .data_i(instruction_o[16-1:0]),
        .data_o(SE_data_o)
        );


/*
MUX_2to1 #(.size(32)) Mux_ALUSrc_1(
		//Done
        .data0_i(RSdata_o),
        .data1_i(shamt),
        .select_i(shift_select),
        .data_o(ALU_src_1)
        );
*/
MUX_2to1 #(.size(32)) Mux_ALUSrc_2(
		//Done
        .data0_i(RTdata_o),
        .data1_i(SE_data_o),
        .select_i(ALUSrc_o),
        .data_o(ALU_src_2)
        );

ALU ALU(
		//Done
		//.rst(rst_i),
        .src1_i(ALU_src_1),
	    .src2_i(ALU_src_2),
	    .ctrl_i(ALUCtrl_o),
	    .result_o(result_o),
		.zero_o(zero_o)
	    );

Adder Adder2(
		//Done
        .src1_i(pc_number_next),
	    .src2_i(SL_32_data_o),
	    .sum_o(Adder2_result)
	    );

Shift_Left_Two_32 Shifter(
		//Done
        .data_i(SE_data_o),
        .data_o(SL_32_data_o)
        );

MUX_2to1 #(.size(32)) Mux_PC_Source(
		//Done
        .data0_i(pc_number_next),
        .data1_i(Adder2_result),
        .select_i(Branch_o & zero_o),
        .data_o(pc_number_in)
        );

endmodule



