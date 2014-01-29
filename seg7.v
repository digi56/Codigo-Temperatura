module seg7(
	input load,
	input [7:0] temptDone,
	input clk,
	output reg[6:0] display,
	output reg[3:0] anodo
    );  
	reg[6:0] unidades =  7'b0110110;
	reg[6:0] decenas =  7'b1001001;

	parameter c0 = 7'b1000000, c1 = 7'b1111001,
	c2 = 7'b0100100, c3 = 7'b0110000,
	c4 = 7'b0011001, c5 = 7'b0010010,
	c6 = 7'b0000010, c7 = 7'b1111000,
	c8 = 7'b0000000, c9 = 7'b0011000;
	
	reg [9:0] cont = 'd1000;
	reg clkV = 0;

	always @ ( posedge clkV ) //señal control
	begin
		if ( anodo == 4'b1110) begin
			anodo <= 4'b1101;
			display <= decenas;
		end
		else begin
			anodo <= 4'b1110;
			display <= unidades;
		end
	end

	always @ (posedge clk)
	begin
		if ( cont == 0 )begin
			cont <= 'd1000;
			clkV <= ~clkV;
		end
		else begin
			cont <= cont - 1'b1;
		end
	end

	always @ ( posedge load ) //señal control
	begin
		case( temptDone )
			0: unidades <= c0;
			1: unidades <= c1;
			2: unidades <= c2;
			3: unidades <= c3;
			4: unidades <= c4;
			5: unidades <= c5;
			6: unidades <= c6;
			7: unidades <= c7;
			8: unidades <= c8;
			9: unidades <= c9;
			10: unidades <= c0;
			11: unidades <= c1;
			12: unidades <= c2;
			13: unidades <= c3;
			14: unidades <= c4;
			15: unidades <= c5;
			16: unidades <= c6;
			17: unidades <= c7;
			18: unidades <= c8;
			19: unidades <= c9;
			20: unidades <= c0;
			21: unidades <= c1;
			22: unidades <= c2;
			23: unidades <= c3;
			24: unidades <= c4;
			25: unidades <= c5;
			26: unidades <= c6;
			27: unidades <= c7;
			28: unidades <= c8;
			29: unidades <= c9;
			30: unidades <= c0;
			31: unidades <= c1;
			32: unidades <= c2;
			33: unidades <= c3;
			34: unidades <= c4;
			35: unidades <= c5;
			36: unidades <= c6;
			37: unidades <= c7;
			38: unidades <= c8;
			39: unidades <= c9;
			40: unidades <= c0;
			41: unidades <= c1;
			42: unidades <= c2;
			43: unidades <= c3;
			44: unidades <= c4;
			45: unidades <= c5;
			46: unidades <= c6;
			47: unidades <= c7;
			48: unidades <= c8;
			49: unidades <= c9;
			50: unidades <= c0;
			51: unidades <= c1;
			52: unidades <= c2;
			53: unidades <= c3;
			54: unidades <= c4;
			55: unidades <= c5;
			56: unidades <= c6;
			57: unidades <= c7;
			58: unidades <= c8;
			59: unidades <= c9;
			60: unidades <= c0;
			61: unidades <= c1;
			62: unidades <= c2;
			63: unidades <= c3;
		endcase
		case( temptDone )
			0: decenas <= c0;
			1: decenas <= c0;
			2: decenas <= c0;
			3: decenas <= c0;
			4: decenas <= c0;
			5: decenas <= c0;
			6: decenas <= c0;
			7: decenas <= c0;
			8: decenas <= c0;
			9: decenas <= c0;
			10: decenas <= c1;
			11: decenas <= c1;
			12: decenas <= c1;
			13: decenas <= c1;
			14: decenas <= c1;
			15: decenas <= c1;
			16: decenas <= c1;
			17: decenas <= c1;
			18: decenas <= c1;
			19: decenas <= c1;
			20: decenas <= c2;
			21: decenas <= c2;
			22: decenas <= c2;
			23: decenas <= c2;
			24: decenas <= c2;
			25: decenas <= c2;
			26: decenas <= c2;
			27: decenas <= c2;
			28: decenas <= c2;
			29: decenas <= c2;
			30: decenas <= c3;
			31: decenas <= c3;
			32: decenas <= c3;
			33: decenas <= c3;
			34: decenas <= c3;
			35: decenas <= c3;
			36: decenas <= c3;
			37: decenas <= c3;
			38: decenas <= c3;
			39: decenas <= c3;
			40: decenas <= c4;
			41: decenas <= c4;
			42: decenas <= c4;
			43: decenas <= c4;
			44: decenas <= c4;
			45: decenas <= c4;
			46: decenas <= c4;
			47: decenas <= c4;
			48: decenas <= c4;
			49: decenas <= c4;
			50: decenas <= c5;
			51: decenas <= c5;
			52: decenas <= c5;
			53: decenas <= c5;
			54: decenas <= c5;
			55: decenas <= c5;
			56: decenas <= c5;
			57: decenas <= c5;
			58: decenas <= c5;
			59: decenas <= c5;
			60: decenas <= c6;
			61: decenas <= c6;
			62: decenas <= c6;
			63: decenas <= c6;
		endcase
	end
	
endmodule
