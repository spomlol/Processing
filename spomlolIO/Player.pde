class player {
  PVector pos = PVector.random2D();
  PVector vel = new PVector();
  PVector acc = new PVector();
  float A = 2000;
  float r = sqrt(A/PI);
  color col;
  int ai;
  String name;
  player(int ai, int n) {
    //XML xml = loadXML("https://www.behindthename.com/api/random.xml?usage=ita&key=sp498647499");
    //XML[] names = xml.getChildren("names");
    try {
    //name = names[0].getContent();
    } catch (Exception e){}
    pos.x = pos.x*random(-PlayField[0]/2+r,PlayField[0]/2-r);
    pos.y = pos.y*random(-PlayField[1]/2+r,PlayField[1]/2-r);
    col = color(random(0,255),255,255);
    this.ai = ai;
    if (ai != -1 && n == 0) {
      A = random(2000,20000);
    }
  }
  void show(boolean c) {
    r = sqrt(A/PI);
    if (c) {
    translate(width/2-p.pos.x,height/2-p.pos.y);
    fill(255);
    rect(-PlayField[0]/2,-PlayField[1]/2,PlayField[0],PlayField[1]);
    }
    if (ai != -1 || (deadpl == false && ai == -1)) {
    fill(col);
    ellipse(pos.x,pos.y,r*2,r*2);
    line(pos.x,pos.y,pos.x + r*cos(vel.heading()),pos.y + r*sin(vel.heading()));
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(r/2);
    if (name != null) {
    text(name,pos.x,pos.y);
    }
    }
  }
  void update() {
    vel.add(acc);
    vel.mult(0.995);
    vel.x=constrain(vel.x,-10,10);
    vel.y=constrain(vel.y,-10,10);
    pos.add(vel);
    pos.x = constrain(pos.x,-PlayField[0]/2+r,PlayField[0]/2-r);
    pos.y = constrain(pos.y,-PlayField[1]/2+r,PlayField[1]/2-r);
    if(pos.x == -r+PlayField[0]/2 || pos.x == r-PlayField[0]/2){
      vel.x *= -1;
    }
    if(pos.y == -r+PlayField[1]/2 || pos.y == r-PlayField[1]/2){
      vel.y *= -1;
    }
  }
  void updateAI() {
    float ax;
    float ay;
    if (noise(frameCount/20,ai*2)<0.5) {
      ax = -0.1;
    } else {
      ax = 0.1;
    }
    if (noise(frameCount/20,ai*2-1)<0.5) {
      ay = -0.1;
    } else {
      ay = 0.1;
    }
    acc.x = ax;
    acc.y = ay;
    vel.add(acc);
    vel.mult(0.995);
    vel.x=constrain(vel.x,-5,5);
    vel.y=constrain(vel.y,-5,5);
    pos.add(vel);
    pos.x = constrain(pos.x,-PlayField[0]/2+r,PlayField[0]/2-r);
    pos.y = constrain(pos.y,-PlayField[1]/2+r,PlayField[1]/2-r);
    if(pos.x == -r+PlayField[0]/2 || pos.x == r-PlayField[0]/2){
      vel.x *= -1;
    }
    if(pos.y == -r+PlayField[1]/2 || pos.y == r-PlayField[1]/2){
      vel.y *= -1;
    }
    
  }
}
