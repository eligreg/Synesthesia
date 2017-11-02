class SacredFlower {
  // Dimensions of Geometry
  private float sized;
  private int depth;

  // Mutable colors range
  color shakra = color(255, 255, 255);

  // Sacred Circle Storage
  ArrayList<SacredCircle> circles = new ArrayList<SacredCircle>();

  // Center Sacred Circle
  SacredCircle center;

  // Edge Cardinal Circles
  SacredCircle n, nw, sw, s, se, ne;
  SacredCircle[] edgeCardinals = new SacredCircle[6];

  // Factory Init
  SacredFlower(float _x, float _y, float _sized, int _depth) {
    sized = _sized;
    depth = _depth;

    // Center Circle
    center = new SacredCircle(new SacredPoint(_x, _y), circleDiameter());
    circles.add(center);

    // Iterate for depth
    for (int d = 1; d < depth; d++) {

      // Iterate for cardinal points
      for (int i = 0; i < 6; i++) {

        // Distance from center point
        float radius = (circleRadius() * float(d));

        // Cardinal circle at depth
        SacredCircle circle = new SacredCircle(centerPoint(radius, radiansForI(i)), circleDiameter());
        circles.add(circle);

        // Next circle (for calculation)
        SacredCircle next = new SacredCircle(centerPoint(radius, radiansForI(i+1)), circleDiameter());

        // Iterate for filler circles between current and next cardinal circles
        for (int f = 1; f <= d-1; f++) {
          float delta = float(f)/float(d);
          SacredCircle filler = new SacredCircle(centerPoint(circle, next, delta), circleDiameter());
          circles.add(filler);
        }

        // Is edge cardinal circle?
        if (d == depth-1) {
          edgeCardinals[i] = circle;
        }
      }
    }
  }

  // Cardinal Circle Center Generator
  private SacredPoint centerPoint(float radius, float radian) {
    float x = center.center.x + (radius * cos(radian));
    float y = center.center.y + (radius * sin(radian));
    return new SacredPoint(x, y);
  }

  // Delta Circle Center Generator
  private SacredPoint centerPoint(SacredCircle current, SacredCircle next, float delta) {
    float x = current.center.x - ((current.center.x - next.center.x) * delta);
    float y = current.center.y - ((current.center.y - next.center.y) * delta);
    return new SacredPoint(x, y);
  }

  // Draws the Sacred Geometry, draw loop
  void drawGeometry(SacredArduino arduino) {
    noFill();
    for (SacredCircle circle : circles) {
      float vibrance = 0.0;
      for (int i = 0; i < 6; i++) {
        SacredCircle cardinal = edgeCardinals[i];
        float vib = 0.0;
        vib += potentialVibranceForCircles(circle, cardinal);
        vib *= arduino.vibranceForIndex(i);
        vibrance += vib;
        circle.drawCircleVibrance(shakra, min(vibrance, 1.0));
      }
    }
  }

  void drawGeometry(color c) {
    noFill();
    for (SacredCircle circle : circles) {
      circle.drawCircle(c);
    }
  }

  void drawGeometry() {
    noFill();
    for (SacredCircle circle : circles) {
      circle.drawCircle();
    }
  }

  void drawGeometryRandom() {
    noFill();
    for (SacredCircle circle : circles) {
      circle.drawCircleRandom();
    }
  }

  private float radiansForI(int i) {
    return radians(degreesForI(i));
  }

  private float degreesForI(int i) {
    return (30.0 + (float(i+1) * 60.0)); // start at 90
  }

  private float circleDiameter() {
    return sized / float(depth);
  }

  private float circleRadius() {
    return (circleDiameter() / 2.0);
  }
  
  // TODO
  private float maxVibranceDistance() {
    return ((float(depth) - 1.0) * circleRadius()) + circleRadius();
  }
  
  private float minVibranceEffect() {
    return 1.0 / 6.0; 
  }
 
  private float potentialVibranceForCircles(SacredCircle curr, SacredCircle card) {
     float actualDistance = curr.distanceFrom(card);
     float lowestDistance = 0.0;
     float highestDistance = maxVibranceDistance();
     if (actualDistance > highestDistance) {
       return 0.0;
     }
     float lowestVibrance = minVibranceEffect();
     float highestVibrance = 1.0;
     //println(actualDistance + " " + lowestDistance + " " + highestDistance + " " + lowestVibrance + " " + highestVibrance);
     float pVib = map(actualDistance, lowestDistance, highestDistance, lowestVibrance, highestVibrance);
     //println(pVib);
     //print("\n");
     return 1.0 - pVib;
  }
}