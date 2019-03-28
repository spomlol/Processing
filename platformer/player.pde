class player {
  PVector pos = new PVector(20,100);
  PVector vel = new PVector(0,0);
  PVector dim = new PVector(20,20);
  int xdir = 0;
  int ydir = 0;
  void show(){
    fill(0,200,200);
    rect(pos.x,pos.y,dim.x,dim.y);
  }
  void update() {
    vel.y += 1;
    vel.y += ydir;
    pos.y += vel.y;
    for (int i=0; i < vel.y; i++) {
      color c  = pixels[int((pos.y+dim.y+1)*1000+pos.x)];
      if ( c != -1) {
        vel.y = 0;
      } else {
        pos.y +=1;
      }
    }
    
  }
}
