// this module for comperators operations like (NOP,EQUAL,GREATER,LESS)
module CMP_UNIT
#(	parameter	OP_DATA_WIDTH_comperator = 16 ,
	parameter	CMP_OUT_WIDTH_comperator = 3)
	
(	input	wire	[OP_DATA_WIDTH_comperator -1:0]			A_comperator,
	input	wire	[OP_DATA_WIDTH_comperator -1:0]			B_comperator,
	input	wire											CLK_comperator,
	input	wire											RST_comperator,
	input	wire											comperator_enable,
	input	wire	[1:0]					    			IN_comperator,
	output	reg										        comperator_FLAG,
	output	reg		[CMP_OUT_WIDTH_comperator -1:0]			comperator_out);
	
	
	always@(posedge CLK_comperator or negedge RST_comperator)
		begin
			if (!RST_comperator)
				comperator_out <= 2'b0;
		end
		
	always@(*)
		begin
			if (comperator_enable)
				begin
					case(IN_comperator)
						2'b00 :begin     						//NOP
									comperator_out  = 2'b0;   
									comperator_FLAG = 1'b1;
							   end
						2'b01 :begin
										if(A_comperator == B_comperator)		//equal
												begin
													comperator_out = 2'd1  ;
												end
										else	
												begin
													comperator_out = 2'd0 ;
												end
										comperator_FLAG = 1'b1;
								end
						2'b10 :begin
										if(A_comperator > B_comperator) 		//greater
												begin
													comperator_out = 2'd2  ;
												end
										else	
												begin
													comperator_out = 2'd0 ;
												end
										comperator_FLAG = 1'b1;
								end
						2'b11 :begin
										if(A_comperator < B_comperator)			//less
												begin
													comperator_out = 2'd3  ;
												end
										else	
												begin
													comperator_out = 2'd0 ;
												end
										comperator_FLAG = 1'b1;
								end
					endcase				
				end
			else
				begin
					comperator_out = 2'b0;
					comperator_FLAG = 1'b0;
				end
				
		end
		
endmodule	
