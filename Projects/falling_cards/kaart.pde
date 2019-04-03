class card {
  float x;
  float y = 50;
  float g = 9.8/10;
  float vy = 0;
  float vx = 0;
  color c;
  
  card() {
    x = random(75/2,width-75/2);
    y = 50;
    vy = 0;
    if (random(0,1)<0.5) {
      vx = random(-15,-4);
    } else {
      vx = random(4,15);
    }
      vy = random(-15,15);
      c=color(random(0,255),random(0,255),random(0,255));
  }
  void show() {
    rectMode(CENTER);
    fill(c);
    rect(x,y,75,100);
  }
  void update() {
    vy+=g;
    y+=vy;
    x+=vx;
    if (y>height-50) {
      vy=-vy/1.5;
      y=height-50;
    }
  }
}
