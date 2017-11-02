import processing.serial.*;
import cc.arduino.*;

SacredArduino arduino;
SacredFlower flower;
//DemoFlower demo;
Recorder recorder;

final boolean shouldRecord = false;


void setup() {

  size(600, 600);
  pixelDensity(2);

  // Build Arduino
  //arduino = new SacredArduino(new Arduino(this, Arduino.list()[4], 57600));
  //arduino = new SacredArduino(new Arduino(this, "/dev/tty.usbmodem621", 57600));
  arduino = new SacredArduino(null);
  arduino.fake(1,6,12,19,27,36);
  
  // Build Flower
  flower = new SacredFlower(width/2.0, height/2.0, height - 100.0, 6);
  
  // Build Demo
  //demo = new DemoFlower(width/2.0, height/2.0, height - 126.0);
  
  // Recorder
  if (shouldRecord) recorder = new Recorder();
}

void draw() {

  // Reset background color
  background(127);
  
  // Read arduino
  //arduino.read();
  arduino.fake();
  
  // Draw Flower
  //flower.drawGeometry(); 
  flower.drawGeometry(arduino);

  // Draw Demo
  //demo.drawGeometry(arduino);
  
  // Record
  if (shouldRecord) recorder.recordArduino(arduino);
}