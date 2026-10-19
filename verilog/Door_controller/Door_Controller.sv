module Door_Controller (
	input  	wire	UP_max,
	input  	wire	activate,
	input  	wire	DN_max,
	input  	wire	CLK,
	input  	wire	RST,
	output  reg		UP_M,
	output	reg		DN_M
);
	
	typedef enum  bit [1:0]  {	IDLE  = 2'b00,
								Mv_Up = 2'b01,
								Mv_Dn = 2'b11
								
	}	state_e;
	
	state_e	current,next;

	always @(posedge CLK or negedge RST)
		begin
			if (!RST)
				current <= IDLE;
			else
				current <= next;
		end

	always @(*)
		begin
			case (current)
				IDLE :	begin
						if (activate && UP_max && !DN_max)
							begin
								UP_M = 0;
								DN_M = 1;
								next = Mv_Dn ;
							end	
						else if (activate && DN_max && !UP_max)
							begin
								UP_M = 1;
								DN_M = 0;
								next = Mv_Up ;
							end	
						else
							begin
								UP_M = 0;
								DN_M = 0;
								next = IDLE ;
							end		
						end
						
				Mv_Up : begin
						if (UP_max)
							begin
								UP_M = 0;
								DN_M = 0;
								next = IDLE ;
							end	
						else
							begin
								UP_M = 1;
								DN_M = 0;
								next = Mv_Up ;
							end	
						end
						
				Mv_Dn : begin
						if (DN_max)
							begin
								UP_M = 0;
								DN_M = 0;
								next = IDLE;
							end	
						else
							begin
								UP_M = 0;
								DN_M = 1;
								next = Mv_Dn;
							end
						end	
					
				default :begin
							UP_M = 0;
							DN_M = 0;
							next = IDLE ;
						end	
							
			endcase				
		end



endmodule