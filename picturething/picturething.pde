PImage im;
ArrayList<particle> particles = new ArrayList();
float angle = 0;
boolean gone = false;
boolean reverse = false;
int t =0;
void setup() {
  
  im = loadImage("C:/Users/cedri/Pictures/br2.png");
  size(209,439);
  //fullScreen();
  //for (int i=0; i< width; i+=2) {
  //  for (int j=0; j< height; j+=2) {
  //    particles.add(new particle(i,j));
  //  }
  //}
  float j = 0;
  for (int i = 0; i < 20; i++) {
    particles.add(new particle(i,j));
  }
  noStroke();
}

void draw() {
  //image(im,0,0);
  gone = true;
  //background(255);
  for (particle p: particles) {
    p.show(angle);
  }
  if (gone == true) {
    reverse = true;
  }
  angle += PI/100;
  //println(angle);
}
