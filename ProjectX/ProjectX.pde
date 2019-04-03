color BLUE = color(135, 206, 250);
color GREEN= color(34, 139, 34);
color YELLOW = color(200,200,0);
color DARKBLUE = color(0, 0, 200);
color ORANGE = color(255, 150, 0);
color DARKGREEN = color(0, 200, 0);
int size = 200;
int map[][];
int objects[][];
int xoff, yoff=0;
float scale=1;
PGraphics mapimage;
int xspeed, yspeed=0;
int select =0;

void setup() {
  fullScreen(P2D);

  noStroke();
  map = new int[size][size];
  objects = new int[size][size];
  for (int i =0; i<size; i++) {
    for (int j =0; j<size; j++) {
      map[i][j]=round(noise(i/100.0, j/100.0));
      objects[i][j]=0;
    }
  }
  mapimage = createGraphics(size*20, size*20);
  mapimage.beginDraw();
  mapimage.noStroke();
  for (int i =0; i<size; i++) {
    for (int j =0; j<size; j++) {
      if (map[i][j]==0) {
        fill(BLUE);
        mapimage.fill(BLUE);
      } else if (map[i][j]==1) {
        fill(GREEN);
        mapimage.fill(GREEN);
      }
      mapimage.rect(i*20, j*20, 20, 20);
    }
  }
  mapimage.endDraw();
}

void draw() {
  pushMatrix();
  translate(xoff, yoff);
  scale(scale);
  background(BLUE);
  stroke(0);
  strokeWeight(4);
  rect(-2, -2, size*20+3, size*20+3);
  //shape(mapdrawing,0,0);
  image(mapimage, 0, 0);
  strokeWeight(1);
  for (int i =0; i<size; i++) {
    for (int j =0; j<size; j++) {
      if (objects[i][j]==1) {
        fill(DARKGREEN);
        rect(i*20,j*20,20,20);
      } else if (objects[i][j]==2) {
        fill(DARKBLUE);
        rect(i*20,j*20,20,20);
      } else if (objects[i][j]==3) {
        fill(ORANGE);
        rect(i*20,j*20,20,20);
      }
    }
  }
  checkmouse();

  popMatrix();
  drawSide();
  xoff+=xspeed;
  yoff+=yspeed;
  checkmouse2();
}

void checkmouse() {
  if (mouseX<0.01*width) {
    xoff+=5/scale;
  }
  if (mouseX>0.99*width) {
    xoff-=5/scale;
  }
  if (mouseY>0.99*height) {
    yoff-=5/scale;
  }
  if (mouseY<0.01*height) {
    yoff+=5/scale;
  }
  if ((mouseX-xoff)/ scale >0 && (mouseX-xoff)/ scale < size*20 && (mouseY-yoff)/ scale>0 && (mouseY-yoff)/ scale<size*20 && mouseX<width*0.8) {
    float x = floor((mouseX-xoff)/ (20*scale));
    float y = floor((mouseY-yoff)/ (20*scale));
    stroke(YELLOW);
    noFill();
    rect(x*20, y*20, 20, 20);
  }
}

void checkmouse2() {
  if (mouseX>width*0.83775 && mouseX<width*0.875 && mouseY>height*0.1 && mouseY<height*0.10+width*0.025) {
    noFill();
    stroke(YELLOW);
    rect(width*0.83775, height*0.1, width*0.025, width*0.025);
  } else if (mouseX>width*0.88775 && mouseX<width*0.925 && mouseY>height*0.1 && mouseY<height*0.10+width*0.025) {
    noFill();
    stroke(YELLOW);
    rect(width*0.88775, height*0.1, width*0.025, width*0.025);
  } else if (mouseX>width*0.93775 && mouseX<width*0.975 && mouseY>height*0.1 && mouseY<height*0.10+width*0.025) {
    noFill();
    stroke(YELLOW);
    rect(width*0.93775, height*0.1, width*0.025, width*0.025);
  }
}
void mousePressed() {
  if (mouseX>width*0.83775 && mouseX<width*0.875 && mouseY>height*0.1 && mouseY<height*0.10+width*0.025) {
    select =1;
  } else if (mouseX>width*0.88775 && mouseX<width*0.925 && mouseY>height*0.1 && mouseY<height*0.10+width*0.025) {
    select =2;
  } else if (mouseX>width*0.93775 && mouseX<width*0.975 && mouseY>height*0.1 && mouseY<height*0.10+width*0.025) {
    select =3;
  }
  if ((mouseX-xoff)/ scale >0 && (mouseX-xoff)/ scale < size*20 && (mouseY-yoff)/ scale>0 && (mouseY-yoff)/ scale<size*20 && mouseX<width*0.8) {
    int x = floor((mouseX-xoff)/ (20*scale));
    int y = floor((mouseY-yoff)/ (20*scale));
    objects[x][y] = select;
  }
}

void keyPressed() {
  if (key =='d') {
    xspeed=-5;
  }
  if (key =='q') {
    xspeed=5;
  }
  if (key =='z') {
    yspeed=5;
  }
  if (key =='s') {
    yspeed=-5;
  }
}

void keyReleased() {
  xspeed=0;
  yspeed=0;
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (e<0) {
    scale+=0.01;
  } else if (e>0) {
    scale-=0.01;
  }
  scale= constrain(scale, 0.26, 4.5);
}

void drawSide() {
  stroke(0);
  fill(200);
  rect(width*0.8, 0, width, height);

  if (select== 1) {
    stroke(YELLOW);
  } else {
    stroke(0);
  }
  fill(DARKGREEN);
  rect(width*0.83775, height*0.1, width*0.025, width*0.025);
  if (select== 2) {
    stroke(YELLOW);
  } else {
    stroke(0);
  }
  fill(DARKBLUE);
  rect(width*0.88775, height*0.1, width*0.025, width*0.025);
  if (select== 3) {
    stroke(YELLOW);
  } else {
    stroke(0);
  }
  fill(ORANGE);
  rect(width*0.93775, height*0.1, width*0.025, width*0.025);
}
