module LFSR (
	input		wire			CLK,RST,
	input		wire			enable,out_enable,
	input		wire	[7:0]	seed,
	output		reg				out,valid);
	
reg		[7:0]	LFSR;
wire			feedback;	
integer i;

localparam	Taps = 8'b10101010;

assign feedback = (~|LFSR[6:0]) ^ LFSR[7];

always @(posedge CLK or negedge RST)
	begin
		if(!RST)
			begin
				LFSR  <= seed;
				out   <= 1'b0;
				valid <= 1'b0;
			end	
		else if(enable)
			begin
				LFSR [0] <= feedback;
				for(i=7;i>0;i=i-1)
					begin
						if (Taps[i]==1)
							LFSR [i] <= LFSR [i-1] ^ feedback;
						else
							LFSR [i] <= LFSR [i-1];
					end
			end
		else if (out_enable)
			begin
			{LFSR[6:0],out} <= LFSR;
			valid <= 1'b1;
			end
	end	
endmodule