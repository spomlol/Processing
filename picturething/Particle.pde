class particle {
  float x;
  float y;
  color c;
  float xoff;
  float yoff;
  float vx;
  float vy;
  float t;
  particle(float X, float Y) {
    //x=X;
    //y=Y;
    //c = im.get(int(x),int(y));
    xoff = random(1000);
    yoff = random(1000);
    //vy = dist(x,y,x,height+4)/100;
    
    x = width/2;
    y = height/2;
    vx = random(-1,1)*5;
    vy = random(-1,1)*5;
  }
  void show(float angle) {
    c = im.get(int(x),int(y));
    fill(c,125);
    //float X = x + 50*(noise(xoff+cos(angle),yoff+sin(angle))-0.5);
    //float Y = y + 50*(noise(yoff+cos(angle),xoff+sin(angle))-0.5);

    circle(x,y,10);
    x += vx;
    y += vy;
    if (x > width || x <0) {
      vx *= -1;
    }
    if (y > height || y <0) {
      vy *= -1;
    }
  }
}
