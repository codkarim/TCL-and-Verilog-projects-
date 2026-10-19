//time_unit = 1ns & time percision = 1ps
`timescale 1ns/1ps

// testbench has no inputs or outputs
module Up_Dn_Counter_tb ();
  
//all design inputs are defined in testbench as reg to be used inside initial blocks.  
//all design outputs are defined in testbench as wire.
  
//declare testbench signals
  reg          load_tb ;
  reg          Up_tb ;
  reg          Down_tb ;
  reg          CLK_tb ;
  reg   [4:0]	 IN_tb ;
  wire         High_tb; 
  wire         Low_tb ;
  wire  [4:0] 	counter_tb ;
  

  
// initial Block
  initial 
    begin
      $dumpfile("Up_Dn_Counter.vcd"); // waveforms in this file      
      $dumpvars;                     // saves all waveforms 
      load_tb = 1'b0;
      Up_tb = 1'b0;
      Down_tb = 1'b0;
      CLK_tb = 1'b0;
      IN_tb = 5'b01010; //10 decimal
      
      // first we test control signals.
      $display ("Test Case 1");   // test load function
      #3 
      load_tb = 1'b1;
      Up_tb = 1'b0;
      Down_tb = 1'b0;
      #7
      if (counter_tb!= 5'b01010)
        $display("Test Case 1 is failed");
     else
        $display("Test Case 1 is passed");
        
      $display("Test Case 2"); // test load has highest priority
      #3
      load_tb = 1'b1;
      Up_tb = 1'b1;
      Down_tb = 1'b1;
      #7
      if (counter_tb!= 5'b01010)
        $display("Test Case 2 is failed");
     else
        $display("Test Case 2 is passed");
        
      $display("Test Case 3"); // Test Down function
      #3 
      load_tb = 1'b0;
      Up_tb = 1'b0;
      Down_tb = 1'b1;
      #27                // we wait three clock cycle
      if (counter_tb!= 5'b00111) //7
        $display("Test Case 3 is failed");
     else
        $display("Test Case 3 is passed");
      
      $display("Test Case 4"); //Test Down has Highest priority
      #3
      load_tb = 1'b0;
      Up_tb = 1'b1;
      Down_tb = 1'b1;
      #27
      if (counter_tb!= 5'b00100)  //4
        $display("Test Case 4 is failed");
     else
        $display("Test Case 4 is passed");
      
      $display("Test Case 5"); // Test Up function
      #3
      load_tb = 1'b0;
      Up_tb = 1'b1;
      Down_tb = 1'b0;
      #57              // we wait five clock cycle
      if (counter_tb!= 5'b01010)  //10
        $display("Test Case 5 is failed");
     else
        $display("Test Case 5 is passed"); 
         
      #100
      $finish; 
    end
    
  //Clock Generator with 100 Mhz frequency and 10 ns clock cycle
  always #5 CLK_tb = ~CLK_tb ;
  
  // Design instantiation
  Up_Dn_Counter DUT (
    .load(load_tb),
    .Up(Up_tb),
    .Down(Down_tb),
    .CLK(CLK_tb),
    .IN(IN_tb),
    .High(High_tb),
    .Low(Low_tb),
    .counter(counter_tb)  );
    
endmodule