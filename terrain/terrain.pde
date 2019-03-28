int num = 50;
float noChunks=3;
float[][] map = new float[int(num*noChunks)][int(num*noChunks)];
import peasy.*;
import java.awt.Robot;
import java.awt.AWTException;
PeasyCam cam;
OpenSimplexNoise noise;
float fac = 100;
float angleX=100*PI;
float angleY=0;
float transX=num*noChunks/2;
float transY=num*noChunks/2;
float transZ=0;
float move1, move2;

//int renderdist = 25;
float vz = 0;
ArrayList<tree> trees = new ArrayList();
ArrayList<PShape> chunks = new ArrayList();
PShape terrain, box;
Robot robot;
void setup() {
  //lights();
  fullScreen(P3D);
  //colorMode(HSB);
  noise = new OpenSimplexNoise();
  terrain = createShape(GROUP);
  try { 
    robot = new Robot();
  } 
  catch (AWTException e) {
    e.printStackTrace();
  }
  float fov = PI/3.0;
  float z = random(0, 1000);
  float cameraZ = (height/2.0) / tan(fov/2.0);
  perspective(fov, float(width)/float(height), 1, cameraZ*10.0);
  for (int i =0; i<num*noChunks; i++) {
    for (int j =0; j<num*noChunks; j++) {
      float n = (float) noise.eval(i/fac, j/fac, z);
      map[i][j] = int(map(n, -1, 1, 0, 100));
    }
  }
  for (int k = 0; k<noChunks; k++) {
    for (int l = 0; l<noChunks; l++) {
    for (int i =num*k; i<num+num*k; i++) {
      
      for (int j =num*l; j<num+num*l; j++) {
        int condition = int(map[i][j]);
        if (condition>70) {
          condition=70;
        }
        for (int x =int(map[i][j])+5; x>condition; x--) {
          box = createShape();
          box.beginShape(QUADS);
          box.vertex(i, j, x);
          box.vertex(i+1, j, x);
          box.vertex(i+1, j+1, x);
          box.vertex(i, j+1, x);
          box.vertex(i, j, x);
          box.vertex(i, j, x+1);
          box.vertex(i+1, j, x+1);
          box.vertex(i+1, j, x);
          box.vertex(i, j, x);
          box.vertex(i, j, x+1);
          box.vertex(i, j+1, x+1);
          box.vertex(i, j+1, x);
          box.vertex(i+1, j, x);
          box.vertex(i+1, j, x+1);
          box.vertex(i+1, j+1, x+1);
          box.vertex(i+1, j+1, x);
          box.vertex(i, j+1, x);
          box.vertex(i, j+1, x+1);
          box.vertex(i+1, j+1, x+1);
          box.vertex(i+1, j+1, x);
          box.vertex(i, j, x+1);
          box.vertex(i+1, j, x+1);
          box.vertex(i+1, j+1, x+1);
          box.vertex(i, j+1, x+1);
          box.endShape(CLOSE);
          if (x == int(map[i][j]+1)) {
            if (x<30) {
              box.setFill(color(255));
            } else if (x<40) {
              box.setFill(color(125));
            } else if (x>40) {
              box.setFill(color(124, 252, 0));
              if (x>70) {
                box.setFill(color(255, 253, 208));
              }
            }
          } else {
            if (x>40) {
              box.setFill(color(139, 69, 19));
            }
            if (x>70) {
              box.setFill(color(0, 0, 255, 125));
              noStroke();
            }
          }
          terrain.addChild(box);
          stroke(0);
        }
      }
    }
    chunks.add(terrain);
    terrain = createShape(GROUP);
  }}
  for (int i = 0; i< 100; i++) {
    int x = int(random(0, num*noChunks));
    int y = int(random(0, num*noChunks));
    if (map[x][y]>40 && map[x][y]<70) {
      trees.add(new tree(x, y, int(map[x][y])));
    }
  }
  camera(sin(angleX)+transX, cos(angleX)+transY, map[0][0]-5+sin(angleY)+transZ, transX, transY, map[0][0]-5+transZ, 0, 0, 1);
}


void draw() {
  //println(frameRate);
  noCursor();
  camera(sin(angleX)+transX, cos(angleX)+transY, map[0][0]-2+angleY+transZ, transX, transY, map[0][0]-2+transZ, 0, 0, 1);
  background(135, 206, 250);
  sun();
  ambientLight(125, 125, 125) ;
  //directionalLight(128, 128, 128, -0.5, 0, 0.5);
  move();
  int xchunk = round((transX-num/2)/num);
  int ychunk = round((transY-num/2)/num);
  
  for (int i = xchunk -1; i<= xchunk +1;i++) {
    for (int j = ychunk -1; j <= ychunk +1; j++) {
      int chunkno = i*int(noChunks)+j;
      if (chunkno >= 0 && chunkno < noChunks*noChunks) {
        terrain = chunks.get(chunkno);
        shape(terrain);
      }
    }
  }
  //for (PShape terrain : chunks) {
  //  shape(terrain);
  //}
  //for (int i =int(constrain(transX-renderdist,1,num-renderdist-1)); i<constrain(transX+renderdist,1,num-1); i++) {
  //  for (int j =int(constrain(transY-renderdist,1,num-renderdist-1)); j<constrain(transY+renderdist,1,num-1); j++) {
  //    stroke(0);
  //    fill(180);
  //    for (int x =int(map[i][j])+5; x>int(map[i][j]); x--) {
  //      if (x == int(map[i][j]+1)) {
  //        if (x<30) {
  //          fill(255);
  //        } else if (x<40) {
  //          fill(125);
  //        } else if (x>40) {
  //          fill(124, 252, 0);
  //          if (x>70) {
  //            fill(0, 0, 255);
  //            x=70;
  //          }
  //        }
  //      } else {
  //        if (x>40) {
  //          fill(139, 69, 19);
  //        }
  //        if (x>70) {
  //          fill(0, 0, 255);
  //        }
  //      }
  //      pushMatrix();
  //      translate(i, j, x);
  //      box(1);
  //      popMatrix();
  //    }
  //  }
  //}
  stroke(0);
  for (tree t : trees) {
    t.show();
  }
}

void mouseMoved() {
  if ( mouseX-pmouseX < 0) {
    angleX-=0.1;
  }
  if ( mouseX-pmouseX > 0) {
    angleX+=0.1;
  }
  if ( mouseY-pmouseY > 0) {
    angleY-=0.05;
  }
  if ( mouseY-pmouseY < 0) {
    angleY+=0.05;
  }
  angleY=constrain(angleY, -3, 3);
  robot.mouseMove( width/2, height/2 );
}

void move() {
  transX+=sin(angleX)*move1-cos(angleX)*move2;
  transY+=cos(angleX)*move1+sin(angleX)*move2;
  transX=constrain(transX, 0, num*noChunks-1);
  transY=constrain(transY, 0, num*noChunks-1);
  int z1 = int(ceil(transX));
  int z2 = int(ceil(transY));
  vz = vz-0.2;
  transZ-=vz;
  transZ=constrain(transZ, -1000, int(map[z1][z2]-map[0][0]));
}

void keyPressed() {
  if (key == 'z') {
    move1=-0.5;
  }
  if (key == ' ') {
    int z1 = int(ceil(transX));
    int z2 = int(ceil(transY));
    if (int(map[z1][z2]-map[0][0])==transZ) {
      vz=1;
    }
  }
  if (key == 's') {
    move1=0.5;
  }
  if (key == 'q') {
    move2=-0.5;
  }
  if (key == 'd') {
    move2=0.5;
  }
  //if (key == '+') {
  //  renderdist+=10;
  //}
  //if (key == '-') {
  //  renderdist-=10;
  //  renderdist = constrain(renderdist,10,100000);
  //}
}
void keyReleased() {
  if (key == 'z' || key =='s') {
    move1=0;
  }
  if (key == 'q' || key =='d') {
    move2=0;
  }
}

void sun() {
  pushMatrix();
  noStroke();
  fill(255, 255, 0);
  translate(400, 25, -100);
  box(20);
  popMatrix();
}
