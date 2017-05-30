class SacredArduino {
  Arduino arduino;
  int n = 0, nw = 0, sw = 0, s = 0, se = 0, ne = 0;
  long millis = 0;
  
  SacredArduino(Arduino _arduino) {
    arduino = _arduino;    
  }
  
  void read() {
    n  = int(arduino.analogRead(0));
    nw = int(arduino.analogRead(1));
    sw = int(arduino.analogRead(2));
    s  = int(arduino.analogRead(3));
    se = int(arduino.analogRead(4));
    ne = int(arduino.analogRead(5));
    millis = System.currentTimeMillis();
  }
}