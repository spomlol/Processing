class food {
  float A=150;
  PVector pos = PVector.random2D();
  float r = sqrt(A/PI);
  color col;
  food() {
    boolean intersect = true;
    while (intersect == true) {
      intersect = false;
      pos.x = pos.x*random(-PlayField[0]/2+r,PlayField[0]/2-r);
      pos.y = pos.y*random(-PlayField[1]/2+r,PlayField[1]/2-r);
      for (player pl: players) {
        if (pl.pos.dist(pos) < pl.r) {
          intersect = true;
          continue;
        }
      }
      if (p.pos.dist(pos) < p.r) {
          intersect = true;
          continue;
        }
    }
    col = color(random(0,255),255,255);
  }
  void show() {
    fill(col);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
}
