PImage map;
player p;
void setup() {
  map = loadImage("map.png");
  size(1000,1000);
  p = new player();
}

void draw() {
  image(map,0,0);
  p.show();
  loadPixels();
  p.update();
}

void keyPressed() {
  if (keyCode == UP) {
    p.ydir = -10;
  }
}
void keyReleased() {
  if (keyCode == UP) {
    p.ydir = 0;
  }
}
