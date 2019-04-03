whiteball ball;
ArrayList<otherball> otherballs;
int clickTime;
int clickTime2;
boolean shoot=false;
float currX;
float currY;
int scoreRed;
int scoreYellow;
boolean player1=true;
int player1col;
boolean GO=false;

void setup() {
  fullScreen();
  ball = new whiteball();
  otherballs = new ArrayList<otherball>();
  color red = color(200, 0, 0);
  color yellow = color(255, 255, 0);
  otherballs.add(new otherball(width/2, height/2, red));
  otherballs.add(new otherball(width/2+30, height/2+18, yellow));
  otherballs.add(new otherball(width/2+30, height/2-18, red));
  otherballs.add(new otherball(width/2+60, height/2, 0));
  otherballs.add(new otherball(width/2+60, height/2+36, red));
  otherballs.add(new otherball(width/2+60, height/2-36, yellow));
  otherballs.add(new otherball(width/2+90, height/2+54, yellow));
  otherballs.add(new otherball(width/2+90, height/2+18, red));
  otherballs.add(new otherball(width/2+90, height/2-18, yellow));
  otherballs.add(new otherball(width/2+90, height/2-54, red));
  otherballs.add(new otherball(width/2+120, height/2, yellow));
  otherballs.add(new otherball(width/2+120, height/2+36, yellow));
  otherballs.add(new otherball(width/2+120, height/2+72, red));
  otherballs.add(new otherball(width/2+120, height/2-36, red));
  otherballs.add(new otherball(width/2+120, height/2-72, yellow));
}

void draw() {
  drawTable();
  for (int i = 0; i<1000; i++) {
    for (otherball o : otherballs) {
      o.update();
    }
    ball.update();
  }
  for (otherball o : otherballs) {
    o.show();
  }
  if (ball.show==true && GO==false) {
    ball.show();


    if (mousePressed && ball.velocity.x==0 && ball.velocity.y==0 ) {
      if (ball.velocity.x == 0 && ball.velocity.y==0 && clickTime <50) {
        clickTime++;
      }
    }

    if (shoot==true) {
      shoot();
      drawCue2();
    } else {
      drawCue();
    }
  } else if (GO==false) {
    textAlign(CENTER, CENTER);
    textSize(100);
    fill(0);
    String player;
    if (player1==true) {
      player = "1";
    } else {
      player = "2";
    }
    text("Game Over\n Click to restart\nPlayer "+ player + " wins", width/2, height/2);
  } else {
    ball.show();
    String player;
    if (player1==true) {
      player = "2";
    } else {
      player = "1";
    }
    if(scoreRed < 7 && scoreYellow < 7) {
      text("Game Over\n Click to restart\nPlayer "+ player + " wins", width/2, height/2);
    } else if((player1col==1 && scoreYellow >=7 && player1==true) || (player1col==2 && scoreRed >=7 && player1==true)) {
      text("Player 1 won!\n Click to restart", width/2, height/2);
    } else if((player1col==1 && scoreRed >=7 && player1==false) || (player1col==2 && scoreYellow >=7 && player1==false)) {
      text("Player 2 won!\n Click to restart", width/2, height/2);
    } else {
      text("Game Over\n Click to restart\nPlayer "+ player + " wins", width/2, height/2);
    }
  }
  noStroke();
  fill(255, 255, 255);
  rect(width/100*4, 0, width/100*2, 25);
  rect(width/100*94, 0, width/100*2, 25);
  fill(0,200,200);
  rect(width/100*47.5, 0, width/100*6, 25);
  textSize(25);
  fill(200, 200, 0);
  text(scoreYellow, width/100*5, 10);
  fill(200, 0, 0);
  text(scoreRed, width/100*95, 10);
  stroke(0);
  if (player1 ==true) {
    if (player1col==0) {
      fill(0);
    } else if (player1col==1) {
      fill(255, 255, 0);
    } else if (player1col==2) {
      fill(200, 0, 0);
    }
    text("Player 1", width/2, 10);
  } else {
    if (player1col==0) {
      fill(0);
    } else if (player1col==1) {
      fill(200, 0, 0);
    } else if (player1col==2) {
      fill(255, 255, 0);
    }
    text("Player 2", width/2, 10);
  }
}




void drawTable() {
  background(0, 100, 0);
  noFill();
  stroke(0, 125, 125);
  strokeWeight(50);
  rect(0, 0, width, height);
  fill(0);
  noStroke();
  int r=60;
  ellipse(30, 30, r, r);
  ellipse(30, height-30, r, r);
  ellipse(width-30, 30, r, r);
  ellipse(width-30, height-30, r, r);
  ellipse(width/2, 30, r, r);
  ellipse(width/2, height-30, r, r);
  textSize(50);
  fill(0,100);
  text("SpOmLoL",width-199,height-99);
  fill(125,100);
  text("SpOmLoL",width-200,height-100);
}

void drawCue() {
  if (ball.velocity.x == 0 && ball.velocity.y==0) {
    currX = mouseX;
    currY = mouseY;
    float angle = atan2(-ball.position.y+currY, -ball.position.x+currX);
    strokeWeight(5);
    stroke(120, 42, 5);
    line((20+clickTime)*cos(angle)+ball.position.x, (20+clickTime)*sin(angle)+ball.position.y, (300+clickTime)*cos(angle)+ball.position.x, (300+clickTime)*sin(angle)+ball.position.y);
  }
}
void drawCue2() {
  if (ball.velocity.x == 0 && ball.velocity.y==0) {
    float angle = atan2(-ball.position.y+currY, -ball.position.x+currX);
    strokeWeight(5);
    stroke(120, 42, 5);
    line((20+clickTime)*cos(angle)+ball.position.x, (20+clickTime)*sin(angle)+ball.position.y, (300+clickTime)*cos(angle)+ball.position.x, (300+clickTime)*sin(angle)+ball.position.y);
  }
}


void mouseReleased() {
  if (ball.velocity.x==0 && ball.velocity.y==0) {
    shoot=true;
    clickTime2= clickTime;
  }
}
void shoot() {
  if (clickTime==0) {
    float angle = atan2(-ball.position.y+mouseY, -ball.position.x+mouseX);
    if (angle==0) {angle=0.001;}
    ball.velocity.x= -clickTime2*cos(angle)/1000;
    ball.velocity.y= -clickTime2*sin(angle)/1000;
    clickTime2=0;
    shoot=false;
    player1 = !player1;
  } else {
    clickTime-=clickTime2/4;
    if (clickTime <=0) {
      clickTime=0;
    }
  }
}

void mouseClicked() {
  if (ball.show == false || GO==true) {
    GO=false;
    setup();
  }
}
