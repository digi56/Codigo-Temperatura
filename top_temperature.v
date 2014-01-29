module top_temperature(
	input clk,
	input [7:0] tpRef, //Referencia
	input sensor, // Datos de entrada del sensor

	output onOff, //Prender Apagar
	output cSensor, //Señal enable para el sensor
	output clkSensor, //Clk para el sensor
	output [7:0]tempReal, //**Temperatura**
	output [6:0]display,
	output [3:0]anodo
	);
	wire [7:0] w_refTemp;
	wire w_load, w_toCompare; // señales de control
	
	comp comparador( .tempDone(tempReal), .tempRef(tpRef), .readyToC(w_toCompare), .onOff( onOff ));
	control contl( .tempReady(cSensor), .load(w_load), .clk(clk), .compareData(w_toCompare) );
	temperature tempSensor( .clk(clk), .so(sensor), .cs(cSensor), .clkS(clkSensor), .tempDone(tempReal) );
	seg7 segmentos( .load(w_load), .temptDone(tempReal), .clk(clk), .display(display), .anodo(anodo) );
endmodule
