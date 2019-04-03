//Variable parameters
int skip=0;
int NoPlayers = 100;
int maxTime = 2000;
float goalX;
float goalY;


//Fixed parameter initialisation
float maxScore;
ArrayList<player> players  = new ArrayList<player>();
ArrayList<obstacle> Obstacles  = new ArrayList<obstacle>();
ArrayList<Float> maxScores = new ArrayList<Float>();
int generation=1;
int time=0;

void setup() {
  fullScreen();
  goalX = width*0.5;
  goalY = height*0.1;
  maxScores.add(0.0);
  //Obstacles.add(new obstacle(random(0,width),random(0,height),random(10,500),random(10,500)));
  //Obstacles.add(new obstacle(width/2-200,500,180,20));
  //Obstacles.add(new obstacle(width/2+20,500,180,20));
  PVector[] v = new PVector[maxTime];
  for (int j = 0; j<NoPlayers; j++) {
    for (int i=0; i<maxTime; i++){
       v[i] = PVector.random2D();
       v[i].mult(5);
    }
    players.add(new player(v));
    v = new PVector[maxTime];
  }
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  rect(0.7*width,0.01*height,0.29*width,0.09*height);
  stroke(255,255,0);
  float maxScoreEver=0;
  for (float s: maxScores){
    if (s>maxScoreEver) {maxScoreEver=s;}
  }
  
  for (int i = 0; i<maxScores.size()-1; i++){
    float x1 = map(i,0,maxScores.size()-1,0.7*width,0.99*width);
    float y1 = map(maxScores.get(i),0,maxScoreEver,0.10*height,0.01*height);
    float x2 = map(i+1,0,maxScores.size()-1,0.7*width,0.99*width);
    float y2 = map(maxScores.get(i+1),0,maxScoreEver,0.10*height,0.01*height);
    //println(x1,y1,x2,y2);
    line(x1,y1,x2,y2);
  }
  stroke(0);
  fill(255,0,0);
  ellipse(goalX,goalY,10,10);
  fill(255);
  int mainTime = time;
  for (obstacle o: Obstacles) {
    o.show();
  }
  
  
  for (player p: players) {
    p.show();
    time = mainTime;
    for (int i=0; i<skip+1; i++){
      p.update();
      time++;
      if (time >= maxTime) {break;}
    }
  }
  time = mainTime;
  time+=skip+1;
  if (time >= maxTime) {
    crossbreed();
  }
  scale(2);
  text("Max score previous gen: "+maxScore*100,10,10);
  text("Max score ever: "+maxScoreEver*100,10,30);
  text("Generation: "+generation,10,50);
  text("Speed: "+(skip+1) + "X",10,70);
  text("Maximum Time: "+maxTime,10,90);
}

void keyPressed(){
  if (keyCode==UP) {
    skip++;
  }
  else if (keyCode == DOWN){
    skip--;
    if (skip<-1) {skip=-1;}
  } else if (keyCode==RIGHT) {
    skip+=100;
  }else if (keyCode == LEFT){
    skip-=100;
    if (skip<-1) {skip=-1;}}
  //else if (key == '8'){
  //  maxTime+=10;
  //}
}
