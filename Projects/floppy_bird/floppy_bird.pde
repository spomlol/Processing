float g = 0.5;
boolean dead=false;
birds bird = new birds();
obstacles obstacle = new obstacles();
void setup() {
  size (1000, 1000);
}

void draw() {
  background(0);
  bird.show();
  bird.update();
  obstacle.show();
  obstacle.update();
  obstacle.validate();
}


void mousePressed() {
  if (dead == false) {
    bird.v = -8;
  }
}


class birds {
  float y = 500;
  float r = 50;
  float v = 0;
  void show() {
    fill(125);
    ellipse(200, this.y, this.r, this.r);
  }

  void update() {
    if (this.y < 1000-this.r) {
      this.y += this.v;
      this.v += g;
    } else if (this.v <0) {
      this.y += this.v;
      this.v += g;
    } else {
      this.y=1000-this.r;
    }
  }
}

class obstacles {
  int y = floor(random(300, 700));
  int x = 1000;
  int vx = 10;
  int w = 100;
  void show() {
    rect(x, 0, w, y);
    rect(x, y+200, w, 1000);
  }

  void update() {
    this.x -= this.vx;
    if (this.x < -w) {
      this.x = 1000;
      this.y = floor(random(300, 700));
    }
  }

  void validate() {
    if (this.x < bird.r + 200 && this.x > 200-bird.r && (this.y > bird.y-bird.r || this.y+200 < bird.y+bird.r)) {
      this.vx=0;
      dead = true;
    }
  }
}
