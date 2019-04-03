float[][] map = new float[100][100];
float t=0;
import peasy.*;
PeasyCam cam;
OpenSimplexNoise noise;
float fac = 50;
void setup() {
  fullScreen(P3D);
  //colorMode(HSB);
  noise = new OpenSimplexNoise();
  cam = new PeasyCam(this,50,50,0, 200);
  for(int i =0; i<100; i++) {
    for(int j =0; j<100; j++) {
      float n = (float) noise.eval(i/fac,j/fac);
      map[i][j] = map(n,-1,1,0,100);
    }
  }
}

void draw() {
  background(0);
  for(int i =0; i<99; i++) {
    for(int j =0; j<99; j++) {
      //stroke(255);
      noStroke();
      beginShape();
      //point(i,j,map[i][j]);
      fill(map(map[i][j],0,100,0,255));
      vertex(i,j,map[i][j]);
      vertex(i+1,j,map[i+1][j]);
      vertex(i+1,j+1,map[i+1][j+1]);
      vertex(i,j+1,map[i][j+1]);
      endShape(CLOSE);
      float n = (float) noise.eval(i/fac,j/fac,t);
      map[i][j] = map(n,-1,1,0,100);
    }
  }
  for(int i =99; i<100; i++) {
    for(int j =0; j<100; j++) {
      float n = (float) noise.eval(i/fac,j/fac,t);
      map[i][j] = map(n,-1,1,0,100);
    }
  }
  for(int i =0; i<100; i++) {
    for(int j =99; j<100; j++) {
      float n = (float) noise.eval(i/fac,j/fac,t);
      map[i][j] = map(n,-1,1,0,100);
    }
  }
  t+=0.01;
}
