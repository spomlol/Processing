
class snake {
  ArrayList<PVector> segments = new ArrayList();
  int dir =1;
  boolean click = false;
  color c = color(255);
  boolean ai = true;
  int id;
  snake(boolean arti) {
    segments.add(new PVector(width/(2*size), height/(2*size)));
    ai = arti;
  }
  snake(int x, int y, int d, color col, boolean arti, int i) {
    segments.add(new PVector(x, y));
    dir = d;
    c = col;
    ai = arti;
    id = i;
  }
  snake(int x, int y, int d, color col, int i) {
    segments.add(new PVector(x, y));
    dir = d;
    c = col;
    id = i;
  }

  void drawsnake() {
    fill(c);
    stroke(0);


    for (PVector segment : segments) {
      pushMatrix();
      //rect(segment.x*size, segment.y*size, size, size);
      float posx =0;
      float posy =0;
      if (death==false) {
        if (segment.z == 1) {
          posx = lerp(segment.x*size + size/2, (segment.x+1)*size + size/2, ((frameCount-1)%speed)/speed);
          posy = lerp(segment.y*size + size/2, (segment.y)*size + size/2, ((frameCount-1)%speed)/speed);
        } else if (segment.z == 2) {
          posx = lerp(segment.x*size + size/2, (segment.x-1)*size + size/2, ((frameCount-1)%speed)/speed);
          posy = lerp(segment.y*size + size/2, (segment.y)*size + size/2, ((frameCount-1)%speed)/speed);
        } else if (segment.z == 3) {
          posx = lerp(segment.x*size + size/2, (segment.x)*size + size/2, ((frameCount-1)%speed)/speed);
          posy = lerp(segment.y*size + size/2, (segment.y+1)*size + size/2, ((frameCount-1)%speed)/speed);
        } else if (segment.z == 4) {
          posx = lerp(segment.x*size + size/2, (segment.x)*size + size/2, ((frameCount-1)%speed)/speed);
          posy = lerp(segment.y*size + size/2, (segment.y-1)*size + size/2, ((frameCount-1)%speed)/speed);
        }
      } else {
        posx = segment.x*size + size/2;
        posy = segment.y*size + size/2;
      }

      translate(posx, posy, size/2);
      box(size, size, size);
      popMatrix();
    }
    fill(200, 200, 0);

    speedup += 0.001;
    rect(0, height, width*speedup, 10);
    if (speedup >= 1) {
      speedup = 0;
      speed -=1;
      speed = constrain(speed, 1, 32);
    }
  }
  void update() {
    if (dir == 1) {
      segments.add(new PVector(segments.get(segments.size()-1).x+1, segments.get(segments.size()-1).y, 1));
    } else if (dir == 2) {
      segments.add(new PVector(segments.get(segments.size()-1).x-1, segments.get(segments.size()-1).y, 2));
    } else if (dir == 3) {
      segments.add(new PVector(segments.get(segments.size()-1).x, segments.get(segments.size()-1).y+1, 3));
    } else if (dir == 4) {
      segments.add(new PVector(segments.get(segments.size()-1).x, segments.get(segments.size()-1).y-1, 4));
    }
    for (PVector food : foods) {
      if (segments.get(segments.size()-1).x == food.x && segments.get(segments.size()-1).y == food.y) {
        eaten=true;
        food.x = round(random(1, width/size-1));
        food.y = round(random(1, height/size-1));
      }
    }
    if (eaten) {
      eaten = false;
    } else {
      segments.remove(0);
    }
  }


  void aiSnake() {
    float d = 100000;
    int j = 0;
    float lastsegx = segments.get(segments.size()-1).x;
    float lastsegy = segments.get(segments.size()-1).y;
    for (int i = 0; i< foods.size(); i++) {
      if (abs(foods.get(i).x - lastsegx) + abs(foods.get(i).y - lastsegy) < d) {
        j = i;
        d = abs(foods.get(i).x - lastsegx) + abs(foods.get(i).y - lastsegy);
      }
    }
    PVector f = foods.get(j);
    if (segments.get(segments.size()-1).x < f.x && click == false) {
      if (dir != 2) {
        dir = 1;
        segments.get(segments.size()-1).z = 1;
      } else {
        dir = 3;
        segments.get(segments.size()-1).z = 3;
      }
      click = true;
    } else if (segments.get(segments.size()-1).x > f.x && click == false) {
      if (dir != 1) {
        dir = 2;
        segments.get(segments.size()-1).z = 2;
      } else {
        dir = 4;
        segments.get(segments.size()-1).z = 4;
      } 
      click = true;
    } else if (segments.get(segments.size()-1).y < f.y && click == false) {
      if (dir != 4) {
        dir = 3;
        segments.get(segments.size()-1).z = 3;
      } else {
        dir = 1;
        segments.get(segments.size()-1).z = 1;
      } 
      click = true;
    } else if (segments.get(segments.size()-1).y > f.y && click == false) {
      if (dir != 3) {
        dir = 4;
        segments.get(segments.size()-1).z = 4;
      } else {
        dir = 2;
        segments.get(segments.size()-1).z = 2;
      }
      click = true;
    }
  }

  void checkdeath() {
    for (int i = 0; i< segments.size()-2; i++) {
      if (segments.get(i).x == segments.get(segments.size()-1).x && segments.get(i).y == segments.get(segments.size()-1).y) {
        death = true;
        causedeath = id;
      }
    }
    if (segments.get(segments.size()-1).x == -1 || segments.get(segments.size()-1).x == width/size || segments.get(segments.size()-1).y == -1 || segments.get(segments.size()-1).y == height/size) {
      death = true;
      causedeath = id;
    }
    for (snake s: snakes) {
      if (s != this) {
        for (int i = 0; i< s.segments.size(); i++) {
          if (s.segments.get(i).x == this.segments.get(this.segments.size()-1).x && s.segments.get(i).y == this.segments.get(this.segments.size()-1).y) {
            death = true;
            causedeath = id;
          }
        }
      }
    }
  }
}
