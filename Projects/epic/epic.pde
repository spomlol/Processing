ArrayList<points> point;
float t;
float tinc = 0.0001;
boolean[] bools1;
boolean[] bools2;
int seed;
float maxx=0.001,minx=-0.001,maxy=0.001,miny=-0.001;
void setup() {
  t=0;
  maxx=0.001;
  minx=-0.001;
  maxy=0.001;
  miny=-0.001;
  frameCount=0;
  bools1 = new boolean[24];
  bools2 = new boolean[24];
  point = new ArrayList();
  fullScreen();
  background(0);
  seed = int(random(0,10000));
  randomSeed(seed);
  //randomSeed(649);
  //randomSeed(501);
  //randomSeed(518);
  //randomSeed(298);
  //randomSeed(300);
  //randomSeed(8803);
  //randomSeed(6802);
  //randomSeed(9360);
  //randomSeed(2024);
  //randomSeed(30);
  randomSeed(9499);
  for(int i = 0; i<24;i++) {
    bools1[i] = (random(0,1)>0.5) ? true  : false;
    bools2[i] = (random(0,1)>0.5) ? true  : false;
  }
  colorMode(HSB);
}

void draw() {
  //background(0);
  stroke(255);
  fill(255);
  translate(width/2,height/2);
  for (int i=point.size()-1; i>=0 ; i--) {
    points p = point.get(i);
    p.show();
    p.update();
    if (point.size() > 1000) {
      point.remove(i);
    }
  }
  t=tinc*frameCount;
  point.add(new points(t));
  text("Seed:"+seed,-width/2+20,-height/2+20);
  text("Time:"+t,width/2-80,-height/2+20);
}

void keyPressed() {
  setup();
}
void mousePressed() {
  setup();
}
