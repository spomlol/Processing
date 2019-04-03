class player {
  float x = width/2;
  float w = 10;
  float y = height-w;
  PVector[] DNA;
  float score;
  boolean finished = false;
  
  player(PVector[] DNA) {
    this.DNA=DNA;
  }
  
  void show() {
    ellipse(x, y, w, -w);
  }
  
  void update() {
    if (finished==false){      
    x = x+DNA[time].x;
    y = y+DNA[time].y;
    score = 1/( dist(x,y,goalX,goalY)+1);
    //score = 1/( dist(width/2,y,goalX,goalY)+1);
      if(dist(x,y,goalX,goalY)<5){
        finished=true;
        score=float(maxTime)/float(time) + (float(maxTime)/float(time)-1)*10;
        
      } else{
        for (obstacle o: Obstacles){
          if ((x>o.x && x < (o.x+o.w) && y > o.y && y < (o.y+o.h))) {
            finished = true;
            score = 0.01*(1/( dist(x,y,goalX,goalY)+1));
            break;
          }
        }
      }
    }
  }
}
