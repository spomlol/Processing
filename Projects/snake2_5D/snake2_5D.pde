//ArrayList<PVector> snake = new ArrayList();
ArrayList<snake> snakes = new ArrayList();
ArrayList<PVector> foods = new ArrayList();
PVector food;
//int dir;
int size;
boolean death;
//boolean click;
float speed;
float speedup;
boolean bottom=false;
boolean eaten = false;
boolean ai = true;
boolean menu = true;
boolean multi = false;
boolean threed = false;
int selection = 1;
int noFoods = 1;
int causedeath;
import peasy.*;
PeasyCam cam;

void setup() {
  fullScreen(P3D);
  
  size=40;
  //snake.clear();
  snakes.clear();
  foods.clear();
  //snake.add(new PVector(width/(2*size), height/(2*size)));
  if (multi==false) {
    snakes.add(new snake(true));
  } else {
    snakes.add(new snake(1, 1, 1, color(0, 200, 0), true,1));
    snakes.add(new snake(width/(size)-2, height/(size)-2, 2, color(0, 0, 200), true,2));
  }
  for (int i = 0; i < noFoods; i++) {
    foods.add(new PVector(round(random(1, width/size-1)), round(random(1, height/size-1))));
  }
  frameRate(120);
  death = false;
  //click = false;
  //dir = 1;
  speed = 16.0;
  speedup=0;
}

void draw() {
  if (threed) {
    cam = new PeasyCam(this, width/2, height/2, 0, width/2+100);
  } else {
    cam = new PeasyCam(this, width/2, height/2,0,1000);
  }
  background(0);
  if (threed) {
  translate(500, -300, -1200);
  rotateX(PI/3);
  rotateZ(PI/4);
  }
  drawfood();
  for (snake s : snakes) {
    s.drawsnake();
  }
  if (frameCount%speed == 0 && death == false) {
    for (int i = 0; i< snakes.size(); i++) {
      snake s = snakes.get(i);
      s.update();
      s.click = false;
      s.checkdeath();
      if (s.ai) {
        s.aiSnake();
      }
    }
  }
  if (death) {
    deathhud();
  }
  if (death && snakes.get(0).ai) {
    if (multi==false) {
      reset(true,true);
    } else if (snakes.get(1).ai) {
      reset(true,true);
    }
  } 
  if (menu) {
    menuHud();
  }
}
