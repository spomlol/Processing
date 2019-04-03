import peasy.*;
PeasyCam cam;
float camposx,camposy,camposz;
float campossx,campossy,campossz;
float camrotx, camroty, camrotz;
float camrotsx, camrotsy, camrotsz;
float maxangle= PI/4;
void setup() {
  fullScreen(P3D);
  cam = new PeasyCam(this,200);
}

void draw() {
  camUpdate();
  background(255);
  box(100,100,1);
}

void keyPressed() {
  if (keyCode == UP) {
    camrotsx=0.03;
  } else if (keyCode == RIGHT) {
    camrotsy=0.03;
  } else if (keyCode == DOWN) {
    camrotsx=-0.03;
  } else if (keyCode == LEFT) {
    camrotsy=-0.03;
  } else if (key == 'q') {
    campossx=-1;
  } else if (key == 's') {
    campossy=1;
  } else if (key == 'z') {
    campossy=-1;
  } else if (key == 'd') {
    campossx=1;
  }
}
void keyReleased() {
  if (keyCode == UP || keyCode == DOWN) {
    camrotsx=0;
  } else if (keyCode == RIGHT || keyCode == LEFT) {
    camrotsy=0;
  } 
  if (key == 'q' || key == 'd') {
    campossx=0;
  } else if (key == 's' || key == 'z') {
    campossy=0;
  }
}

void camUpdate() {
  rotateX(0);
  rotateY(0);
  rotateZ(0);
  cam = new PeasyCam(this,0, 0, 0, 200);
  camrotx+=camrotsx;
  camrotx= constrain(camrotx, -maxangle,maxangle);
  camroty+=camrotsy;
  camroty= constrain(camroty, -maxangle,maxangle);
  camrotz+=camrotsz;
  camrotz= constrain(camrotz, -maxangle,maxangle);
  println(camroty);
  camposx+=campossx;
  camposy+=campossy;
  camposz+=campossz;
  cam = new PeasyCam(this,camposx, camposy, camposz, 200);
  rotateX(camrotx);
  rotateY(camroty);
  rotateZ(camrotz);
}
