# Lab_2
1001 Sequence Detector - Quartus 18.1 

module Lab_2FSM(b, clk, rst, y); //1001 Sequence Detector
	input b, clk, rst;
	output reg y;
	
	parameter s0 = 3'b000, 
				 s1 = 3'b001,
				 s2 = 3'b010,
				 s3 = 3'b011,
				 s4 = 3'b100;
				 
	reg [2:0] p_state, n_state;
	
	always @ (posedge clk) 
		begin
			if (rst == 1) 
				p_state <= s0;
			else 
				p_state <= n_state;
		end
	
	always @ (p_state , b) 
		begin case (p_state)
			
			s0: 
			begin
				if (b==1)
					n_state = s1;
				else 
					n_state = s0;
			end
			
			s1: 
			begin
				if (b==1)
					n_state = s1;
				else 
					n_state = s2;
			end
			
			s2: 
			begin
				if (b==1)
					n_state = s1;
				else 
					n_state = s3;
			end
			
			s3: 
			begin
				if (b==1)
					n_state = s4;
				else 
					n_state = s2;
			end
			
			s4: 
			begin
				if (b==1)
					n_state = s1;
				else 
					n_state = s2;
			end
			default: n_state = s0;
		endcase
	
	end
	
	always @ (p_state) begin
		case (p_state)
			s0: y <= 0;
			s1: y <= 0;
			s2: y <= 0;
			s3: y <= 0;
			s4: y <= 1;
			
		endcase
	end 
	
endmodule
			
