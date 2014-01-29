module comp(
	input [7:0] tempDone,
	input [7:0] tempRef,
	input readyToC,
	output reg onOff
    );  
	initial begin
		onOff = 0;
	end
	always @ (posedge readyToC)
	begin	
		
		if ( onOff == 0 )begin
			if ( tempDone < tempRef-1 )//isteresis
				onOff = 1;
		end
		else begin 
			if ( tempDone > tempRef-1 )
				onOff = 0;
		end
	end	
endmodule
