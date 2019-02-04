int[][] grid;
PImage canvas;
int antX;
int antY;
int dir = 0;

void setup() {
  //size(400, 400);
  fullScreen();
  antX = round(width/2);
  antY = round(height/2);
  grid = new int[width][height];
  canvas = createImage(width, height, RGB);
  image(canvas, 0, 0);
}

void draw() {
  for (int i=0; i<1000; i++) {
    update();
  }
  image(canvas, 0, 0);
}

void update() {
  int state = grid[antX][antY];
  if (state == 0) {
    grid[antX][antY]=color(random(0,255),random(0,255),random(0,255));
    dir = dir+1;
    if (dir >3) {
     dir = 0; 
    }
  }
  else {
    grid[antX][antY]=0;
    dir = dir-1;
    if (dir <0) {
     dir = 3; 
    }
  }
  moveForward();
  if (antX > width-1) {antX = 0;}
  else if (antX <0) {antX = width-1;}
  else if (antY > height-1) {antY=0;}
  else if (antY < 0) {antY=height-1;}
  canvas.loadPixels();
  canvas.pixels[antX+antY*width]=color(grid[antX][antY]);  
  canvas.updatePixels();
}

void moveForward() {
  switch (dir) {
     case 0:
       antX -=1;
       break;
     case 1:
       antY-=1;
       break;
     case 2:
       antX +=1;
     break;
     case 3:
       antY +=1;
     break;
  }
}
