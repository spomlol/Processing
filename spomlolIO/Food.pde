class food {
  float A=150;
  PVector pos = PVector.random2D();
  float r = sqrt(A/PI);
  color col;
  food() {
    pos.x = pos.x*random(-PlayField[0]/2+r,PlayField[0]/2-r);
    pos.y = pos.y*random(-PlayField[1]/2+r,PlayField[1]/2-r);
    col = color(random(0,255),255,255);
  }
  void show() {
    fill(col);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
}
