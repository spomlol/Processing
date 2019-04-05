class car {
  color c;
  int x,y,dir;
  car() {
    c = color(random(0,255),random(0,255),random(0,255));
    x = int(random(0,size));
    y = int(random(0,size));
    while(objects[x][y] != 4){
      x = int(random(0,size));
      y = int(random(0,size));
    }
    if (objects[x+1][y] == 4) {
      dir = 1;
    } else if (objects[x][y+1] == 4) {
      dir = 2;
    } else if (objects[x-1][y] == 4) {
      dir = 3;
    } else if (objects[x][y-1] == 4) {
      dir = 4;
    } else {dir = 0;}
  }
  void show() {
     fill(c);
     stroke(0);
     if (dir == 1) {
       rect(x*20+5,y*20+13,10,5);
       fill(BLUE);
       rect(x*20+12,y*20+14,3,3);
     } else if (dir == 2) {
       rect(x*20+13,y*20+5,5,10);
       fill(BLUE);
       rect(x*20+14,y*20+12,3,3);
     } else if (dir == 3) {
       rect(x*20+5,y*20+3,10,5);
       fill(BLUE);
       rect(x*20+5,y*20+4,3,3);
     } else if (dir == 4) {
       rect(x*20+3,y*20+5,5,10);
       fill(BLUE);
       rect(x*20+4,y*20+5,3,3);
     }
     
  }
  
  void update() {
    
  }
}
