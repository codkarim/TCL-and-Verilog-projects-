//time_unit = 1us & time percision = 1ns
`timescale 1us/1ns

module regfile_tb ();

//testbench parameters
parameter ADDR_WIDTH_TB = 3 ;
parameter MEM_DEPTH_TB = 8  ;
parameter MEM_WIDTH_TB = 16 ;


parameter CLOCK_PERIOD = 10 ;




//declare TB Signals
	reg                   			WrEn_TB;     
	reg                   			RdEn_TB;     
    reg                   			CLK_TB;
	reg                   			RST_TB;
    reg  	[ADDR_WIDTH_TB -1:0] 	address_TB;   
    reg  	[MEM_WIDTH_TB  -1:0]  	WrData_TB;
    wire   	[MEM_WIDTH_TB  -1:0]  	RdData_TB;

//initial block
	initial 
		begin
		$dumpfile("regfile.vcd"); // waveforms in this file 
		$dumpvars; 				 // saves all waveforms
		CLK_TB = 1'b0;
		RST_TB = 1'b0;
		RdEn_TB= 1'b0;
		WrEn_TB= 1'b0;
		WrData_TB = 16'hf321;
		address_TB = 3'd0 ;		
		
		#CLOCK_PERIOD
		RST_TB = 1'b1;
		RdEn_TB= 1'b0;
		WrEn_TB= 1'b1;
		$display("TEST CASE 1  : write in the register(0)");
		
		
		#CLOCK_PERIOD
			if (RdData_TB == 16'b0)
				$display ("TEST CASE 1 is passed with value = %0h at simulation time",RdData_TB,$time);
			else
				$display ("TEST CASE 1 is Failed with value = %0h at simulation time",RdData_TB,$time);
		
		
		RdEn_TB= 1'b1;
		WrEn_TB= 1'b0;
		$display("TEST CASE 2  : read in the register(0)");
		
		
			#CLOCK_PERIOD
			if (RdData_TB == 16'hf321)
				$display ("TEST CASE 2 is passed with value = %0h at simulation time",RdData_TB,$time);
			else
				$display ("TEST CASE 2 is Failed with value = %0h at simulation time",RdData_TB,$time);		
				
				
		address_TB = 3'd1 ;
		RdEn_TB= 1'b0;
		WrEn_TB= 1'b1;
		WrData_TB = 16'hfca1;
		$display("TEST CASE 3  : write in the register(1)");
		
		
			#CLOCK_PERIOD
			if (RdData_TB == 16'hf321)
				$display ("TEST CASE 3 is passed with value = %0h at simulation time",RdData_TB,$time);
			else
				$display ("TEST CASE 3 is Failed with value = %0h at simulation time",RdData_TB,$time);
				
				
		address_TB = 3'd1 ;
		RdEn_TB= 1'b1;
		WrEn_TB= 1'b0;
		WrData_TB = 16'hfe50 ;
		$display("TEST CASE 4  : read in the register(1)");
		
		
			#CLOCK_PERIOD
			if (RdData_TB == 16'hfca1)
				$display ("TEST CASE 4 is passed with value = %0h at simulation time",RdData_TB,$time);
			else
				$display ("TEST CASE 4 is Failed with value = %0h at simulation time",RdData_TB,$time);		
		
		
		#100
		$stop ;   //finished with simulation
		end


// clock generator with freq =100KHZ and 10 us clock cycle

	always #(CLOCK_PERIOD / 2)  CLK_TB = ~ CLK_TB ;


// Design instantiation 
	regfile DUT (
		.WrEn(WrEn_TB),
		.RdEn(RdEn_TB),
		.CLK(CLK_TB),
		.RST(RST_TB),
		.address(address_TB),
		.WrData(WrData_TB),
		.RdData(RdData_TB) );

endmodule