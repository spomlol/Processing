float count =0;
void setup() {
  size(1000,1000);
}
void draw() {
  background(0);
  translate(width/2,height/2);
  noFill();
  for (int j=0; j<10 ; j+=1) {
    beginShape();
    for (float i=0; i<TWO_PI; i+=(TWO_PI/1000)) {
      float x = 16*pow(sin(i),3);
      float y = 13 * cos(i) - 5 * cos(2*i) - 2 * cos(3*i) - cos(4* i);
      stroke(255);
      vertex(x*10+noise(x/10+count,y/10+count,j)*100,-y*10+noise(x/10+count,y/10+count,j+1)*100);
    }
    endShape();
  }
  count+=0.01;
}
