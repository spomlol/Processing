class car {
  color c;
  int x, y, dir;
  PVector pos = new PVector();
  int count=0;
  float add;
  car() {
    c = color(random(0, 255), random(0, 255), random(0, 255));
    while (objects[x][y] != 4) {
      x = int(random(0, size));
      y = int(random(0, size));
    }
    pos.x = x*20;
    pos.y = y*20;
    if (objects[x+1][y] == 4) {
      //RIGHT
      dir = 1;
    } else if (objects[x][y+1] == 4) {
      //DOWN
      dir = 2;
    } else if (objects[x-1][y] == 4) {
      //LEFT
      dir = 3;
    } else if (objects[x][y-1] == 4) {
      //UP
      dir = 4;
    } else {
      dir = 0;
    }
  }
  void show() {
    fill(c);
    stroke(0);
    if (dir == 1) {
      rect(pos.x+5+add, pos.y+13, 10, 5);
      fill(BLUE);
      rect(pos.x+12+add, pos.y+14, 3, 3);
    } else if (dir == 2) {
      rect(pos.x+13, pos.y+5+add, 5, 10);
      fill(BLUE);
      rect(pos.x+14, pos.y+12+add, 3, 3);
    } else if (dir == 3) {
      rect(pos.x+5-add, pos.y+3, 10, 5);
      fill(BLUE);
      rect(pos.x+5-add, pos.y+4, 3, 3);
    } else if (dir == 4) {
      rect(pos.x+3, pos.y+5-add, 5, 10);
      fill(BLUE);
      rect(pos.x+4, pos.y+5-add, 3, 3);
    }
  }

  void update() {
    if (count!=20) {
      add = lerp(1, 19, count/20.0);
      count++;
    } else {
      boolean pass = false;
      count = 0;
      add=0;
      if (dir == 1) {
        x += 1;
        pos.x+=20;
        if (objects[x+1][y] == 4 && random(0,1)>0.95) {
            pass = true;
          }
      } else if (dir == 2) {
        y+=1;
        pos.y+=20;
        if (objects[x][y+1] == 4 && random(0,1)>0.95) {
            pass = true;
          }
      } else if (dir == 3) {
        x -= 1;
        pos.x-=20;
        if (objects[x-1][y] == 4 && random(0,1)>0.95) {
            pass = true;
          }
      } else if (dir == 4) {
        y-=1;
        pos.y-=20;
        if (objects[x][y-1] == 4 && random(0,1)>0.95) {
            pass = true;
          }
      }
      while (!pass) {
        dir = int(random(1, 5));
        if (dir == 1) {
          if (objects[x+1][y] == 4) {
            pass = true;
          }
        } else if (dir == 2) {
          if (objects[x][y+1] == 4) {
            pass = true;
          }
        } else if (dir == 3) {
          if (objects[x-1][y] == 4) {
            pass = true;
          }
        } else if (dir == 4) {
          if (objects[x][y-1] == 4) {
            pass = true;
          }
        }
      }
    }
  }
}
