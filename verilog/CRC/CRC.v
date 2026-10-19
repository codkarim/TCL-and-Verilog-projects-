//CRC (Cyclic Redundancy Check) to check if there is an eror during transmit data
module CRC (
	input		wire		DATA,		// input serial data 
	input		wire		ACTIVE,		//to do operation
	input		wire		CLK,
	input		wire		RST,
	output		reg			CRC,		// serial output CRC bits
	output		reg			VALID		// high during output transmission
);

reg		[7:0]	R;
reg		[3:0]	counter ;
wire			high ;
wire			feedback;

parameter	SEED = 8'hD8; 
parameter   TAPS = 7'b0111011 ;			// taps defines the sequence  
integer		I ;

assign		feedback = R[0] ^ DATA ;	//feedback operation

always @(posedge CLK or negedge RST)
	begin
		if (!RST)
			begin
				R       <= SEED;
				CRC     <= 1'b0;
				VALID   <= 1'b0;
			end
			
		else if (ACTIVE)
			begin
				for (I=0 ; I<7 ; I=I+1) 
					begin
						if (TAPS[I] ==1)
							R[I] <= R[I+1];
					else
							R[I] <= R[I+1] ^ feedback;
					end
				R[7] <= feedback ;
				
				/*
					R[0] <= R [1] ;
					R[1] <= R [2] ;
					R[2] <= R [3] ^ feedback;
					R[3] <= R [4] ;
					R[4] <= R [5] ;
					R[5] <= R [6] ;
					R[6] <= R [7] ^ feedback ;
				*/	
					
			end
		else if (!high)		//to take the output serially
			begin
			{R,CRC} <= {1'b0,R};
			VALID <= 1'b1 ;
			end
		else
			begin
				CRC <= 1'b0;
				VALID <= 1'b0;
			end
			
	end



//counter to count up during generate the output bits  
always@(posedge CLK or negedge RST)
	begin
		if(!RST)
			begin
				counter <= 4'b1000;		//because if no operation,valid won't be one
			end	
		else if (ACTIVE)
			begin	
			    counter <= 4'b0 ;
			end	
		else if (!high)
			begin
				counter <= counter+1; 
			end
		
	end
	
assign high = (counter == 4'b1000);

	
endmodule