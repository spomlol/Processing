ArrayList<projectile> projectiles = new ArrayList();
int spawntime = 50;
int count = 0;
float speed = -5;
boolean loop = true;
void setup() {
  fullScreen();
  colorMode(HSB);
}

void draw() {
  
  if (frameCount%spawntime==0) {
    projectiles.add(new projectile(speed)); 
    count++;
    if(spawntime>1 && count==4){
      spawntime--;
      count=0;
    }
    speed -=0.1;
  }
  background(frameCount*5%255,255,255);
  textSize(30);
  text(frameCount/frameRate,50,50);
  for (int i = 0; i<projectiles.size(); i++) {
    projectile p=projectiles.get(i);
    p.show();
    p.update();
    p.eval();
    if (p.pos.x>width+p.r || p.pos.x<-p.r || p.pos.y>height+p.r || p.pos.y<-p.r) {
      projectiles.remove(i);
    }
  }
}

void mousePressed() {
  if( loop == false) {
    projectiles.clear();
    loop();
    frameCount=0;
    spawntime=50;
    speed = -5;
    count=0;
    loop=true;
  }
}
