// this module for Arithmetic operations like (addition ,subtraction,multiplication ,division)

module ARITHMETIC_UNIT
#(	parameter	OP_DATA_WIDTH_arith = 16,
	parameter	ARITH_OUT_WIDTH_arith = OP_DATA_WIDTH_arith + OP_DATA_WIDTH_arith)

(	input	wire	signed	[OP_DATA_WIDTH_arith -1:0]		A_arith,
	input	wire	signed	[OP_DATA_WIDTH_arith -1:0]		B_arith,
	input	wire											CLK_arith,
	input	wire											RST_arith,
	input	wire											arith_enable,
	input	wire			[1:0]					    	IN_arith,
	output	reg												AR_FLAG,
	output	reg				[ARITH_OUT_WIDTH_arith -1:0]	ARITHMETIC_OUT );

	reg		[ARITH_OUT_WIDTH_arith -1:0]	out_ar;

	
	always@(posedge CLK_arith or negedge RST_arith)
		begin
			if (!RST_arith)
				ARITHMETIC_OUT <= 32'b0;
			else
				ARITHMETIC_OUT <= out_ar ;
		end
		
		
	always@(*)
		begin
			if (arith_enable)
				begin
					case(IN_arith)
						2'b00 :begin
									out_ar = A_arith + B_arith ; 		//ADD
									AR_FLAG = 1'b1;
							   end
						2'b01 :begin
									out_ar = A_arith - B_arith ;		//SUB
									AR_FLAG = 1'b1;
								end
						2'b10 :begin
									out_ar = A_arith * B_arith ;		//MUL
									AR_FLAG = 1'b1;
								end
						2'b11 :begin
									out_ar = A_arith / B_arith ;		//DIV
									AR_FLAG = 1'b1;
								end
					endcase				
				end
			else
				begin
					out_ar = 32'b0;
					AR_FLAG = 1'b0;
				end
				
		end





endmodule
