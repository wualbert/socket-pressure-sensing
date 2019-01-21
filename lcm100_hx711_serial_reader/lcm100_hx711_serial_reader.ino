/*
 * Arduino code for reading Futek LCM100 force sensor with Sparkfun HX711 ADC
 * The value read is sent back through serial
 * A separate MATLAB script is used to process the data
 * 
 * This code is based on Sparkfun's HX711 example code
 * available here: https://github.com/sparkfun/HX711-Load-Cell-Amplifier
 * 
 * Albert Wu (wualbert@mit.edu)
 * 2019 January
 */
#include <HX711.h>

#define DOUT  3
#define CLK  2

HX711 scale(DOUT, CLK);

float calibration_factor = 1000; //TBD

void setup() {
  Serial.begin(9600);
  scale.set_scale(calibration_factor);
  scale.tare(); //Reset the scale to 0
}

void loop() {
  Serial.print(millis());
  Serial.print(",");
  Serial.print(scale.get_units(), 1); //prints value
  Serial.println();
  //For reading serial inputs
  if(Serial.available())
  {
  }
}
