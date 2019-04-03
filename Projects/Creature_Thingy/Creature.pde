float r = 0.2;
float a = 9.81/600;
class Creature {
  int n;
  ArrayList<node> nodes = new ArrayList<node>();
  Creature() {
    nodes.add(new node(0,0));
    nodes.add(new node(1,0));
    nodes.add(new node(1*cos(PI/4),-1*sin(PI/4)));
  }
  void show() {
    node no1;
    node no2;
    node no3;
    strokeWeight(0.2);
    stroke(0);
    for (int n =0; n<nodes.size()-1; n++) {
      no1 = nodes.get(n);
      no2 = nodes.get(n+1);
      line(no1.x,no1.y,no2.x,no2.y);
      if (n==0) {
        no3 = nodes.get(nodes.size()-1);
        line(no1.x,no1.y,no3.x,no3.y);
      }
    }
    
    noStroke();
    for (int n =0; n<nodes.size(); n++) {
      no1 = nodes.get(n);
      no1.show();
    }
  }
  
  void update() {
    int ground = 0;
    for (node n: nodes) {
      if (n.y==0) {
        ground++;
      }
    }
      if (ground<=0) {
        for (node n: nodes) {
          n.show();
        }
      }
  }
}

class node {
  
  float x;
  float y;
  float vx;
  float vy;
  //muscle m1;
  //muscle m2;
  void show() {
    fill(200,0,0);
    ellipse(x,y,2*r,2*r);
  }
  
  node(float x,float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    x+=vx;
    y+=vy;
    
    vy += a;
    if(y> 0) {
      y = 0;
      vy = 0;
    }
  }
}

class muscle {

}
