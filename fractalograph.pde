int resolution = 50;
float hu;
ArrayList<PVector> path;
Orbit end;
float angle = 0;

Orbit root;

void setup() {
  //size(500, 500);
  fullScreen();
  background(86);
  path = new ArrayList<PVector>();
  root = new Orbit(width/2, height/2, width/6, 0);
  Orbit next = root;
  for (int i = 0; i < 10; i++) {
    next = next.addChild();
  }
  end = next;
}

//x = r * cos(a)
//y = r * sin(a)

void draw() {
  background(0);
  //for (int i = 0; i < resolution; i++) {
    Orbit current = root;
    while (current != null) {
      current.update();
      current.show();
      current = current.child;
    }
    path.add(new PVector(end.x, end.y));
  //}
  noFill();
  angle += PI/resolution;

  if (angle >= (3 * PI/2) * 5 * resolution) {
    background(0);
    stroke(255,0,0);
    noFill();
    println("DONE");
    beginShape();
    for (PVector p : path) {
      vertex(p.x, p.y);
    }
    endShape();

    noLoop();
  }
}