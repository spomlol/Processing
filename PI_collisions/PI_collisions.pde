double pos1,pos2;
double vel1,vel2;
float m1 = 1.0;
float m2 = 10000000000.0;
double pvel1;
double pvel2;
int hits = 0;
void setup() {
  size(1000,1000);
  textSize(50);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  pos1 = 100;
  pos2 = 500;
  vel1 = 0;
  vel2 = -0.000001;
}

void draw() {
  
  background(0);
  stroke(255);
  line(0,550,width,550);
  rect((float) pos1,500,100,100);
  rect((float) pos2,450,200,200);
  for (int i = 0; i <1000000; i++) {
    if(pos2-pos1 <150) {
      pvel1 = vel1;
      pvel2 = vel2;
      vel1 = (m1-m2)/(m1+m2)*pvel1 + (2*m2)/(m1+m2)*pvel2;
      vel2 = (2*1)/(m1+m2)*pvel1 + (m2-m1)/(m1+m2)*pvel2;
      hits += 1;
    }
    if (pos1 <=50) {
      vel1 *= -1;
      pos1 = 50;
      hits +=1;
    }
    pos1+=vel1;
    pos2+=vel2;
  }
  text(hits,500,800);
}
