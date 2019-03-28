//Creature c;
ArrayList<Creature> Creatures = new ArrayList<Creature>();
int noCreatures = 10;
void setup(){
  fullScreen();
  //c = new Creature();
  for (int i = 0; i< noCreatures; i++) {
    Creatures.add(new Creature());
  }
}

void draw(){
  drawmap();
  for (Creature c : Creatures) {
    c.show();
    c.update();
  }
  println(frameRate);
}















void drawmap() {
  translate(width/2,height/2);
  scale(200);
  background(0,150,200);
  strokeWeight(0.5);
  for (int i = -100; i<100; i++) {
    stroke(255);
    line(10*i, -height, 10*i, height);
  }
  stroke(0);
  noStroke();
  fill(0,140,0);
  rect(-1000*width,r,2000*width,height);
}
