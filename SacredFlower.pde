class SacredFlower {
  // Dimensions of Geometry
  float centerX, centerY, _width, _height;
  int depth;
  
  // Mutable colors range
  color loud = color(204, 153, 0);
  color quiet = color(204, 153, 0);
  
  // Sacred Circle Storage
  ArrayList<SacredCircle> circles = new ArrayList<SacredCircle>();
  
  // Factory Init
  SacredFlower(float _x, float _y, float _sized, int _depth) {
    centerX = _x;
    centerY = _y;
    _width = _sized;
    _height = _sized;
    depth = _depth;
  }
  
  // Builds the Sacred Geometry, 1 time call
  void buildGeometry() {
     // Center Circle
     SacredCircle center = new SacredCircle(new SacredPoint(centerX, centerY), circleDiameter(), 0, 0);
     circles.add(center);
     // Build first 6
     for (int d = 1; d < depth; d++) {
        for (int i = 0; i < 6; i++) {
          // Draw Cardinal Circle
          float x = centerX + (circleRadius() * float(d)) * cos(radiansForI(i));
          float y = centerY + (circleRadius() * float(d)) * sin(radiansForI(i));
          SacredCircle circle = new SacredCircle(new SacredPoint(x, y), circleDiameter(), d, int(degreesForI(i)));
          circles.add(circle);
          x = centerX + (circleRadius() * float(d)) * cos(radiansForI(i+1));
          y = centerY + (circleRadius() * float(d)) * sin(radiansForI(i+1));
          SacredCircle next = new SacredCircle(new SacredPoint(x, y), circleDiameter(), d, int(degreesForI(i+1)));
          // Draw all filler Circles
          for (int f = 1; f <= d-1; f++) {
             float delta = float(f)/float(d);
             x = circle.center.x - ((circle.center.x - next.center.x) * delta);
             y = circle.center.y - ((circle.center.y - next.center.y) * delta);
             SacredCircle filler = new SacredCircle(new SacredPoint(x, y), circleDiameter(), d, int(degreesForI(i+1)));
             circles.add(filler);
          }
        }  
     }

  }
  
  // Draws the Sacred Geometry, draw loop
   void drawGeometry(float n, float nw, float sw, float s, float se, float ne) {
      pushMatrix();
      for (SacredCircle circle: circles) {
        circle.drawCircle(n, nw, sw, s, se, ne);
      }
      popMatrix();
  }
  
  float radiansForI(int i) {
    return radians(degreesForI(i));
  }
  
  float degreesForI(int i) {
    return (30.0 + (float(i+1) * 60.0)); // start at 90
  }
  
  float circleDiameter() {
    return _height / float(depth);
  }
  
  float circleRadius() {
    return (circleDiameter() / 2.0);
  }
}