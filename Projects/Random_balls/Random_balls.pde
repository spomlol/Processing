ball b;
ArrayList<ball> balls;
void setup(){
  fullScreen();
  balls = new ArrayList();
  for (int i=0; i<10; i++) {
    balls.add(new ball(random(200,width-200),random(200,height-200), random(15,35), random(20,150)));
  }
}

void draw() {
  background(255);
  for (ball b: balls) {
    b.update();
    b.show();
  }
}
