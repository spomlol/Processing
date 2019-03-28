float g = 9.8/20;

class ball {
  float x;
  float y;
  float vy;
  float vx;
  float r;
  ball(float X, float Y, float VX, float R) {
    x = X;
    y = Y;
    vx = VX;
    r = R;
  }
  
  void update() {
    x += vx;
    vx *= 0.997;
    vy *= 0.997;
    if (x>=width-r) {
      x = width-r;
      vx *= -1;
    } else if  (x<r) {
      x = r;
      vx *= -1;
    }
    
    
    vy += g;
    y += vy;
    if (y >= height -r) {
      y = height -r;
      vy *= -1;
    }
  }
  void show() {
    fill(200,0,0);
    ellipse(x,y, r*2,r*2);
  }
}
