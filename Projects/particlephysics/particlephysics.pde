ArrayList<particle> particles = new ArrayList();
void setup() {
  //frameRate(1);
  //fullScreen();
  size(1080,1080);
  for (int i = 0; i<500; i++) {
    particles.add(new particle("H"));
  }
  for (int i = 0; i<50; i++) {
    particles.add(new particle("F"));
  }
}

void draw() {
  //Show
  background(255);
  fill(0, 0, 200);
  for (particle p: particles) {
    p.show();
    p.update();
  }
}
