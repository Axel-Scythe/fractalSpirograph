int k = -5;

class Orbit {
  float x;
  float y;
  float r;
  Orbit parent;
  Orbit child;
  float speed;
  float angle;
  int n;

  Orbit(float x_, float y_, float r_, int n_) {
    this(x_, y_, r_, n_, null);
  }

  Orbit(float x_, float y_, float r_, int n_, Orbit p) {
    x = x_;
    y = y_;
    r = r_;
    n = n_;
    speed = (radians(pow(k, n-1)))/resolution;
    parent = p;
    child = null;
    angle = -PI/2;
  }

  void show() {
    stroke(0, 255, 255);
    strokeWeight(1);
    noFill();   
    ellipse(x, y, r * 2, r * 2);
  }

  Orbit addChild() {
    float newR = r/3;
    float newX = x + r + newR;
    float newY = y;
    child = new Orbit(newX, newY, newR, n + 1, this);
    return child;
  }

  void update() {
    if (parent != null) {
      angle -= speed;
      float rsum = r + parent.r;
      x = parent.x + rsum * cos(angle);
      y = parent.y + rsum * sin(angle);
    }
  }
}