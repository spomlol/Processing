class projectile {
  PVector pos = new PVector();
  PVector inipos;
  PVector dir;
  float r = 20;
  float speed;
  projectile(float speed) {
    if (random(0,1)<0.5) {
      pos.x = round(random(0,1))*width;
      pos.y = random(0,height);
    }
    else {
      pos.x = random(0,width);
      pos.y = round(random(0,1))*height;
    }
    inipos = pos.copy();
    PVector temp = pos.copy();
    temp.x -= mouseX;
    temp.y -= mouseY;
    dir = temp.normalize().mult(speed);
  }
  
  void show() {
    stroke(200,0,0);
    line(inipos.x,inipos.y,pos.x,pos.y);
    stroke(0);
    ellipse(pos.x,pos.y,r*2,r*2);
  }
  void update() {
    pos.add(dir);
  }
  void eval() {
    if (dist(pos.x,pos.y,mouseX,mouseY)<r) {
      fill(0);
      rectMode(CENTER);
      rect(width/2,height/2,300,150);
      fill(255);
      noLoop();
      textAlign(CENTER, CENTER);
      textSize(30);
      text("GAME OVER\n SCORE: "+frameCount/frameRate+"\nCLICK TO RESTART",width/2,height/2);
      loop = false;
    }
  }
}
