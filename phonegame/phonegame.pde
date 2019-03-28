player p;
ArrayList<PVector> level1 = new ArrayList();
boolean click = false;
void setup() {
  orientation(LANDSCAPE);
  //size(1000,1000);
  fullScreen();
  p = new player();
  colorMode(HSB);
}

void draw() {
  //translate(width/2,height/2);
  //scale(0.05);
  background(frameCount/4%255,255,155);
  stroke(255,125);
  //drawlevel();
  translate(width/2-p.pos.x,height/2-p.pos.y);
  for (int i = -100; i<100; i++) {
    line(i*100,-10000,i*100,10000);
  }
  for (int i = -100; i<100; i++) {
    line(-10000,i*100,10000,i*100);
  }
  stroke(255);
  ellipse(-9500,-9500,200,200);
  ellipse(9500,9500,200,200);
  noFill();
  rect(-10000,-10000,20000,20000);
  fill(255);
  p.update();
  p.show();
  
  
}

class player {
  PVector pos = new PVector();
  PVector vel = new PVector();
  float stvel=15;
  float angle=0;
  float anglechange;
  void show() {
    fill(255);
    stroke(0);
    triangle(pos.x,pos.y,pos.x+100*cos(angle+PI/8),pos.y + 100*sin(angle+PI/8),pos.x+100*cos(angle-PI/8),pos.y+100*sin(angle-PI/8));
    //angle+=0.1;
  }
  void update() {
    angle+=anglechange;
    vel.x = -cos(angle)*stvel;
    vel.y = -sin(angle)*stvel;
    //color testcolor = get(int(pos.x+vel.x),int(pos.y+vel.y));
    //println(testcolor);
    //if (testcolor == color(125)) {
      pos.add(vel);
    //}
    if (pos.x > 10000) {
      pos.x = 10000;
    }
    if (pos.x < -10000) {
      pos.x = -10000;
    }
    if (pos.y > 10000) {
      pos.y = 10000;
    }
    if (pos.y < -10000) {
      pos.y = -10000;
    }
    if(dist(pos.x,pos.y,-9500,-9500)<100) {
      pos.x +=19500;
      pos.y +=19500;
      vel.mult(-1);
    }
    if(dist(pos.x,pos.y,9500,9500)<100) {
      pos.x -=19500;
      pos.y -=19500;
      vel.mult(-1);
    }
  }
}

void mousePressed() {
  click=true;
  if (mouseX < width/2) {
    p.anglechange+=0.1;
    
  }
  if (mouseX > width/2) {
    p.anglechange-=0.1;
  }
}
void mouseReleased() {
    p.anglechange=0;
    click=false;
}

void drawlevel() {
  strokeWeight(10);
  fill(125);
  beginShape();
  for (PVector v: level1) {
    vertex(v.x,v.y);
  }
  endShape(CLOSE);
  
  if (click) {
    level1.add(new PVector((mouseX-width/2)*20,(mouseY-height/2)*20));
  }
}
