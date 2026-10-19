// this module for shift operations like (shift right ,shift left)

module SHIFT_UNIT

#(	parameter	OP_DATA_WIDTH_sh = 16 ,
	parameter	SHIFT_OUT_WIDTH_sh = OP_DATA_WIDTH_sh)
	
(	input	wire	[OP_DATA_WIDTH_sh -1:0]			A_sh,
	input	wire	[OP_DATA_WIDTH_sh -1:0]			B_sh,
	input	wire									CLK_sh,
	input	wire									RST_sh,
	input	wire									sh_enable,
	input	wire	[1:0]					    	IN_sh,
	output	reg										sh_FLAG,
	output	reg		[SHIFT_OUT_WIDTH_sh -1:0]		sh_out);
	
	always@(posedge CLK_sh or negedge RST_sh)
		begin
			if (!RST_sh)
				sh_out <= 16'b0;
		end
		
	always@(*)
		begin
			if (sh_enable)
				begin
					case(IN_sh)
						2'b00 :begin
									sh_out  = A_sh >> 1 ; 		//shift RIGHT TO A
									sh_FLAG = 1'b1;
							   end
						2'b01 :begin
									sh_out  = A_sh << 1 ;		//shift LEFT TO A
									sh_FLAG = 1'b1;
								end
						2'b10 :begin
									sh_out  = B_sh >> 1 ;		//shift RIGHT TO B
									sh_out  = B_sh >> 1 ;		
									sh_FLAG = 1'b1;
								end
						2'b11 :begin
									sh_out  = B_sh << 1 ;		//shift LEFT TO B
									sh_FLAG = 1'b1;
								end
					endcase				
				end
			else
				begin
					sh_out = 16'b0;
					sh_FLAG = 1'b0;
				end
				
		end	
	
endmodule
