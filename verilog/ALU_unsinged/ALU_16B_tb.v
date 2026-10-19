//time_unit = 1us & time percision = 1ns
`timescale 1us/1ns

module ALU_16B_tb ();

//declare testbench signals
  reg   [15:0]   A_TB ;
  reg   [15:0]   B_TB ;
  reg   [3:0]    ALU_FUN_TB;
  reg            CLK_TB;
  wire           carry_flag_TB;
  wire			        arith_flag_TB;
  wire           Logic_flag_TB;
  wire           cmp_flag_TB;
  wire           shift_flag_TB;
  wire   [15:0]  ALU_OUT_TB ;
  
  //initial block
  initial
    begin
     $dumpfile("ALU_16B.vcd"); // waveforms in this file 
     $dumpvars;                // saves all waveforms 
	   A_TB = 16'd4;
	   B_TB = 16'd2;
	   ALU_FUN_TB = 4'b0000;
	   CLK_TB = 1'b0;
	   $display("Test Case 1"); 	//add
	   #10
	   if (arith_flag_TB==1'b1 && ALU_OUT_TB == 16'd6) //0110
			$display("Test Case 1 is passed");
		else
			$display("Test Case 1 is failed");
		
		$display("Test Case 2");  //sub
		#3
		ALU_FUN_TB = 4'b0001;
		#7
	   if (arith_flag_TB==1'b1 && ALU_OUT_TB == 16'd2) //0010
			$display("Test Case 2 is passed");
		else
			$display("Test Case 2 is failed");
		
		$display ("TEST CASE 3") ;  //mul
		#3
		ALU_FUN_TB = 4'b0010;
		#7
		if (arith_flag_TB==1'b1 && ALU_OUT_TB == 16'd8) //1000
			$display("Test Case 3 is passed");
		else
			$display("Test Case 3 is failed");
		
		$display ("TEST CASE 4") ; //div
		#3
		ALU_FUN_TB = 4'b0011;
		#7
		if (arith_flag_TB==1'b1 && ALU_OUT_TB == 16'd2) //0010
			$display("Test Case 4 is passed");
		else
			$display("Test Case 4 is failed");
			
		$display ("TEST CASE 5") ; //and
		#3
		ALU_FUN_TB = 4'b0100;
		#7
		if (Logic_flag_TB==1'b1 && ALU_OUT_TB == 16'd0) 	//0000
			$display("Test Case 5 is passed");
		else
			$display("Test Case 5 is failed");
			
		$display ("TEST CASE 6") ; //or
		#3
		ALU_FUN_TB = 4'b0101;
		#7
		if (Logic_flag_TB==1'b1 && ALU_OUT_TB == 16'd6)  	//0110
			$display("Test Case 6 is passed");
		else
			$display("Test Case 6 is failed");
			
		$display ("TEST CASE 7") ; //nand
		#3
		ALU_FUN_TB = 4'b0110;
		#7
		if (Logic_flag_TB==1'b1 && ALU_OUT_TB == 16'hFFFF)  //FFFF
			$display("Test Case 7 is passed");
		else
			$display("Test Case 7 is failed");
			
		$display ("TEST CASE 8") ; //NOR
		#3
		ALU_FUN_TB = 4'b0111;
		#7
		if (Logic_flag_TB==1'b1 && ALU_OUT_TB == 16'hFFF9) //FFF9
			$display("Test Case 8 is passed");
		else
			$display("Test Case 8 is failed");	
	   
	    $display ("TEST CASE 9") ; //XOR
		#3
		ALU_FUN_TB = 4'b1000;
		#7
		if (Logic_flag_TB==1'b1 && ALU_OUT_TB == 16'd6) //0110
			$display("Test Case 9 is passed");
		else
			$display("Test Case 9 is failed"); 
      
        $display ("TEST CASE 10") ; //XNOR
		#3
		ALU_FUN_TB = 4'b1001;
		#7
		if (Logic_flag_TB==1'b1 && ALU_OUT_TB == 16'hFFF9) //FFF9
			$display("Test Case 10 is passed");
		else
			$display("Test Case 10 is failed");      
        
		$display ("TEST CASE 11") ; //NOT_EQUAL
		#3
		ALU_FUN_TB = 4'b1010;
		#7
		if (cmp_flag_TB==1'b1 && ALU_OUT_TB == 16'd0) //0000
			$display("Test Case 11 is passed");
		else
			$display("Test Case 11 is failed");
		
		$display ("TEST CASE 12") ; //EQUAL
		#3
		A_TB = 16'd2;
	    B_TB = 16'd2;
		ALU_FUN_TB = 4'b1010;
		#7
		if (cmp_flag_TB==1'b1 && ALU_OUT_TB == 16'd1) //0001
			$display("Test Case 12 is passed");
		else
			$display("Test Case 12 is failed");
			
		$display ("TEST CASE 13") ; //GRATER
		#3
		A_TB = 16'd5;
	    B_TB = 16'd2;
		ALU_FUN_TB = 4'b1011;
		#7
		if (cmp_flag_TB==1'b1 && ALU_OUT_TB == 16'd2) //0010
			$display("Test Case 13 is passed");
		else
			$display("Test Case 13 is failed");
        			
		$display ("TEST CASE 14") ; //LESS
		#3
		A_TB = 16'd1;
	    B_TB = 16'd2;
		ALU_FUN_TB = 4'b1100;
		#7
		if (cmp_flag_TB==1'b1 && ALU_OUT_TB == 16'd3) //0001
			$display("Test Case 14 is passed");
		else
			$display("Test Case 14 is failed");	
      
		$display ("TEST CASE 15") ; //SHIFT RIGHT
		#3
		A_TB = 16'd2;
	    B_TB = 16'd2;
		ALU_FUN_TB = 4'b1101;
		#7
		if (shift_flag_TB==1'b1 && ALU_OUT_TB == 16'd1) // 0001
			$display("Test Case 15 is passed");
		else
			$display("Test Case 15 is failed");
      
		$display ("TEST CASE 16") ; //SHIFT LEFT
		#3
		A_TB = 16'd2;
	    B_TB = 16'd2;
		ALU_FUN_TB = 4'b1110;
		#7
		if (shift_flag_TB==1'b1 && ALU_OUT_TB == 16'd4) //0100
			$display("Test Case 16 is passed");
		else
			$display("Test Case 16 is failed");
			
		$display ("TEST CASE 17") ; //NOP
		#3
		A_TB = 16'd2;
	    B_TB = 16'd2;
		ALU_FUN_TB = 4'b1111;
		#7
		if (ALU_OUT_TB == 16'd0) //0000
			$display("Test Case 17 is passed");
		else
			$display("Test Case 17 is failed");	
    
      
      
      #100
      $stop ;
    end
  
  
  // clock generator with freq =100KHZ and 10 us clock cycle
  always #5 CLK_TB = ~ CLK_TB;

  // Design instantiation
  ALU_16B DUT (
    .A(A_TB),
	.B(B_TB),
	.ALU_FUN(ALU_FUN_TB),
	.CLK(CLK_TB),
	.carry_flag(carry_flag_TB),
	.arith_flag(arith_flag_TB),
	.Logic_flag(Logic_flag_TB),
	.cmp_flag(cmp_flag_TB),
	.shift_flag(shift_flag_TB),
	.ALU_OUT(ALU_OUT_TB) );
	

endmodule
