int h;
int s;
int b=255;
boolean click = false;
void setup() {
  size(1280,1280);
  colorMode(HSB);
}


void draw() {
  scale(5);
  if (!click) {
    for (int i=0; i<256;i++) {
      for (int j=0; j<256;j++) {
        noStroke();
        fill(i,j,b);
        rect(i,j,1,1);
      }
    }
    
  }
  else {
    background(h/5,s/5,b);
    text(h/5+" "+s/5+ " "+ b,10,20);
  }
  
}

void mouseClicked() {
  h = mouseX;
  s = mouseY;
  click=!click;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e<0) {b--;b=constrain(b,0,255);} else {b++;b=constrain(b,0,255);}
}
