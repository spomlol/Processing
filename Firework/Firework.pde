ArrayList<firework> fireworks;
int i, j;
ArrayList<explosion> explosions;

void setup() {
  size(1000, 1000);
  fireworks = new ArrayList<firework>();
  explosions = new ArrayList<explosion>();
  for (i=0; i < 1000; i++) {
    fireworks.add(new firework());
  }
}

void draw() {
  background(0);
  for (i=fireworks.size()-1; i >= 0; i--) {
    firework f = fireworks.get(i);
    f.show();
    f.evaluate();
    if (f.time ==0) {
      int red = floor(random(0, 255));
      int green = floor(random(0, 255));
      int blue = floor(random(0, 255));
      for  (j = 0; j <10; j++) {

        explosions.add(new explosion(f.x, f.y, red, green, blue));
      }
      fireworks.remove(i);
    }
  }
  for (i=explosions.size()-1; i >= 0; i--) {
    explosion e = explosions.get(i);
    e.show();
    e.evaluate();
    float die = random(0,100);
    if(die <2) {
      explosions.remove(i);
    }
  }
}

class firework {
  int time = floor(random(100, 200));
  float x = (random(5, 995));
  float y = 1000;
  float vx, vy = 0;
  float ay = random(0.5, 1)*0.07;
  float ax = random(-5, 5);
  int h = 10;

  void show() {
    stroke(255);
    line(x, y, x, y-h);
  }

  void evaluate() {
    this.time --;
    this.y += this.vy;
    this.vy -= this.ay;
    if (this.time ==0) {
      this.vy=0;
      this.ay=0;
    }
  }
}

class explosion {
  PVector x;
  PVector y;
  int red;
  int green;
  int blue;
  float vx;
  float vy;
  explosion(float x, float y, int red, int green, int blue) {
    float angle = random(0, TWO_PI);
    this.x = new PVector(x, x+10*sin(angle));
    this.y = new PVector(y, y+10*cos(angle));
    this.red = red;
    this.green = green;
    this.blue = blue;
    this.vx = sin(angle);
    this.vy = cos(angle);
  }

  void show() {
    stroke(color(this.red, this.green, this.blue));
    line(this.x.x, this.y.x, this.x.y, this.y.y);
  }
  
  void evaluate() {
    this.x.x += this.vx;
    this.y.x += this.vy;
    this.x.y += this.vx*0.2;
    this.y.y += this.vy*0.2;
  }
}
