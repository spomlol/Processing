ArrayList<creature> creatures = new ArrayList();
ArrayList<Float> bestXs = new ArrayList<Float>();
ArrayList<Float> worstXs = new ArrayList<Float>();
int time = 900;
int noCreatures = 200;
float bestX=-1000;
float worstX=1000;
int generation=1;
int skip =0;
float bestXever=0;
float worstXever=0;
boolean help = false;
float mutation=0.02;
boolean showbest = false;
creature bestcreature;
int timer;
int chromosomes = 5;
void setup() {
  fullScreen();
  for (int i=0; i<noCreatures; i++) {
    creatures.add(new creature(i));
  }
  //frameRate(1);
  bestcreature = creatures.get(0);
}

void draw() {
  if (timer >= time) {
    crossbreed();
  }
  
  drawgeneral();
  for (int i=0; i<skip+1; i++){
    for (int j=creatures.size()-1; j >=0; j--) {
      creature c = creatures.get(j);
      c.update();
      if (c.kill) {
        creatures.remove(j);
      }
    }
    timer++;
    if (timer >= time) {break;}
  }
  if (showbest) {
    bestcreature.show();
  }
  else {
    for (creature c: creatures) {
      c.show();
    }
  }
}

//void mousePressed() {
//  for (node n: nodes) {
//    if (dist(n.pos.x,n.pos.y,mouseX-width/2,-mouseY+height/2+200)<n.r) {
//      n.selected = true;
//    }
//  }
//}

//void mouseReleased() {
//  for (node n: nodes) {
//        n.selected = false;
//        n.vel.set(mouseX-pmouseX,pmouseY-mouseY).mult(3);
//  }
//}

void drawhud() {
  pushMatrix();
  
  textSize(20);
  
  
  noFill();
  stroke(255);
  rect(0.7*width,0.01*height,0.29*width,0.09*height);
  stroke(0);
    float x1 = map(0,0,bestXs.size()-1,0.7*width,0.99*width);
    float y1 = map(0,worstXever,bestXever,0.10*height,0.01*height);
    float x2 = map(bestXs.size()-1,0,bestXs.size()-1,0.7*width,0.99*width);
    float y2 = map(0,worstXever,bestXever,0.10*height,0.01*height);
    line(x1,y1,x2,y2);
  stroke(255,255,0);
  for (int i = 0; i<bestXs.size()-1; i++){
    x1 = map(i,0,bestXs.size()-1,0.7*width,0.99*width);
    y1 = map(bestXs.get(i),worstXever,bestXever,0.10*height,0.01*height);
    x2 = map(i+1,0,bestXs.size()-1,0.7*width,0.99*width);
    y2 = map(bestXs.get(i+1),worstXever,bestXever,0.10*height,0.01*height);
    //println(x1,y1,x2,y2);
    line(x1,y1,x2,y2);
    if (bestXs.get(i)== bestXever) {
      stroke(0);
      line(x1,0.10*height,x1,0.01*height);
      stroke(255,255,0);
    }
  }
  stroke(200,0,0);
  for (int i = 0; i<worstXs.size()-1; i++){
    x1 = map(i,0,worstXs.size()-1,0.7*width,0.99*width);
    y1 = map(worstXs.get(i),worstXever,bestXever,0.10*height,0.01*height);
    x2 = map(i+1,0,worstXs.size()-1,0.7*width,0.99*width);
    y2 = map(worstXs.get(i+1),worstXever,bestXever,0.10*height,0.01*height);
    //println(x1,y1,x2,y2);
    line(x1,y1,x2,y2);
  }
  stroke(0);
  fill(0);
  text("Time: " + round(timer/60.0*100.0)/100.0,20,20);
  text("Best so far:" + round(bestX)/10.0,20,40);
  text("Max score ever: "+round(bestXever)/10.0,20,60);
  text("Worst score ever: "+round(worstXever)/10.0,20,80);
  text("Generation: "+generation,20,100);
  text("Speed: "+(skip+1) + "X",20,120);
  text("Maximum Time: "+time/60,20,140);
  text("noCreatures: "+creatures.size(),20,160);
  text("Mutation rate: "+round(mutation*100)+"%",20,180);
  if (help) {
    stroke(255);
    noFill();
    rect(15,height-90,300,85);
    rect(315,height-90,300,85);
    stroke(0);
    fill(0);
    text("Hide help: press H",20, height-100);
    text("Speed +1: arrow key up",20, height-70);
    text("Speed -1: arrow key down",20, height-50);
    text("Speed +100: arrow key right",20, height-30);
    text("Speed -100: arrow key left",20, height-10);
    text("mutation +1%: 8",320, height-70);
    text("mutation +1%: 2",320, height-50);
    text("Show only best creature: 5",320, height-30);
    //text("mutation +1%: 8",320, height-10);
  }
  else {
    text("Help: press H",20, height-20);
  }
  
  popMatrix();
}

void keyPressed(){
  if (keyCode==UP) {
    skip++;
    if (skip>time-1) {skip=time-1;}
  } else if (keyCode == DOWN){
    skip--;
    if (skip<-1) {skip=-1;}
  } else if (keyCode==RIGHT) {
    skip+=100;
    if (skip>time-1) {skip=time-1;}
  }else if (keyCode == LEFT){
    skip-=100;
    if (skip<-1) {skip=-1;}
  }
  if (key == 'h' || key == 'H') {
    help = !help;
  }
  if (key == '8') {
    mutation+=0.01;
  }
  if (key == '2') {
    mutation-=0.01;
  }
  if (key == '5') {
    showbest = !showbest;
  }
}

void drawgeneral() {
  background(155);
  drawhud();
  translate(width/2-round(bestX),height/2+200);
  bestX=0;
  worstX=0;
  scale(1,-1);
  line(-10000,0,10000,0);
  stroke(125);
  textAlign(CENTER,CENTER);
  
  for(int i = -20; i<20; i++){
    line(i*100,0,i*100,500);
    scale(1,-1);
    text((i)*10,i*100,-500);
    scale(1,-1);
  }
  stroke(0,125);
  textAlign(LEFT);
}
