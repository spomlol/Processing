class points {
  ArrayList<PVector> punt = new ArrayList();
  points(float t) {
    punt.add(new PVector(t, t));
  }

  void show() {
    noFill();
    //int alpha = 100;
    for (PVector p : punt) {
      //stroke(255,alpha);
      stroke(random(0,255),255,255);
      if(p.x != p.x) {p.x=0;}
      if(p.y != p.y) {p.y=0;}
      //print(maxx,minx,maxy,miny);
      float x =map(constrain(p.x,-width/2,width/2),minx,maxx,-width/2,width/2);
      float y =map(constrain(p.y,-height/2,height/2),miny,maxy,-height/2,height/2);
      point(x,y);
      //alpha-=1;
    }
  }
  void update() {
    if (punt.size() >= 10) {
      punt.remove(0);
    }
    punt.add(xfunc(punt.get(punt.size()-1)));
  }
}

PVector xfunc(PVector p) {
  //float x = -(p.x*p.x)+p.x*t+p.y;
  //float y = p.x*p.x-p.y*p.y-t*t-p.x*p.y+p.y*t-p.x+p.y;
  float x=0;
  float y=0;
  x += (bools1[0]==true) ? p.x*p.x : 0;
  y += (bools2[0]==true) ? p.x*p.x : 0;
  x += (bools1[1]==true) ? p.y*p.y : 0;
  y += (bools2[1]==true) ? p.y*p.y : 0;
  x += (bools1[2]==true) ? p.x*p.y : 0;
  y += (bools2[2]==true) ? p.x*p.y : 0;
  x += (bools1[3]==true) ? p.x*p.x*t : 0;
  y += (bools2[3]==true) ? p.x*p.x*t : 0;
  x += (bools1[4]==true) ? p.y*p.y*t : 0;
  y += (bools2[4]==true) ? p.y*p.y*t : 0;
  x += (bools1[5]==true) ? p.x*p.y*t : 0;
  y += (bools2[5]==true) ? p.x*p.y*t : 0;
  x -= (bools1[6]==true) ? p.x*p.x : 0;
  y -= (bools2[6]==true) ? p.x*p.x : 0;
  x -= (bools1[7]==true) ? p.y*p.y : 0;
  y -= (bools2[7]==true) ? p.y*p.y : 0;
  x -= (bools1[8]==true) ? p.x*p.y : 0;
  y -= (bools2[8]==true) ? p.x*p.y : 0;
  x -= (bools1[9]==true) ? p.x*p.x*t : 0;
  y -= (bools2[9]==true) ? p.x*p.x*t : 0;
  x -= (bools1[10]==true) ? p.y*p.y*t : 0;
  y -= (bools2[10]==true) ? p.y*p.y*t : 0;
  x -= (bools1[11]==true) ? p.x*p.y*t : 0;
  y -= (bools2[11]==true) ? p.x*p.y*t : 0;
  x += (bools1[12]==true) ? p.x : 0;
  y += (bools2[12]==true) ? p.x : 0;
  x += (bools1[13]==true) ? p.y : 0;
  y += (bools2[13]==true) ? p.y : 0;
  x += (bools1[14]==true) ? t : 0;
  y += (bools2[14]==true) ? t : 0;
  x += (bools1[15]==true) ? p.x*t : 0;
  y += (bools2[15]==true) ? p.x*t : 0;
  x += (bools1[16]==true) ? p.y*t : 0;
  y += (bools2[16]==true) ? p.y*t : 0;
  x += (bools1[17]==true) ? t*t : 0;
  y += (bools2[17]==true) ? t*t : 0;
  x -= (bools1[18]==true) ? p.x : 0;
  y -= (bools2[18]==true) ? p.x : 0;
  x -= (bools1[19]==true) ? p.y : 0;
  y -= (bools2[19]==true) ? p.y : 0;
  x -= (bools1[20]==true) ? t : 0;
  y -= (bools2[20]==true) ? t : 0;
  x -= (bools1[21]==true) ? p.x*t : 0;
  y -= (bools2[21]==true) ? p.x*t : 0;
  x -= (bools1[22]==true) ? p.y*t : 0;
  y -= (bools2[22]==true) ? p.y*t : 0;
  x -= (bools1[23]==true) ? t*t : 0;
  y -= (bools2[23]==true) ? t*t : 0;
  maxx = (x>maxx && x<100)?x:maxx;
  maxx=constrain(maxx,-1,1);
  minx = (x<minx && x>-100)?x:minx;
  minx=constrain(minx,-1,1);
  maxy = (y>maxy && y<100)?y:maxy;
  maxy=constrain(maxy,-1,1);
  miny = (y<miny && y>-100)?y:miny;
  miny=constrain(miny,-1,1);
  return new PVector(x, y);
}
