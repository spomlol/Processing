class ball {
  PVector pos = new PVector(width/2,height/2);
  float r;
  boolean del = false;
  ball(float x, float y, float r) {
    pos.x=x;
    pos.y=y;
    this.r = r;
  }
  void show() {
    fill(255);
    circle(pos.x, pos.y,r*2);
  }
  void update() {
    pos.x+=random(-5,5);
    pos.y+=random(-5,5);
    if (pos.x>=width) {pos.x=width-1;}
    if (pos.x<=0) {pos.x=1;}
    if (pos.y>=height) {pos.y=height-1;}
    if (pos.y<=0) {pos.y=1;}
    r+=food[int(pos.x)][int(pos.y)]-0.5;
    if(r>40) {
      del = true;
      PVector dir = PVector.random2D();
      dir.mult(20);
      balls.add(new ball(pos.x+dir.x,pos.y+dir.y,20));
      balls.add(new ball(pos.x-dir.x,pos.y-dir.y,20));
    }
    if (r<10) {del=true;}
    for (ball b: balls) {
      if (dist(pos.x,pos.y,b.pos.x,b.pos.y) < r+b.r && pos.x!=b.pos.x) {
        PVector dir = PVector.random2D();
        dir.mult(r);
        pos.x+=dir.x;
        pos.y+=dir.y;
        b.pos.x -= dir.x;
        b.pos.y -= dir.y;
      }
    }
  }
}
