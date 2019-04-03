void loadImages() {
  heart = loadImage("heart.png");
  diamond = loadImage("diamond.png");
  clover = loadImage("clover.png");
  spade = loadImage("spade.png");
  w=width/15;
  h= round(height/5);
  heart.resize(round(w*0.8),round(w*0.8));
  diamond.resize(round(w*0.8),round(w*0.8));
  clover.resize(round(w*0.8),round(w*0.8));
  spade.resize(round(w*0.8),round(w*0.8));
  sheart = heart.copy();
  sdiamond = diamond.copy();
  sclover=clover.copy();
  sspade = spade.copy();
  sheart.resize(15,15);
  sdiamond.resize(15,15);
  sclover.resize(15,15);
  sspade.resize(15,15);
}

void drawTable() {
  background(0,100,0);
  stroke(0,255,0);
  noFill();
  circle(width*0.1,height*0.1,w);
  rect(width*0.1,height*0.1,w,h);
  stroke(0,0,200);
  rect(width*0.9,height*0.1,w,h);
  rect(width*0.8,height*0.1,w,h);
  rect(width*0.7,height*0.1,w,h);
  rect(width*0.6,height*0.1,w,h);
  stroke(0);
  rect(width*0.2,height*0.35,w,h);
  rect(width*0.3,height*0.35,w,h);
  rect(width*0.4,height*0.35,w,h);
  rect(width*0.5,height*0.35,w,h);
  rect(width*0.6,height*0.35,w,h);
  rect(width*0.7,height*0.35,w,h);
  rect(width*0.8,height*0.35,w,h);
  fill(255);
}
