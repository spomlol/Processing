color BLUE = color(135, 206, 250);
color GREEN= color(34, 139, 34);
color YELLOW = color(200, 200, 0);
color DARKBLUE = color(0, 0, 200);
color ORANGE = color(255, 150, 0);
color DARKGREEN = color(0, 200, 0);
color GREY =  color(50, 50, 50);
color BROWN = color(139, 69, 19);
color[] colors = {BLUE,GREEN,YELLOW,DARKGREEN,DARKBLUE,ORANGE,GREY,BROWN};
int size = 200;
int map[][];
int objects[][];
int xoff, yoff=0;
float scale=1;
PGraphics mapimage;
int xspeed, yspeed=0;
int select =0;
boolean paint = false;
int noHouses;
ArrayList<car> cars = new ArrayList();

void setup() {
  fullScreen(P2D);
  textAlign(CENTER, CENTER);
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
        mapimage.fill(BLUE);
      } else if (map[i][j]==1) {
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
      if (objects[i][j] !=0) {
        fill(colors[objects[i][j]+2]);
        rect(i*20, j*20, 20, 20);
      }
    }
  }
  if (paint) {
    if ((mouseX-xoff)/ scale >0 && (mouseX-xoff)/ scale < size*20 && (mouseY-yoff)/ scale>0 && (mouseY-yoff)/ scale<size*20 && mouseX<width*0.8) {
      int x = floor((mouseX-xoff)/ (20*scale));
      int y = floor((mouseY-yoff)/ (20*scale));
      if (map[x][y] != 0 && (select != 5 && select !=6) && objects[x][y] == 0) {
        if (select == 4 || checkSurround(x,y)) {
          objects[x][y] = select;
          if (select == 1) {
            noHouses +=1;
            if (noHouses%10==0) {
              cars.add(new car());
            }
          }
        } 
      } else if (map[x][y] ==0 && select == 5 && objects[x][y] == 0) {
        objects[x][y] = select;
      } else if (select == 6 && objects[x][y] != 0) {
        objects[x][y] = 0;
      }
    }
  }

  checkmouse();
  for (car c: cars) {
    c.show();
  }
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
    Square(x,y);
  }
}

void checkmouse2() {
  noFill();
  stroke(YELLOW);
  if (mouseX>width*0.83775 && mouseX<width*0.875 && mouseY>height*0.1 && mouseY<height*0.10+width*0.025) {
    rect(width*0.83775, height*0.1, width*0.025, width*0.025);
    fill(200);
    stroke(0);
    rect(width*0.83775,height*0.1+width*0.025,width*0.125, width*0.05);
    fill(0);
    text("Residence",width*0.83775+width*0.125/2,height*0.1+width*0.05);
    if (mousePressed) {
      select =1;
    }
  } else if (mouseX>width*0.88775 && mouseX<width*0.925 && mouseY>height*0.1 && mouseY<height*0.10+width*0.025) {
    rect(width*0.88775, height*0.1, width*0.025, width*0.025);
    fill(200);
    stroke(0);
    rect(width*0.83775,height*0.1+width*0.025,width*0.125, width*0.05);
    fill(0);
    text("Commercial",width*0.83775+width*0.125/2,height*0.1+width*0.05);
    if (mousePressed) {
      select =2;
    }
  } else if (mouseX>width*0.93775 && mouseX<width*0.975 && mouseY>height*0.1 && mouseY<height*0.10+width*0.025) {
    rect(width*0.93775, height*0.1, width*0.025, width*0.025);
    fill(200);
    stroke(0);
    rect(width*0.83775,height*0.1+width*0.025,width*0.125, width*0.05);
    fill(0);
    text("Industry",width*0.83775+width*0.125/2,height*0.1+width*0.05);
    if (mousePressed) {
      select =3;
    }
  } else if (mouseX>width*0.86275 && mouseX<width*0.86275+0.025*width && mouseY>height*0.3 && mouseY<height*0.30+width*0.025) {
    rect(width*0.86275, height*0.3, width*0.025, width*0.025);
    fill(200);
    stroke(0);
    rect(width*0.83775,height*0.3+width*0.025,width*0.125, width*0.05);
    fill(0);
    text("Road",width*0.83775+width*0.125/2,height*0.3+width*0.05);
    if (mousePressed) {
      select =4;
    }
  } else if (mouseX>width*0.91275 && mouseX<width*0.91275+0.025*width && mouseY>height*0.3 && mouseY<height*0.30+width*0.025) {
    rect(width*0.91275, height*0.3, width*0.025, width*0.025);
    fill(200);
    stroke(0);
    rect(width*0.83775,height*0.3+width*0.025,width*0.125, width*0.05);
    fill(0);
    textSize(15);
    text("Bridge\nCan only be built over water",width*0.83775+width*0.125/2,height*0.3+width*0.05);
    textSize(30);
    if (mousePressed) {
      select =5;
    }
  } else if (mouseX>width*0.9-0.01225*width && mouseX<width*0.9+0.025*width && mouseY>height*0.8 && mouseY<height*0.8+width*0.025) {
    rect(width*0.9-0.01225*width, height*0.8, width*0.025, width*0.025);
    fill(200);
    stroke(0);
    rect(width*0.83775,height*0.8+width*0.025,width*0.125, width*0.05);
    fill(0);
    textSize(15);
    text("Destroy\nDestroys object",width*0.83775+width*0.125/2,height*0.8+width*0.05);
    textSize(30);
    if (mousePressed) {
      select =6;
    }
  }
}
void mousePressed() {
  if ((mouseX-xoff)/ scale >0 && (mouseX-xoff)/ scale < size*20 && (mouseY-yoff)/ scale>0 && (mouseY-yoff)/ scale<size*20 && mouseX<width*0.8) {
    paint = true;
  }
}

void mouseReleased() {
  paint = false;
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
  fill(0);
  textSize(30);
  text("Buildings", width*0.9, height*0.05);
  text("Roads", width*0.9, height*0.25);
  text("Destroy", width*0.9, height*0.75);
  //Residence
  if (select== 1) {
    stroke(YELLOW);
  } else {
    stroke(0);
  }
  fill(DARKGREEN);
  rect(width*0.83775, height*0.1, width*0.025, width*0.025);

  //COMMERCIAL
  if (select== 2) {
    stroke(YELLOW);
  } else {
    stroke(0);
  }
  fill(DARKBLUE);
  rect(width*0.88775, height*0.1, width*0.025, width*0.025);

  //Industry
  if (select== 3) {
    stroke(YELLOW);
  } else {
    stroke(0);
  }
  fill(ORANGE);
  rect(width*0.93775, height*0.1, width*0.025, width*0.025);

  //ROAD
  if (select== 4) {
    stroke(YELLOW);
  } else {
    stroke(0);
  }
  fill(GREY);
  rect(width*0.86275, height*0.3, width*0.025, width*0.025);

  //Bridge
  if (select== 5) {
    stroke(YELLOW);
  } else {
    stroke(0);
  }
  fill(BROWN);
  rect(width*0.91275, height*0.3, width*0.025, width*0.025);
  
  //destroy
  if (select== 6) {
    stroke(YELLOW);
  } else {
    stroke(0);
  }
  fill(YELLOW);
  rect(width*0.9-0.01225*width, height*0.8, width*0.025, width*0.025);
}


void Square(float x,float y) {
  rect(x*20, y*20, 20, 20);
}

boolean checkSurround(int x, int y) {
  boolean flag = false;
  for (int i = -2; i<3;i++) {
    for (int j = -2; j<3;j++) {
      if ((x+i>=0 && x+i < size) && (y+j>=0 && y+j < size)) {
        if (objects[x+i][y+j] == 4) {
          flag = true;
          break;
        }
      }
    }
  }
  return flag;
}
