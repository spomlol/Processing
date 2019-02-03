float time = 0;
float[] X = new float [1000];
float[] Y = new float [1000];
int i;
void setup() {
  size(1000,1000);
  for (i=0; i<1000;i++){
    X[i] = 500+i*0.5;
  }
}

void draw() {
  background(0);
  noFill();
  stroke(255);
  ellipse(200,500,200,200);
  fill(255);
  float x = 200+100*sin(time);
  float y = 500 +100*cos(time);
  ellipse(x,y,20,20);
  line(x,y,500,y);
  for (i=998; i>=0; i--){
    Y[i+1] = Y[i];
  }
  Y[0] = y;
  
  for (i=0; i<1000;i++) {
    ellipse(X[i],Y[i],5,5);
  }
  time += 0.05;
}
