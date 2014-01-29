module temperature(
	input clk,
	input so, 
	output reg cs, 
	output reg clkS,
	output reg[7:0] tempDone
    );  
	 
	reg clkCs = 0;
	reg[3:0] cont = 0;
	reg[15:0] temperTemp = 0;
	
	//reg done;
	reg[14:0] contF = 'd25000;
	reg[13:0] contCs = 'd12500;
	initial begin
		cs = 0;
		clkS = 0;
		tempDone = 0;
	end
	
	always @ (posedge clk)
	begin
		if ( contF == 0 )begin
			contF <= 'd25000;
			clkS <= ~clkS;
		end
		else begin
			contF <= contF - 1'b1;
		end
		//para señal cs
		if ( contCs == 0 )begin
			contCs <= 'd12500;
			clkCs <= ~clkCs;
		end
		else begin
			contCs <= contCs - 1'b1;
		end
	end
	
	always @ (negedge clkS)
	begin	
		if (cont == 15)
			cont <= 1'b0;
		else
			cont <= cont + 1'b1;
	end
	reg helpCs = 0;
	always @ (posedge clkCs)
	begin	
		if (cont == 15 && helpCs == 1)begin
			cs <= 1'b1;
		end																																																																																
		if (cont == 0 )begin
			cs <= 1'b0;
		end
		helpCs <= ~helpCs;
	end // bajarlo en 1/4 del 0, subirlo a 3/4 del 15

	always @ ( posedge clkS )
	begin
		case( cont )
			0: temperTemp[15] <= so;
			1: temperTemp[14] <= so;
			2: temperTemp[13] <= so; 
			3: temperTemp[12] <= so;
			4: temperTemp[11] <= so;
			5: temperTemp[10] <= so;
			6: temperTemp[9] <= so;
			7: temperTemp[8] <= so;
			8: temperTemp[7] <= so;
			9: temperTemp[6] <= so;
			10: temperTemp[5] <= so;
			11: temperTemp[4] <= so;
			12: temperTemp[3] <= so;
			13: temperTemp[2] <= so;
			14: temperTemp[1] <= so;
			15: temperTemp[0] <= so;
		endcase
		if ( cont == 15 )
		begin
			tempDone <= temperTemp[14:7] - 5; //4 calibration
		end
	end
	
endmodule
