module Lab_2tb;
	reg i, clock, reset;
	wire o;
	
	Lab_2FSM dut (i, clock, reset, o);
	
	wire [2:0]p_state, n_state;
	assign p_state = dut.p_state;
	assign n_state = dut.n_state;
	
	initial begin
		clock <= 1'b0;
		reset <= 1'b1;
		i <= 1'b0;
	end
	
	always
		#5 clock <= ~clock;
		
	always
		#18 i <= ~i;
		
	always begin
		#20 reset <= 1'b0;
		#2015 reset <= 1'b1;
	end
	
	initial
		#3000 $stop;

endmodule
		