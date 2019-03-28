//parameters
int w = 50;
int NoPlayers = 100;
int speed = 1;
int posXgoal = 700;
int posYgoal = 150;


int maxTime=400;
int iter=0;
ArrayList<player> players;
import java.util.Collections;
import java.util.*;

//player play = new player();
void setup() {
  size(1000, 1000);
  players = new ArrayList<player>();
  for (int j = 0; j < NoPlayers; j++) {
    int[] PressesX = new int[maxTime];
    for (int i=0; i<maxTime;i++) {
      PressesX[i] = floor(noise((i+j*maxTime)*0.02,0)*2);
    }
    int[] PressesY = new int[maxTime];
    for (int i=0; i<maxTime; i++) {
       PressesY[i] = floor(noise((i+j*maxTime)*0.02,1)*2); 
    }
    
    players.add(new player(PressesY,PressesX));
  }
  
}

void draw() {
  background(0);
  fill(255,0,0);
  rect(posXgoal-10,posYgoal-10,20,20);
  fill(255,0,255);
  
  for (player p : players){
  switch (p.DNAX[iter]) {
      case 0:
        p.vx = -speed;
        break;
      case 1:
        p.vx=speed;
        break;
    }
  switch (p.DNAY[iter]) {
      case 0:
        p.vy=-speed;
        break;
      case 1:
        p.vy=speed;
        break;
    }
    
    println(p.vy);
    p.update();
    p.show();
  }
  iter ++;
  if (iter == maxTime) { 
    newGen();
  }
}

  
  
  
