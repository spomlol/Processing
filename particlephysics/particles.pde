class particle{
  PVector pos = new PVector();
  PVector vel = new PVector();
  String sort;
  particle(String Sort) {
    pos.x = random(0,width);
    pos.y = random(0,height);
    sort = Sort;
  }
  void show() {
    if (sort == "H") {
      fill(0,0,200);
    } else {
      fill(200,0,0);
    }
    
    ellipse(pos.x,pos.y,50,50);
  }
  
  void update() {
    float f = 2;
    float f2 = -1.5;
    float f3 = 40;
    for (particle p: particles) {
      if (p != this) {
        vel = new PVector();
        float d = dist(pos.x,pos.y,p.pos.x,p.pos.y);
        float angle = atan2(p.pos.y-pos.y,p.pos.x-pos.x);
        if (d>400 && sort == p.sort) {
          vel.x += cos(angle)*35/d ;
          vel.y += sin(angle)*35/d;
        } else if ((d>0.05 && sort != p.sort)) {
          vel.x -= cos(angle)*30/d ;
          vel.y -= sin(angle)*30/d ;
        } else if (d>0.03) {
          vel.x -= cos(angle)*30/d ;
          vel.y -= sin(angle)*30/d ;
        }
        if (sort== "F") {
          vel.x += f/pos.x - f/(width-pos.x);
          vel.y += f/pos.y - f/(height-pos.y);
        }
        else {
          if(pos.x>400 || width-pos.x >400) {
            vel.x += f2/pos.x - f2/(width-pos.x);
            vel.y += f2/pos.y - f2/(height-pos.y);
          }
          else {
            vel.x += f3/pos.x - f3/(width-pos.x);
            vel.y += f3/pos.y - f3/(height-pos.y);
          }
        }
        pos = pos.add(vel);
        pos.x = constrain(pos.x,0,width);
        pos.y = constrain(pos.y,0,height);
      }
    }
  }
}
