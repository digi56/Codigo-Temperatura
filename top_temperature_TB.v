module top_temperature_TB;

	reg clk;
	reg [7:0] tpRef;	
	reg sensor;

	wire onOff;
	wire [6:0] disp;
	wire cSensor;
	wire clkSensor;
	wire [3:0]anod;
	wire [7:0]tempReal;
	
	top_temperature uut ( .clk(clk), .tpRef(tpRef), .sensor(sensor), .onOff(onOff), .display(disp), .cSensor(cSensor), .clkSensor(clkSensor), .anodo(anod), .tempReal(tempReal) );
	
	initial begin  // Initialize Inputs
		clk = 1'b0;
		sensor = 1'b0;
		tpRef = 23;
	end
	
	initial begin
		forever begin
			#1
			clk = ~clk;
			
		end
	end

	initial begin
		forever begin	
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;

			#100000 //24-5
			sensor = 1'b0;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;

			#100000 //else
			sensor = 1'b0;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b1;	

			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;

			#100000 //31-5
			sensor = 1'b1;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b1;

			#100000 //else
			sensor = 1'b0;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b0;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b1;
			#100000
			sensor = 1'b0;	
		end
	end
	
	initial begin: TEST_CASE
		$dumpfile("top_temperature_TB.vcd");
		$dumpvars(-1, uut);
		#3500000 $finish;
	end

endmodule
