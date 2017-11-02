class SacredArduino {
  Arduino arduino;
  int n = 0, nw = 0, sw = 0, s = 0, se = 0, ne = 0;
  int max = 100;
  long millis = 0;
  
  // Mark: Fake
  boolean N = true, NW = true, SW = true, S = true, SE = true, NE = true;
  
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
  
  void fake(int _n, int _nw, int _sw, int _s, int _se, int _ne) {
    n = _n;
    nw = _nw;
    sw = _sw;
    s = _s;
    se = _se;
    ne = _ne;
  }
  
  float vibranceForIndex(int idx) {
     switch (idx) {
       case 0:
         return float(n) / float(max);
       case 1:
         return float(nw) / float(max);
       case 2:
         return float(sw) / float(max);
       case 3:
         return float(s) / float(max);
       case 4:
         return float(se) / float(max);
       case 5:
         return float(ne) / float(max);
       default:
         return 0.0;
     }
  }
  
  void fake() {
  int inc = 12;
  int top = 61;
  int bot = 0;
  n += N ? inc : -inc;
  if (n >= top || n <= bot) {
    N = !N;
  }
  nw += NW ? inc : -inc;
  if (nw >= top || nw <= bot) {
    NW = !NW;
  }
  sw += SW ? inc : -inc;
  if (sw >= top || sw <= bot) {
    SW = !SW;
  }
  s += S ? inc : -inc;
  if (s >= top || s <= bot) {
    S = !S;
  }
  se += SE ? inc : -inc;
  if (se >= top || se <= bot) {
    SE = !SE;
  }
  ne += NE ? inc : -inc;
  if (ne >= top || ne <= bot) {
    NE = !NE;
  }
}
}