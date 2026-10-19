`timescale 10ns/10ps 

module CRC_TB ();

//declare TB Signals
reg			DATA_TB;
reg			ACTIVE_TB;
reg			CLK_TB;
reg			RST_TB;
wire		CRC_TB;
wire		VALID_TB;

//testbench parameters
parameter	clock_period =  10 ;
parameter   LFSR_WD_tb   =  8  ;	// Could be 1 Byte - 4 Bytes
parameter   Test_Cases   = 	10 ;	

//Loops Variables
integer operation ; 

//2D ARRAY Memories
reg 	[LFSR_WD_tb - 1 :0]	DATA_SERIAL	[Test_Cases - 1 :0];
reg 	[LFSR_WD_tb - 1 :0]	expec_out	[Test_Cases - 1 :0];

 
//initial Block
initial
	begin
	$dumpfile("CRC.vcd");		// waveforms in this file
	$dumpvars ;				    // saves all waveforms
	
//#######Read Input Files################	
	$readmemh ("DATA_h.txt",DATA_SERIAL);
	$readmemh ("Expec_Out_h.txt",expec_out);
	
	initialize ();
 //#########Test Cases################	
	for (operation =0; operation < Test_Cases ; operation = operation + 1 )
		begin
		reset ();											// Reset the design to initialize the LFSR with the SEED
		do_oper (DATA_SERIAL[operation]) ;					// Load Data into LFSR
		check_out (expec_out[operation],operation);			// check CRC out
		end
	
	#100
	$stop;
	end



task initialize ;
	begin
		DATA_TB   =1'b0;
		ACTIVE_TB =1'b0;
		CLK_TB    =1'b0;
	end
endtask


task reset ;
	begin
		RST_TB    = 1'b0 ;
		# clock_period
		RST_TB    = 1'b1 ;
	end
	
endtask


//generate task to do operation (xoring and shifting)
task 	do_oper ;
	input	[LFSR_WD_tb -1 :0]	DATA_IN;
	integer N;
	
	begin
		ACTIVE_TB = 1'b1;
		for (N =0 ; N < LFSR_WD_tb ; N = N+1)
			begin
				DATA_TB = DATA_IN[N] ;
				#clock_period	;
			end
		ACTIVE_TB = 1'b0;
	end
endtask	
	

//generate task to Check CRC Out	
task	check_out ; 
	input		reg		[LFSR_WD_tb -1 :0]  result;
	input		integer   					operation_num;
	
	integer						P;
	
	reg    [LFSR_WD_tb-1:0]     gener_out ;
	
	begin
		ACTIVE_TB = 1'b0;
		@(posedge VALID_TB)
			for (P =0 ; P < LFSR_WD_tb ; P=P+1)
				begin
					 @(negedge CLK_TB)
					 gener_out[P] = CRC_TB ;
				end
				
			if (gener_out == result)
				begin
					$display("Test Case %0d is succeeded with value : %0h , with time : %0d",operation_num,gener_out,$time);
				end
			else
				begin
					$display("Test Case %0d is failed with value : %0h   , with time : %0d", operation_num,gener_out,$time);
				end
	end
endtask



//Clock Generator with 10Mhz
always #(clock_period/2) CLK_TB = ~CLK_TB ;  

// Design Instaniation
CRC DUT (
.DATA(DATA_TB),
.ACTIVE(ACTIVE_TB),
.CLK(CLK_TB),
.RST(RST_TB),
.CRC(CRC_TB),
.VALID(VALID_TB));




endmodule
