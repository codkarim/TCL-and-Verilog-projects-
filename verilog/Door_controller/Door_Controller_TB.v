`timescale 1ns/1ps
module Door_Controller_TB ();

	reg		UP_max_TB;
	reg		activate_TB;
	reg		DN_max_TB;
	reg		CLK_TB;
	reg		RST_TB;
	wire	UP_M_TB;
	wire	DN_M_TB;
	
	
	wire 	[1:0]   outputs;
	parameter		clock_period = 20 ;
	assign outputs = {DN_M_TB,UP_M_TB};


	initial
		begin
		$dumpfile ("Door_Controller.vcd");
		$dumpvars;
		initialize();
		reset();
		control('b000);
		$display ("tset case1");
		if (outputs == 2'b0)
			$display("test case1 is passed (IDLE STATE AT TIME %0d)", $time) ;
		else
			$display("test case1 is failed (there is error AT TIME %0d)", $time) ;
			
		#clock_period
		
		control('b011);
		$display ("tset case2");
		
		#clock_period
		if (outputs == 2'b10)
			$display("test case2 is passed (Mv_Dn state: AT TIME %0d)", $time) ;
		else
			$display("test case2 is failed (there is error AT TIME %0d)", $time) ;
			
		#clock_period
		
		control('b101);
		
		#clock_period
		$display ("tset case3");
		if (outputs == 2'b01)
			$display("test case3 is passed (Mv_Up state: AT TIME %0d)", $time) ;
		else
			$display("test case3 is failed (there is error AT TIME %0d)", $time) ;

		#clock_period
		
		control('b010);
		
		#clock_period
		$display ("tset case4");
		if (outputs == 2'b00)
			$display("test case4 is passed (IDLE state: AT TIME %0d)", $time) ;
		else
			$display("test case4 is failed (there is error AT TIME %0d)", $time) ;
			
		#100
		
		$stop;
		end	


	task initialize;
		begin
			UP_max_TB   = 0;
			activate_TB = 0;
			DN_max_TB = 0;
			CLK_TB = 0;
		end	
	endtask
	
	task reset;
		begin
			RST_TB = 0;
			#clock_period
			RST_TB = 1;
		end
	endtask	
	
	task control;
	input  reg	[2:0]	button_change;
		begin
		 {DN_max_TB,UP_max_TB,activate_TB} = button_change  ;
		end	
	endtask
	
	

always #(clock_period/2) CLK_TB = ~CLK_TB ;

Door_Controller DUT (
	.UP_max(UP_max_TB),
	.activate(activate_TB),
	.DN_max(DN_max_TB),
	.CLK(CLK_TB),
	.RST(RST_TB),
	.UP_M(UP_M_TB),
	.DN_M(DN_M_TB)
);

endmodule