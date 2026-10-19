//sorry for late i was sick
// this design implements memory that can read a data or write a data according to enable signals 

module regfile # (
    parameter ADDR_WIDTH = 3,
    parameter MEM_DEPTH = 8,
    parameter MEM_WIDTH = 16)
	
(
    input  wire                   	WrEn,		//act as input
	input  wire                   	RdEn,		//act as output
    input  wire                   	CLK,
	input  wire                   	RST,
    input  wire  [ADDR_WIDTH-1:0] 	address,	//three bit to choose the wanted register 
    input  wire  [MEM_WIDTH-1:0]  	WrData, 
    output reg   [MEM_WIDTH-1:0]  	RdData

);

    // register file of 8 registers each of 16 bits width
    reg [MEM_WIDTH-1:0] memory [MEM_DEPTH-1:0];        

    always @(posedge CLK or negedge RST) 
		begin
			if (!RST)
				begin
					RdData <= 16'b0;
					
					memory[0] <= 16'b0 ;
					memory[1] <= 16'b0 ;
					memory[2] <= 16'b0 ;
					memory[3] <= 16'b0 ;
					memory[4] <= 16'b0 ;
					memory[5] <= 16'b0 ;
					memory[6] <= 16'b0 ;
					memory[7] <= 16'b0 ;
					
				end
	
			else if (WrEn && !RdEn)   	//write operation
				begin
					memory[address] <= WrData;
				end
			else if (RdEn && !WrEn) 	//read operation
				begin
					RdData <= memory[address]; 
				end
		end



endmodule
