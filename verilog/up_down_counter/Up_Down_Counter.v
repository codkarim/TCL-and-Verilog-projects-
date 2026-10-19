/* Design Decleration:
1- This code we combine the sequential and combinational logic in the same always block
2- This Design impelments a counter capable of counting up 
or counting down based on a specific flag.
*/
module Up_Dn_Counter(
	input	wire			load,
	input	wire			Up,
	input	wire			Down,
	input	wire			CLK,
	input	wire	[4:0]	IN,
	output	wire			    High,
	output	wire			    Low,
	output	reg		[4:0]	counter);

// Counter Behaviou Function (RTL Code).
always@(posedge CLK)
	begin
		if(load)
			begin
				counter <= IN;			
			end
		else if (Down && !Low)
			begin
				counter <= counter - 5'b00001;
			end
		else if (Up && !High && !Down)
			begin
				counter <= counter + 5'b00001;
			end
	
	end
	
//Down Flag
	assign Low = (counter == 5'b00000);
// Up Flag
	assign High = (counter == 5'b11111);
	
endmodule