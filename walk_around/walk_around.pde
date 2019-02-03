int w = 50;
int g = 2;
player play = new player();
void setup() {
  size(1000, 1000);
}

void draw() {
  background(0);
  play.show();
  play.update();
}

void keyPressed() {
  if (keyCode == UP) {
    if (play.y == 1000 || play.x==0 || play.x==1000-w){
      play.vy = -30;
    }
  }
  if (keyCode == LEFT) {
    play.vx = -20;
  }
  if (keyCode == RIGHT) {
    play.vx = 20;
  }
  if (keyCode == DOWN) {
    play.vx = 20;
  }
}
void keyReleased(){
  if (keyCode == LEFT || keyCode == RIGHT) {
    play.vx = 0;
  }
}


class player {
  float x = 200;
  float y = 1000;
  int vx = 0;
  int vy = 0;
  void show() {
    rect(x, y, w, -w);
  }

  void update() {
    if (this.y<1000) {
      this.y += this.vy;
      this.vy += g;
    } else if (this.y == 1000 && this.vy < 0) {
      this.y += this.vy;
      this.vy += g;
    } else  {
      this.vy=0;
      this.y=1000;
    }

    if (this.x >= 0 && this.x <= 1000-w) {
      this.x += this.vx;
    } else {
      this.vx = 0; 
      if (this.x < 0) {
        this.x = 0;
      }
      if (this.x > 1000-w) {
        this.x = 1000-w;
      }
    }
  }
}
