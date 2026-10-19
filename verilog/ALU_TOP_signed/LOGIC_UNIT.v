// this module for logical operations like (AND,OR,NAND,NOR)

module LOGIC_UNIT
#(	parameter	OP_DATA_WIDTH_log = 16 ,
	parameter	LOGIC_OUT_WIDTH_log= OP_DATA_WIDTH_log)
	
(	input	wire	[OP_DATA_WIDTH_log -1:0]		A_log,
	input	wire	[OP_DATA_WIDTH_log -1:0]		B_log,
	input	wire									CLK_log,
	input	wire									RST_log,
	input	wire									log_enable,
	input	wire	[1:0]					    	IN_log,
	output	reg										LOG_FLAG,
	output	reg		[LOGIC_OUT_WIDTH_log -1:0]		log_OUT );
	
	
	always@(posedge CLK_log or negedge RST_log)
		begin
			if (!RST_log)
				log_OUT <= 16'b0;
		end
		
	always@(*)
		begin
			if (log_enable)
				begin
					case(IN_log)
						2'b00 :begin
									log_OUT  = A_log & B_log ;		//AND
									LOG_FLAG = 1'b1;
							   end
						2'b01 :begin
									log_OUT  = A_log | B_log ;		//OR
									LOG_FLAG = 1'b1;
								end
						2'b10 :begin
									log_OUT  = ~(A_log & B_log) ;	//NAND
									LOG_FLAG = 1'b1;
								end
						2'b11 :begin
									log_OUT  = ~(A_log | B_log) ;	//NOR
									LOG_FLAG = 1'b1;
								end
					endcase				
				end
			else
				begin
					log_OUT = 16'b0;
					LOG_FLAG = 1'b0;
				end
				
		end
		
		
		

endmodule