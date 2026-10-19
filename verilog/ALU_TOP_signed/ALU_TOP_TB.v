//time_unit = 1us & time percision = 1ns
`timescale 1us/1ns
module ALU_TOP_TB ();

//testbench parameters

parameter	OP_DATA_WIDTH_TB   = 16 ;
parameter	ARITH_OUT_WIDTH_TB = OP_DATA_WIDTH_TB + OP_DATA_WIDTH_TB ;
parameter	LOGIC_OUT_WIDTH_TB = OP_DATA_WIDTH_TB ;
parameter	SHIFT_OUT_WIDTH_TB = OP_DATA_WIDTH_TB ;
parameter 	CMP_OUT_WIDTH_TB   = 3 ;

// parameter for clock period
parameter	CLK_PERIOD  = 10 ;
parameter	HIGH_PERIOD = 0.6 * CLK_PERIOD ;
parameter	LOW_PERIOD  = 0.4 * CLK_PERIOD ;

//declare TB Signals
//inputs
	reg 		signed		[OP_DATA_WIDTH_TB - 1:0]		A_TB;
	reg			signed		[OP_DATA_WIDTH_TB - 1:0]		B_TB;
	reg						[3:0]							ALU_FUNC_TB;
	reg														CLK_TB;
	reg														RST_TB;
//outputs	
	wire		signed		[ARITH_OUT_WIDTH_TB - 1:0]		ARITH_OUT_TB;
	wire					[LOGIC_OUT_WIDTH_TB - 1:0]		LOGIC_OUT_TB;
	wire					[SHIFT_OUT_WIDTH_TB - 1:0]		SHIFT_OUT_TB;
	wire					[CMP_OUT_WIDTH_TB - 1:0]		CMP_OUT_TB;
//flags	
	wire													ARITH_FLAG_TB;
	wire													LOGIC_FLAG_TB;
	wire													SHIFT_FLAG_TB;
	wire													CMP_FLAG_TB;
	
	
	
//internal signal and concatenate flags	
	wire [3:0] flags ;
	assign flags = {ARITH_FLAG_TB,LOGIC_FLAG_TB,CMP_FLAG_TB,SHIFT_FLAG_TB};

//initial block
	initial
		begin
			$dumpfile("ALU_TOP.vcd"); // waveforms in this file 
			$dumpvars; 				 // saves all waveforms 
			CLK_TB = 1'b0 ;
			RST_TB = 1'b0 ;
			
			#CLK_PERIOD
			RST_TB =1'b1;
			ALU_FUNC_TB = 4'b0000;
			A_TB   = -'d4 ;
			B_TB   = -'d10 ;
			$display("TEST CASE 1  : ADDITION WITH Two negative Variables");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == -'d14)
				$display ("TEST CASE 1 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 1 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
				
			A_TB   = 'd5 ;	
			B_TB   = -'d10 ;
			$display("TEST CASE 2  : ADDITION WITH a pos Variable(A) and a neg variable(B)");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == -'d5)
				$display ("TEST CASE 2 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 2 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
				
					
			A_TB   = -'d20 ;	
			B_TB   = 'd70 ;
			$display("TEST CASE 3  : ADDITION WITH a neg Variable(A) and a pos variable(B)");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == 'd50)
				$display ("TEST CASE 3 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 3 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
				
			A_TB   = 'd30 ;	
			B_TB   = 'd70 ;
			$display("TEST CASE 4  : ADDITION WITH Two positive Variables");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == 'd100)
				$display ("TEST CASE 4 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 4 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);	
		
		
			ALU_FUNC_TB = 4'b0001 ;	
			A_TB   = -'d10 ;	
			B_TB   = -'d5 ;
			$display("TEST CASE 5  : SUBTRACTION WITH Two negative Variables");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == -'d5)
				$display ("TEST CASE 5 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 5 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
		
		
			A_TB   = 'd10 ;	
			B_TB   = -'d5 ;
			$display("TEST CASE 6  : SUBTRACTION WITH a pos Variable(A) and a neg variable(B)");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == 'd15)
				$display ("TEST CASE 6 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 6 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
		
		
			A_TB   = -'d10 ;	
			B_TB   = 'd5 ;
			$display("TEST CASE 7  : SUBTRACTION WITH a neg Variable(A) and a pos variable(B)");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == -'d15)
				$display ("TEST CASE 7 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 7 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
		 
		 
			A_TB   = 'd10 ;	
			B_TB   = 'd5 ;
			$display("TEST CASE 8  : SUBTRACTION WITH Two positive Variables");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == 'd5)
				$display ("TEST CASE 8 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 8 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
				
				
			ALU_FUNC_TB = 4'b0010;
			A_TB   = -'d10 ;	
			B_TB   = -'d5 ;
			$display("TEST CASE 9  : multiplication WITH Two negative Variables");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == 'd50)
				$display ("TEST CASE 9 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 9 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
				
			A_TB   = 'd5 ;	
			B_TB   = -'d5 ;
			$display("TEST CASE 10  : multiplication WITH a pos Variable(A) and a neg variable(B)");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == -'d25)
				$display ("TEST CASE 10 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 10 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
		
		
			A_TB   = -'d8 ;	
			B_TB   = 'd25 ;
			$display("TEST CASE 11  : multiplication WITH a neg Variable(A) and a pos variable(B)");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == -'d200)
				$display ("TEST CASE 11 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 11 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
		 
		 
			A_TB   = 'd10 ;	
			B_TB   = 'd10 ;
			$display("TEST CASE 12  : multiplication WITH Two positive Variables");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == 'd100)
				$display ("TEST CASE 12 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 12 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
				

			
			ALU_FUNC_TB = 4'b0011;
			A_TB   = -'d25 ;	
			B_TB   = -'d5 ;
			$display("TEST CASE 13  : Division WITH Two negative Variables");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == 'd5)
				$display ("TEST CASE 13 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 13 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
				
				
			A_TB   = 'd5 ;	
			B_TB   = -'d5 ;
			$display("TEST CASE 14  : Division WITH a pos Variable(A) and a neg variable(B)");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == -'d1)
				$display ("TEST CASE 14 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 14 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
		
		
			A_TB   = -'d200 ;	
			B_TB   = 'd8 ;
			$display("TEST CASE 15  : Division WITH a neg Variable(A) and a pos variable(B)");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == -'d25)
				$display ("TEST CASE 15 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 15 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);
		 
		 
			A_TB   = 'd32 ;	
			B_TB   = 'd2 ;
			$display("TEST CASE 16  : Division WITH Two positive Variables");
			#CLK_PERIOD
			if (flags == 4'd8 && ARITH_OUT_TB == 'd16)
				$display ("TEST CASE 16 is passed with value = %0d at simulation time",ARITH_OUT_TB,$time);
			else
				$display ("TEST CASE 16 is Failed with value = %0d at simulation time",ARITH_OUT_TB,$time);


			ALU_FUNC_TB =4'b0100;			
			A_TB   = 'b1011 ;	
			B_TB   = 'b1010 ;
			$display("TEST CASE 17  : LOGICAL OPERATION (AND)");
			#CLK_PERIOD
			if (flags == 4'd4 && LOGIC_OUT_TB == 'b1010)  //10
				$display ("TEST CASE 17 is passed with value = %0d at simulation time",LOGIC_OUT_TB,$time);
			else
				$display ("TEST CASE 17 is Failed with value = %0d at simulation time",LOGIC_OUT_TB,$time);
			
			
			ALU_FUNC_TB =4'b0101;			
			A_TB   = 'b1011 ;	
			B_TB   = 'b1010 ;
			$display("TEST CASE 18  : LOGICAL OPERATION (OR)");
			#CLK_PERIOD
			if (flags == 4'd4 && LOGIC_OUT_TB == 'b1011)  //11
				$display ("TEST CASE 18 is passed with value = %0d at simulation time",LOGIC_OUT_TB,$time);
			else
				$display ("TEST CASE 18 is Failed with value = %0d at simulation time",LOGIC_OUT_TB,$time);
			
			
	        ALU_FUNC_TB =4'b0110;			
			A_TB   = 'b1011 ;	
			B_TB   = 'b1010 ;
			$display("TEST CASE 19  : LOGICAL OPERATION (NAND)");
			#CLK_PERIOD
			if (flags == 4'd4 && LOGIC_OUT_TB == 'hfff5)
				$display ("TEST CASE 19 is passed with value = %0d at simulation time",LOGIC_OUT_TB,$time);
			else
				$display ("TEST CASE 19 is Failed with value = %0d at simulation time",LOGIC_OUT_TB,$time);

				
			ALU_FUNC_TB =4'b0111;			
			A_TB   = 'b1011 ;	
			B_TB   = 'b1010 ;
			$display("TEST CASE 20  : LOGICAL OPERATION (NOR)");
			#CLK_PERIOD
			if (flags == 4'd4 && LOGIC_OUT_TB == 'hfff4)
				$display ("TEST CASE 20 is passed with value = %0d at simulation time",LOGIC_OUT_TB,$time);
			else
				$display ("TEST CASE 20 is Failed with value = %0d at simulation time",LOGIC_OUT_TB,$time);
				
				
			ALU_FUNC_TB =4'b1000;			
			A_TB   = 'd5 ;	
			B_TB   = 'd2 ;
			$display("TEST CASE 21  : Compare OPERATION (NOP)");
			#CLK_PERIOD
			if (flags == 4'd2 && CMP_OUT_TB == 'd0)
				$display ("TEST CASE 21 is passed with value = %0d at simulation time",CMP_OUT_TB ,$time);
			else
				$display ("TEST CASE 21 is Failed with value = %0d at simulation time",CMP_OUT_TB ,$time);



			ALU_FUNC_TB =4'b1001;			
			A_TB   = 'd5 ;	
			B_TB   = 'd5 ;
			$display("TEST CASE 22  : Compare OPERATION (Equal)");
			#CLK_PERIOD
			if (flags == 4'd2 && CMP_OUT_TB == 'd1)
				$display ("TEST CASE 22 is passed with value = %0d at simulation time",CMP_OUT_TB ,$time);
			else
				$display ("TEST CASE 22 is Failed with value = %0d at simulation time",CMP_OUT_TB ,$time);



			ALU_FUNC_TB =4'b1010;			
			A_TB   = 'd5 ;	
			B_TB   = 'd2 ;
			$display("TEST CASE 23  : Compare OPERATION (greater)");
			#CLK_PERIOD
			if (flags == 4'd2 && CMP_OUT_TB == 'd2)
				$display ("TEST CASE 23 is passed with value = %0d at simulation time",CMP_OUT_TB ,$time);
			else
				$display ("TEST CASE 23 is Failed with value = %0d at simulation time",CMP_OUT_TB ,$time);



			ALU_FUNC_TB =4'b1011;			
			A_TB   = 'd5 ;	
			B_TB   = 'd7 ;
			$display("TEST CASE 24  : Compare OPERATION (less)");
			#CLK_PERIOD
			if (flags == 4'd2 && CMP_OUT_TB == 'd3)
				$display ("TEST CASE 24 is passed with value = %0d at simulation time",CMP_OUT_TB ,$time);
			else
				$display ("TEST CASE 24 is Failed with value = %0d at simulation time",CMP_OUT_TB ,$time);


			ALU_FUNC_TB =4'b1011;			
			A_TB   = 'd5 ;	
			B_TB   = 'd2 ;
			$display("TEST CASE 25  : Compare OPERATION (less)");
			#CLK_PERIOD
			if (flags == 4'd2 && CMP_OUT_TB == 'd0)
				$display ("TEST CASE 25 is passed with value = %0d at simulation time",CMP_OUT_TB ,$time);
			else
				$display ("TEST CASE 25 is Failed with value = %0d at simulation time",CMP_OUT_TB ,$time);				
				
			
			ALU_FUNC_TB =4'b1100;			
			A_TB   = 'd6 ;	
			B_TB   = 'd2 ;
			$display("TEST CASE 26  : shift OPERATION (A SHIFT RIGHT)");
			#CLK_PERIOD
			if (flags == 4'd1 && SHIFT_OUT_TB == 'd3)
				$display ("TEST CASE 26 is passed with value = %0d at simulation time",SHIFT_OUT_TB ,$time);
			else
				$display ("TEST CASE 26 is Failed with value = %0d at simulation time",SHIFT_OUT_TB ,$time);

				
			ALU_FUNC_TB =4'b1101;			
			A_TB   = 'd6 ;	
			B_TB   = 'd2 ;
			$display("TEST CASE 27  : shift OPERATION (A SHIFT LEFT)");
			#CLK_PERIOD
			if (flags == 4'd1 && SHIFT_OUT_TB == 'd12)
				$display ("TEST CASE 27 is passed with value = %0d at simulation time",SHIFT_OUT_TB ,$time);
			else
				$display ("TEST CASE 27 is Failed with value = %0d at simulation time",SHIFT_OUT_TB ,$time);	
				
				
			ALU_FUNC_TB =4'b1110;			
			A_TB   = 'd5 ;	
			B_TB   = 'd8 ;
			$display("TEST CASE 28  : shift OPERATION (B SHIFT RIGHT)");
			#CLK_PERIOD
			if (flags == 4'd1 && SHIFT_OUT_TB == 'd4)
				$display ("TEST CASE 28 is passed with value = %0d at simulation time",SHIFT_OUT_TB ,$time);
			else
				$display ("TEST CASE 28 is Failed with value = %0d at simulation time",SHIFT_OUT_TB ,$time);
				
				
			ALU_FUNC_TB =4'b1111;			
			A_TB   = 'd5 ;	
			B_TB   = 'd8 ;
			$display("TEST CASE 29  : shift OPERATION (B SHIFT LEFT)");
			#CLK_PERIOD
			if (flags == 4'd1 && SHIFT_OUT_TB == 'd16)
				$display ("TEST CASE 29 is passed with value = %0d at simulation time",SHIFT_OUT_TB ,$time);
			else
				$display ("TEST CASE 29 is Failed with value = %0d at simulation time",SHIFT_OUT_TB ,$time);	
				
				
				
		#100
		$stop ;		//finished with simulation
		end



  // clock generator with freq =100KHZ and 10 us clock cycle
  always  
   begin
    #LOW_PERIOD  CLK_TB = ~ CLK_TB ;
    #HIGH_PERIOD CLK_TB = ~ CLK_TB ;
   end
   
   
   // Design instantiation  
   ALU_TOP DUT (
		.A(A_TB),
		.B(B_TB),
		.ALU_FUNC(ALU_FUNC_TB),
		.CLK(CLK_TB),
		.RST(RST_TB),
		.ARITH_OUT(ARITH_OUT_TB),
		.LOGIC_OUT(LOGIC_OUT_TB),
		.SHIFT_OUT(SHIFT_OUT_TB),
		.CMP_OUT(CMP_OUT_TB),
		.ARITH_FLAG(ARITH_FLAG_TB),
		.LOGIC_FLAG(LOGIC_FLAG_TB),
		.SHIFT_FLAG(SHIFT_FLAG_TB),
		.CMP_FLAG(CMP_FLAG_TB));

 
endmodule    