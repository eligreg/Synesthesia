class SacredCircle {
  
  SacredPoint center;
  float diameter, vibrance;

  SacredCircle(SacredPoint _center, float _diameter) {
    center = _center;
    diameter = _diameter;
    vibrance = 0.0;
  }
  
  void drawCircleVibrance(color c) {
    stroke(colorWithAlpha(c, vibranceEightBit()));
    ellipse(center.x, center.y, diameter, diameter);
    textSize(10);
    //text(nf(vibrance, 1, 2), center.x - 10.0, center.y - 20.0);
    vibrance = 0.0;
  }

  void drawCircle(color c) {
    noStroke();
    fill(c);
    ellipse(center.x, center.y, diameter, diameter);
  }

  void drawCircle() {
    stroke(255, 80);
    ellipse(center.x, center.y, diameter, diameter);
  }

  void drawCircleRandom() {
    stroke(randomColor());
    ellipse(center.x, center.y, diameter, diameter);
  }

  float radius() {
    return diameter / 2.0;
  }

  color randomColor() {
    return color(random(255), random(255), random(255));
  }
  
  int vibranceEightBit() {
    float mappedVibrance = map(vibrance, 0.0, 1.0, 0.0, 255.0);
    float containedVibrance = min(max(mappedVibrance, 0.0), 255.0);
    return int(containedVibrance);
  }
  
  color colorWithAlpha(color c, int a) {
    int r = (c >> 16) & 0xFF;
    int g = (c >> 8) & 0xFF;
    int b = c & 0xFF;
    return color(r, g, b, a);
  }
}