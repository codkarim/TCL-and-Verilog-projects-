//sorry for late i was sick

/*  This Design impelments a signed ALU capable of
    carrying out the signed arithmetic, logic
    functions, Shift functions and Comparison functions */ 
	
/* ALU function is divided into two bits than four bits to provide power and speed
 * in this design we have six modules included ALU_TOP */	

module ALU_TOP 
#(	parameter	OP_DATA_WIDTH = 16 ,
	parameter	ARITH_OUT_WIDTH = OP_DATA_WIDTH + OP_DATA_WIDTH ,
	parameter	LOGIC_OUT_WIDTH = OP_DATA_WIDTH,
	parameter	SHIFT_OUT_WIDTH = OP_DATA_WIDTH,
	parameter 	CMP_OUT_WIDTH = 3 )  	// NOTE DONT PUT Semicolon

(	input	wire 		[OP_DATA_WIDTH - 1:0]		A,
	input	wire		[OP_DATA_WIDTH - 1:0]		B,
	input	wire		[3:0]						ALU_FUNC,
	input	wire									CLK,
	input	wire									RST,
	output	wire		[ARITH_OUT_WIDTH - 1:0]		ARITH_OUT,
	output	wire		[LOGIC_OUT_WIDTH - 1:0]		LOGIC_OUT,
	output	wire		[SHIFT_OUT_WIDTH - 1:0]		SHIFT_OUT,
	output	wire		[CMP_OUT_WIDTH - 1:0]		CMP_OUT,
	output	wire									ARITH_FLAG,
	output	wire									LOGIC_FLAG,
	output	wire									SHIFT_FLAG,
	output	wire									CMP_FLAG );
	
	wire									ARITH_EN;
	wire									LOGIC_EN;
	wire									CMP_EN;
	wire									SHIFT_EN;

//Modules instantiation
Decoder U0 (.IN(ALU_FUNC[3:2]),
			.OUT({SHIFT_EN,CMP_EN,LOGIC_EN,ARITH_EN}) );
			
ARITHMETIC_UNIT # (.OP_DATA_WIDTH_arith(OP_DATA_WIDTH), .ARITH_OUT_WIDTH_arith(ARITH_OUT_WIDTH))
		U1 (.A_arith(A)	,
			.B_arith(B) ,
			.CLK_arith(CLK),
			.RST_arith(RST),
			.arith_enable(ARITH_EN),
			.IN_arith(ALU_FUNC[1:0]),
			.AR_FLAG(ARITH_FLAG),
			.ARITHMETIC_OUT(ARITH_OUT) );

LOGIC_UNIT # (.OP_DATA_WIDTH_log(OP_DATA_WIDTH), .LOGIC_OUT_WIDTH_log(LOGIC_OUT_WIDTH))
		U2 (.A_log(A)	,
			.B_log(B) ,
			.CLK_log(CLK),
			.RST_log(RST),
			.log_enable(LOGIC_EN),
			.IN_log(ALU_FUNC[1:0]),
			.LOG_FLAG(LOGIC_FLAG),
			.log_OUT(LOGIC_OUT) );

CMP_UNIT # (.OP_DATA_WIDTH_comperator(OP_DATA_WIDTH), .CMP_OUT_WIDTH_comperator(CMP_OUT_WIDTH))
		U3 (.A_comperator(A)	,
			.B_comperator(B) ,
			.CLK_comperator(CLK),
			.RST_comperator(RST),
			.comperator_enable(CMP_EN),
			.IN_comperator(ALU_FUNC[1:0]),
			.comperator_FLAG(CMP_FLAG),
			.comperator_out(CMP_OUT) );
			
SHIFT_UNIT # (.OP_DATA_WIDTH_sh(OP_DATA_WIDTH), .SHIFT_OUT_WIDTH_sh(SHIFT_OUT_WIDTH))
		U4 (.A_sh(A) ,
			.B_sh(B) ,
			.CLK_sh(CLK),
			.RST_sh(RST),
			.sh_enable(SHIFT_EN),
			.IN_sh(ALU_FUNC[1:0]),
			.sh_FLAG(SHIFT_FLAG),
			.sh_out(SHIFT_OUT) );


endmodule
