import processing.serial.*;
import cc.arduino.*;

SacredArduino arduino;
SacredFlower flower;
DemoFlower demo;
Recorder recorder;

final boolean shouldRecord = false;

void setup() {

  size(600, 600);
  pixelDensity(2);

  // Build Arduino
  arduino = new SacredArduino(new Arduino(this, Arduino.list()[4], 57600));
  //arduino = new SacredArduino(new Arduino(this, "/dev/tty.usbmodem621", 57600));
  
  // Build Flower
  flower = new SacredFlower(width/2.0, height/2.0, height - 100.0, 4);
  
  // Build Demo
  demo = new DemoFlower(width/2.0, height/2.0, height - 126.0);
  
  // Recorder
  if (shouldRecord) recorder = new Recorder();
}

void draw() {

  // Reset background color
  background(127);
  
  // Read arduino
  arduino.read();
  
  // Draw Flower
  flower.drawGeometry(); 

  // Draw Demo
  demo.drawGeometry(arduino);
  
  // Record
  if (shouldRecord) recorder.recordArduino(arduino);
}