/*  This Design impelments a ALU capable of
    carrying out the unsigned arithmetic, logic
    functions, Shift functions and Comparison functions */ 
module ALU_16B(
	input	wire	[15:0]	A ,
	input	wire	[15:0]	B ,
	input	wire	[3:0]	ALU_FUN ,
	input	wire			CLK ,
	output	reg				carry_flag ,
	output	reg			arith_flag ,
	output	reg			Logic_flag ,
	output	reg			cmp_flag ,
	output	reg			shift_flag ,
	output  reg		[15:0]	ALU_OUT   );

  //internal_signals
	reg		[15:0]	out ;
	
	
	//we use sequential always only for assign (out) signal according to specs
	//ALU Behaviour (RTL Code)
	always@(posedge CLK)
		begin
			ALU_OUT <= out ;			
		end
	
	//we use compinational always for assign flags because he want (out) signal only register not flags
	always@(*)
		begin
		carry_flag = 1'b0;
		out = 1'b0;
		arith_flag=1'b0 ;
		Logic_flag = 1'b0 ;
		cmp_flag = 1'b0 ;
		shift_flag = 1'b0 ; 
		  case (ALU_FUN) 
		    //arthimitic operation (ADD,SUB,MUL,DIV) 
				    4'b0000 :	begin
									      {carry_flag,out} = A + B ;
									      arith_flag =1'b1 ;
								      end
				    4'b0001 :	begin
									      {carry_flag,out} = A - B ;
									      arith_flag =1'b1 ;
								      end
				    4'b0010 :	begin
									      out = A * B ;
									      arith_flag =1'b1 ;
								      end
				    4'b0011 :	begin
									      out = A / B ;
									      arith_flag =1'b1 ;
								      end
								      
						// LOGICAL Operation (AND,OR,NAND,NOR,XOR,XNOR)
				    4'b0100 :	begin
									      out = A & B ;
									      Logic_flag = 1'b1 ;
								      end
				    4'b0101 :	begin
									      out = A | B ;
									      Logic_flag = 1'b1 ;
								      end
				    4'b0110 :	begin
								        out = ~ (A & B) ;
								        Logic_flag = 1'b1 ;
								       end
				    4'b0111 :	begin
									      out = ~ (A | B) ;
									      Logic_flag = 1'b1 ;
								       end
				    4'b1000 :	begin
									      out = A ^ B ;
									      Logic_flag = 1'b1 ;
								      end
				    4'b1001 :	begin
									      out = ~ (A ^ B) ;
									      Logic_flag = 1'b1 ;
								      end
								      
	           // Comparison Operation (EQUAL,GREATER,LESS) 			
				    4'b1010 :	begin
									if(A == B)
											begin
												out = 16'd1  ;
											end
									else	
											begin
												out = 16'd0 ;
											end
									cmp_flag = 1'b1 ;
								end
									
				    4'b1011 :	begin
									if(A > B)
										begin
												out = 16'd2  ;
											end
									else	
											begin
												out = 16'd0 ;
											end
									cmp_flag = 1'b1 ;
								end
				    4'b1100 : 	begin
									if(A < B)
										    begin
												out = 16'd3  ;
											end
									else	
											begin
												out = 16'd0 ;
											end
									cmp_flag = 1'b1 ;
								end
								
				    // SHIFT Operation(shift right, shift left)
				    4'b1101 :	begin
									      out = A >> 1 ;
											shift_flag = 1'b1 ;
								      end
				    4'b1110 :	begin
									      out = A << 1 ;
										  shift_flag = 1'b1 ;
								      end
				    4'b1111 : 	begin
									      out = 16'b0 ;
								       end
			 endcase
		end
	
endmodule