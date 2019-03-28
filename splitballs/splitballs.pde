ArrayList<ball> balls = new ArrayList();
float[][] food;
PImage background;
void setup() {
  fullScreen();
  background = createImage(width,height,RGB);
  food = new float[width][height];
  for (int i=0; i <10; i++) {
    balls.add(new ball(random(0,width),random(0,height),random(10,30)));
  }
  loadPixels();
  for (float i = 0; i<width; i++) {
    for (float j = 0; j<height; j++) {
      float value = noise(i/100,j/100);
      food[int(i)][int(j)] =noise(i/100,j/100);
      if (value>0.5) {
        background.pixels[int(i)+int(j)*width] = color(255);
      }
      else {
        background.pixels[int(i)+int(j)*width] = color(0);
      }
    }
  }
  updatePixels();
}

void draw() {
  background(0);
  image(background,0,0);
  fill(255);
  for (int i =balls.size()-1; i>=0 ; i--) {
    ball b= balls.get(i);
    b.show();
    b.update();
    if (b.del) {balls.remove(i);}
  }
}
