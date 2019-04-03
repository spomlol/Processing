int length = 100;
int i;

ball[] ballsarray = new ball[length];


void setup() {
  size(1000, 1000);


  for (i=0; i<length; i++) {
    int r = floor(random(15, 25));
    ballsarray[i] = new ball(floor(random(0+r, 1000-r)), floor(random(0, 900)), r);
  }
}

void draw() {
  background(0);
  for (i=0; i <length; i++) {
    ballsarray[i].show();
    ballsarray[i].update();
  }
}


void mousePressed() {
  for (i=0; i <length; i++) {
    ballsarray[i].v -= 10;
  }
}






class ball {
  float x;
  float y;
  float r;
  float v = 0.3;
  float a = 9.81/60;
  int red = floor(random(0,255));
  int green = floor(random(0,255));
  int blue = floor(random(0,255));
  
  
  ball(float x, float y, float r) {
    this.x=x;
    this.y=y;
    this.r=r;
  }

  void show() {
    noStroke();
    fill(color(this.red,this.green,this.blue));
    ellipse(this.x, this.y, this.r, this.r);
  }

  void update() {
    if (this.y < 1000-this.r ) {
      this.y += this.v;
      this.v += this.a;
    } else if (this.v >=0) {
      this.v = -this.v;
    } else {
      this.y += this.v;
      this.v += this.a;
    }
    this.v = this.v*0.995;
  }
}
