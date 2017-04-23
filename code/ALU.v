//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:
//----------------------------------------------
//Date:
//----------------------------------------------
//Description:
//--------------------------------------------------------------------------------

module ALU(
    src1_i,
	src2_i,
	ctrl_i,
	result_o,
	zero_o
	);

//I/O ports
input  [32-1:0]  src1_i;
input  [32-1:0]	 src2_i;
input  [4-1:0]   ctrl_i;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg    [32-1:0]  result_o;
reg             zero_o;

//Parameter
wire equal_in;
/*wire [32-1:0] temp_equal_out; //For the output port of 1-bit ALU
wire [32-1:0] temp_result;    //For the output port of 1-bit ALU
*/
wire [33-1:0] temp_equal_out; //For the output port of 1-bit ALU
wire [33-1:0] temp_result;    //For the output port of 1-bit ALU
wire set_out;                 //For the set output port of 1-bit ALUq
wire src1_extraMSB;
wire src2_extraMSB;

assign src1_extraMSB = (ctrl_i==4'b1111) ? 1'b0 : src1_i[31];
assign src2_extraMSB = (ctrl_i==4'b1111) ? 1'b0 : src2_i[32];
assign equal_in = (&temp_equal_out);
alu_top  alu01(
	.src1(),.src2(),.less(set_out),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu02(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu03(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu04(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu05(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu06(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu07(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu08(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu09(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu10(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu11(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu12(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu13(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu14(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu15(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu16(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu17(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu18(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu19(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu20(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu21(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu22(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu23(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu24(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu25(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu26(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu27(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu28(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu29(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu30(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu31(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_top  alu32(
	.src1(),.src2(),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.equal_out(),
	.result(),
	.cout()
	);
alu_bottom alu33(
	.src1(src1_extraMSB),.src2(src2_extraMSB),.less(),.equal(),.A_invert(),.B_invert(),.cin(),.operation(),
	.set_out(set_out),
	.equal_out(),
	.result(),
	.cout()
	);

//Main function
always @ ( * ) begin
	if(ctrl_i[1:0]==2'b10)
		begin
			zero_o = ~(|temp_result[32-1:0]);
			result_o = temp_result[32-1:0];
		end
	else
		begin
			zero_o = ~(|temp_result[32-1:0]);
			result_o = temp_result[32-1:0];
		end
end
endmodule






