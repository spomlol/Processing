
class spring {
  node a;
  node b;
  PVector Fa = new PVector();
  PVector Fb = new PVector();
  PVector g = new PVector();
  float[] DNA = new float[time];
  float dist=100;
  spring(node a1, node b1, int index) {
    a = a1;
    b = b1;
    g.set(0,-0.5);
    for (int j = 0; j<time; j++) {
      DNA[j] = noise(j/20.0,index*chromosomes)*2;
    }
  }
  spring(node a1, node b1, float d, int index) {
    a = a1;
    b = b1;
    g.set(0,-1);
    dist = d;
    for (int j = 0; j<time; j++) {
      DNA[j] = noise(j/20.0,index*chromosomes)*2;
    }
  }
  spring(node a1, node b1, float d, float[] DNa) {
    a = a1;
    b = b1;
    g.set(0,-1);
    dist = d;
    DNA =DNa;
  }
  void show() {
    strokeWeight(8);///DNA[frameCount%time]);
    line(a.pos.x,a.pos.y,b.pos.x,b.pos.y);
    strokeWeight(4);
  }
  void update() {
    float k = 0.4;
    float d = 0.8;
    float angle = atan2(b.pos.y-a.pos.y,b.pos.x-a.pos.x);
    float angle2 = atan2(a.pos.y-b.pos.y,a.pos.x-b.pos.x);
    Fa.set(a.pos.x-b.pos.x +(dist*DNA[timer%time]*cos(angle)),a.pos.y-b.pos.y +(dist*DNA[timer%time]*sin(angle)));
    Fb.set(b.pos.x-a.pos.x +(dist*DNA[timer%time]*cos(angle2)),b.pos.y-a.pos.y +(dist*DNA[timer%time]*sin(angle2)));
    a.vel.add(Fa.mult(-k));
    b.vel.add(Fb.mult(-k));
    a.vel.mult(d);
    b.vel.mult(d);
    a.vel.add(g);
    if(a.pos.y != a.r) {
      a.pos.add(a.vel);
    }
    else {
      a.pos.add(a.vel.mult(a.friction));
    }
    if (a.pos.y < a.r) {
      a.pos.y = a.r;
      a.vel.y=0;
    }
    b.vel.add(g);
    //println(b.vel.y);
    if(b.pos.y != b.r) {
      b.pos.add(b.vel);
    }
    else {
      b.pos.add(b.vel.mult(b.friction));
    }
    if (b.pos.y < b.r) {
      b.pos.y = b.r;
      b.vel.y=0;
    }
  }
}

class node {
  PVector pos = new PVector();
  PVector vel = new PVector();
  float r =20;
  boolean selected = false;
  float friction = random(0,1);
  node(float x, float y) {
    pos.x = x;
    pos.y = y;
  }
  node(float x, float y, float fric) {
    pos.x = x;
    pos.y = y;
    friction = fric;
  }
  void update() {
    if (selected == true) {
      pos.x = mouseX-width/2;
      pos.y = -mouseY+height/2+200;
    }
    
  }
  void show() {
    fill(lerpColor(color(255),color(255,0,0),friction));
    ellipse(pos.x,pos.y,r*2,r*2);
    fill(255);
  }
}
