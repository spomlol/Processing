package processing.test.epic;

import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class epic extends PApplet {

ArrayList<points> point;
float t;
float tinc = 0.0001f;
boolean[] bools1;
boolean[] bools2;
int seed;
public void setup() {
  t=0;
  frameCount=0;
  bools1 = new boolean[24];
  bools2 = new boolean[24];
  point = new ArrayList();
  
  background(0);
  seed = PApplet.parseInt(random(0,10000));
  randomSeed(seed);
  //randomSeed(649);
  //randomSeed(501);
  //randomSeed(518);
  //randomSeed(298);
  for(int i = 0; i<24;i++) {
    bools1[i] = (random(0,1)>0.5f) ? true  : false;
    bools2[i] = (random(0,1)>0.5f) ? true  : false;
  }
}

public void draw() {
  background(0);
  stroke(255);
  fill(255);
  translate(width/2,height/2);
  for (int i=point.size()-1; i>=0 ; i--) {
    points p = point.get(i);
    p.show();
    p.update();
    if (point.size() > 1000) {
      point.remove(i);
    }
  }
  t=tinc*frameCount;
  point.add(new points(t));
  text("Seed:"+seed,-width/2+20,-height/2+20);
  text("Time:"+t,width/2-80,-height/2+20);
}

public void keyPressed() {
  setup();
}
public void mousePressed() {
  setup();
}
class points {
  ArrayList<PVector> punt = new ArrayList();
  points(float t) {
    punt.add(new PVector(t, t));
  }

  public void show() {
    noFill();
    //int alpha = 100;
    for (PVector p : punt) {
      //stroke(255,alpha);
      point(p.x*width, p.y*height);
      //alpha-=1;
    }
  }
  public void update() {
    if (punt.size() >= 10) {
      punt.remove(0);
    }
    punt.add(xfunc(punt.get(punt.size()-1)));
  }
}

public PVector xfunc(PVector p) {
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

  return new PVector(x, y);
}
  public void settings() {  fullScreen(); }
}
