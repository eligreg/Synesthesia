class SacredCircle {
  SacredPoint center;
  float diameter;
  int depth, degree;
  
  SacredCircle(SacredPoint _center, float _diameter, int _depth, int _degree) {
    center = _center;
    diameter = _diameter;
    depth = _depth;
    degree = _degree;
  }
  
  void drawCircle(float n, float nw, float sw, float s, float se, float ne) {
    noFill();
    stroke(255);
    ellipse(center.x, center.y, diameter, diameter);
  }
  
  float radius() {
    return diameter / 2.0; 
  }
  
  //color randomColor() {
  //  color(random(255),random(255),random(255));
  //}
}