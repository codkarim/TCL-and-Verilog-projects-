`timescale 1ns/1ps
module LFSR_tb;


/////////////////////////////////////////////////////////
///////////////////// Parameters ////////////////////////
/////////////////////////////////////////////////////////
parameter	clock_period = 10;
parameter	mem_depth = 5;
parameter	mem_width = 8;


/////////////////////////////////////////////////////////
//////////////////// DUT Signals ////////////////////////
/////////////////////////////////////////////////////////
reg						CLK_tb;
reg						RST_tb;
reg						enable_tb;
reg						out_enable_tb;
reg		[mem_width-1:0]	seed_tb;
wire					out_tb;
wire					valid_tb;



/////////////////////////////////////////////////////////
/////////////////////// 2D Memories ////////////////////////
/////////////////////////////////////////////////////////	
reg		[mem_width-1:0]	  test_seed   [mem_depth-1:0];
reg		[mem_width-1:0]	  expect_outs   [mem_depth-1:0];

/////////////////////////////////////////////////////////
///////////////// Loops Variables ///////////////////////
/////////////////////////////////////////////////////////
integer i;

initial 
	begin
		 // System Functions
		$dumpfile("LFSR.vcd");
		$dumpvars;
		// Read Input Files and store it
		$readmemb("Seeds_b.txt",test_seed);
		$readmemb("Expec_Out_b.txt",expect_outs);
		initalize();
		
		 // Test Cases
		for (i=0; i< mem_depth ; i=i+1)
			begin
				do_oper(test_seed[i]);	// do_lfsr_operation
				check_out(expect_outs[i],i);	// check output response
			end
		
		#100
		$stop;
	end

////////////////////////////////////////////////////////
/////////////////////// TASKS //////////////////////////
////////////////////////////////////////////////////////

task initalize;
	begin
		CLK_tb = 1'b0;
		enable_tb = 1'b0;
		out_enable_tb = 1'b0;
		seed_tb = 'hff;
	end
endtask


task reset;
	begin
	RST_tb =1'b0;
	#clock_period
	RST_tb = 1'b1;
	end
endtask

task do_oper;
	input	reg	 [mem_width-1:0]	in_seed;
	begin
		seed_tb = in_seed;
		reset(); //to enter seed into LFSR
		#(clock_period)
		enable_tb =1'b1;
		#(10 * clock_period)
		enable_tb =1'b0;
	end
endtask

////////////////// Check Out Response  ////////////////////
task check_out;
	input	reg	 [mem_width-1:0]	expec_out;
	input	integer		oper;
	
	integer	N;
	reg 	[mem_width-1:0]	gener_out ;
	
	begin
		out_enable_tb = 1'b1;
		@(posedge valid_tb)		//wait valid signal to activated
		for(N=0;N<mem_width;N=N+1)
			begin
				#(clock_period) gener_out[N] = out_tb;
			end
		if(valid_tb ==1'b1 && gener_out == expec_out)
			$display("test case of %0d is Succeeded and equal: %b at timing %0d",oper,gener_out,$time);
		else
			$display("test case of %0d is failed and equal: %b at timing %0d",oper,gener_out,$time);
		out_enable_tb = 1'b0;	
	end
endtask


////////////////////////////////////////////////////////
////////////////// Clock Generator  ////////////////////
////////////////////////////////////////////////////////
always #(clock_period/2) CLK_tb = ~CLK_tb;


////////////////////////////////////////////////////////
/////////////////// DUT Instantation ///////////////////
////////////////////////////////////////////////////////
LFSR DUT (.CLK(CLK_tb),
		  .RST(RST_tb),
		  .enable(enable_tb),
		  .out_enable(out_enable_tb),
		  .seed(seed_tb),
		  .out(out_tb),
		  .valid(valid_tb));

endmodule