class player {
  PVector pos = PVector.random2D();
  PVector vel = new PVector();
  PVector acc = new PVector();
  float A = 2000;
  float r = sqrt(A/PI);
  color col;
  int ai;
  String name;
  float maxSpeed;
  player(int ai, int n) {
    //XML xml = loadXML("https://www.behindthename.com/api/random.xml?usage=ita&key=sp498647499");
    //XML[] names = xml.getChildren("names");
    try {
    //name = names[0].getContent();
    } catch (Exception e){}
    boolean intersect = true;
    if (ai != -1) {
    while (intersect == true) {
      intersect = false;
      pos.x = pos.x*random(-PlayField[0]/2+r,PlayField[0]/2-r);
      pos.y = pos.y*random(-PlayField[1]/2+r,PlayField[1]/2-r);
      for (player pl: players) {
        if (pl.pos.dist(pos) < pl.r) {
          intersect = true;
        }
      }
      if (p.pos.dist(pos) < p.r) {
          intersect = true;
        }
    }
    } else {
      pos.x = pos.x*random(-PlayField[0]/2+r,PlayField[0]/2-r);
      pos.y = pos.y*random(-PlayField[1]/2+r,PlayField[1]/2-r);
    }
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
    
    
    if (name != null) {
      fill(0);
    textAlign(CENTER,CENTER);
    textSize(r/2);
    text(name,pos.x,pos.y);
    }
    }
  }
  void update() {
    vel.add(acc);
    vel.mult(0.995);
    maxSpeed = map(r,25,500,10,0.4);
    vel.x=constrain(vel.x,-maxSpeed,maxSpeed);
    vel.y=constrain(vel.y,-maxSpeed,maxSpeed);
    pos.add(vel);
    pos.x = constrain(pos.x,-PlayField[0]/2,PlayField[0]/2);
    pos.y = constrain(pos.y,-PlayField[1]/2,PlayField[1]/2);
    if(pos.x == PlayField[0]/2 || pos.x == -PlayField[0]/2){
      vel.x *= -1;
    }
    if(pos.y == PlayField[1]/2 || pos.y == -PlayField[1]/2){
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
    maxSpeed = map(r,25,500,10,0.4);
    vel.x=constrain(vel.x,-maxSpeed,maxSpeed);
    vel.y=constrain(vel.y,-maxSpeed,maxSpeed);
    pos.add(vel);
    pos.x = constrain(pos.x,-PlayField[0]/2,PlayField[0]/2);
    pos.y = constrain(pos.y,-PlayField[1]/2,PlayField[1]/2);
    if(pos.x == -PlayField[0]/2 || pos.x == PlayField[0]/2){
      vel.x *= -1;
    }
    if(pos.y == -PlayField[1]/2 || pos.y == PlayField[1]/2){
      vel.y *= -1;
    }
    
  }
}
