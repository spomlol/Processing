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

public class Pool extends PApplet {

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

public void setup() {
  
  ball = new whiteball();
  otherballs = new ArrayList<otherball>();
  int red = color(200, 0, 0);
  int yellow = color(255, 255, 0);
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

public void draw() {
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
  rect(width/100*47.5f, 0, width/100*6, 25);
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




public void drawTable() {
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

public void drawCue() {
  if (ball.velocity.x == 0 && ball.velocity.y==0) {
    currX = mouseX;
    currY = mouseY;
    float angle = atan2(-ball.position.y+currY, -ball.position.x+currX);
    strokeWeight(5);
    stroke(120, 42, 5);
    line((20+clickTime)*cos(angle)+ball.position.x, (20+clickTime)*sin(angle)+ball.position.y, (300+clickTime)*cos(angle)+ball.position.x, (300+clickTime)*sin(angle)+ball.position.y);
  }
}
public void drawCue2() {
  if (ball.velocity.x == 0 && ball.velocity.y==0) {
    float angle = atan2(-ball.position.y+currY, -ball.position.x+currX);
    strokeWeight(5);
    stroke(120, 42, 5);
    line((20+clickTime)*cos(angle)+ball.position.x, (20+clickTime)*sin(angle)+ball.position.y, (300+clickTime)*cos(angle)+ball.position.x, (300+clickTime)*sin(angle)+ball.position.y);
  }
}


public void mouseReleased() {
  if (ball.velocity.x==0 && ball.velocity.y==0) {
    shoot=true;
    clickTime2= clickTime;
  }
}
public void shoot() {
  if (clickTime==0) {
    float angle = atan2(-ball.position.y+mouseY, -ball.position.x+mouseX);
    if (angle==0) {angle=0.001f;}
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

public void mouseClicked() {
  if (ball.show == false || GO==true) {
    GO=false;
    setup();
  }
}
class whiteball {
  float m= 1;
  float r=30;
  PVector position = new PVector(width/5, height/2+1);
  PVector velocity = new PVector(0, 0);
  float resistance=0.99997f;
  float movelimit =0.00004f;
  boolean show = true;
  public void update() {
    position.x+=velocity.x;
    if (velocity.x>0) {
      velocity.x*=resistance;
      if (velocity.x <movelimit) {
        velocity.x=0;
      }
    } else if (velocity.x <0) {
      velocity.x*=resistance;
      if (velocity.x >-movelimit) {
        velocity.x=0;
      }
    }
    position.y+=velocity.y;
    if (velocity.y >0) {
      velocity.y*=resistance;
      if (velocity.y <movelimit) {
        velocity.y=0;
      }
    } else if (velocity.y <0) {
      velocity.y*=resistance;
      if (velocity.y >-movelimit) {
        velocity.y=0;
      }
    }

    if (position.x>width-40) {
      velocity.x=-velocity.x;
      position.x= width-40;
    } else if (position.x<40) {
      velocity.x=-velocity.x;
      position.x= 40;
    }

    if (position.y>height-40) {
      velocity.y=-velocity.y;
      position.y= height-40;
    } else if (position.y<40) {
      velocity.y=-velocity.y;
      position.y= 40;
    }


    if (dist(ball.position.x, ball.position.y, 30, height-30)<30 || dist(ball.position.x, ball.position.y, 30, 30)<30 || dist(ball.position.x, ball.position.y, width-30, height-30)<30 
      || dist(ball.position.x, ball.position.y, width-30, 30)<30 || dist(ball.position.x, ball.position.y, width/2, height-30)<30 || dist(ball.position.x, ball.position.y, width/2, 30)<30) {
      show=false;
    }
  }
  public void show() {
    fill(255);
    stroke(0);
    strokeWeight(0);
    ellipse(position.x, position.y, 30, 30);
  }
}

class otherball {
  float m= 1;
  float r=30;
  PVector position = new PVector(width/2, height/2);
  PVector velocity = new PVector(0, 0);
  float resistance=0.99997f;
  float movelimit =0.00004f;
  int col = color(255, 255, 0);
  boolean show = true;
  otherball(float x, float y, int col) {
    position = new PVector(x, y);
    this.col = col;
  }


  public void update() {
    if (show==true) {
      PVector distanceVect = PVector.sub(ball.position, position);
        float distanceVectMag = distanceVect.mag();
        float minDistance = r;
        if (distanceVectMag < minDistance) {
          float distanceCorrection = (minDistance-distanceVectMag)/2.0f;
          PVector d = distanceVect.copy();
          PVector correctionVector = d.normalize().mult(distanceCorrection);
          ball.position.add(correctionVector);
          position.sub(correctionVector);

          // get angle of distanceVect
          float theta  = distanceVect.heading();
          // precalculate trig values
          float sine = sin(theta);
          float cosine = cos(theta);

          /* bTemp will hold rotated ball positions. You 
           just need to worry about bTemp[1] position*/
          PVector[] bTemp = {
            new PVector(), new PVector()
          };
          bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
          bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

          PVector[] vTemp = {
            new PVector(), new PVector()
          };

          vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
          vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
          vTemp[1].x  = cosine * ball.velocity.x + sine * ball.velocity.y;
          vTemp[1].y  = cosine * ball.velocity.y - sine * ball.velocity.x;

          PVector[] vFinal = {  
            new PVector(), new PVector()
          };

          // final rotated velocity for b[0]
          vFinal[0].x = ((m - ball.m) * vTemp[0].x + 2 * ball.m * vTemp[1].x) / (m + ball.m);
          vFinal[0].y = vTemp[0].y;

          // final rotated velocity for b[0]
          vFinal[1].x = ((ball.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + ball.m);
          vFinal[1].y = vTemp[1].y;

          // hack to avoid clumping
          bTemp[0].x += vFinal[0].x;
          bTemp[1].x += vFinal[1].x;

          /* Rotate ball positions and velocities back
           Reverse signs in trig expressions to rotate 
           in the opposite direction */
          // rotate balls
          PVector[] bFinal = { 
            new PVector(), new PVector()
          };

          bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
          bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
          bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
          bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

          // update balls to screen position
          ball.position.x = position.x + bFinal[1].x;
          ball.position.y = position.y + bFinal[1].y;

          position.add(bFinal[0]);

          // update velocities
          velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
          velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
          ball.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
          ball.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
        }
      
      
      
      for (otherball other : otherballs) {
        distanceVect = PVector.sub(other.position, position);
        distanceVectMag = distanceVect.mag();
        minDistance = r;
        if (distanceVectMag < minDistance) {
          float distanceCorrection = (minDistance-distanceVectMag)/2.0f;
          PVector d = distanceVect.copy();
          PVector correctionVector = d.normalize().mult(distanceCorrection);
          other.position.add(correctionVector);
          position.sub(correctionVector);

          // get angle of distanceVect
          float theta  = distanceVect.heading();
          // precalculate trig values
          float sine = sin(theta);
          float cosine = cos(theta);

          /* bTemp will hold rotated ball positions. You 
           just need to worry about bTemp[1] position*/
          PVector[] bTemp = {
            new PVector(), new PVector()
          };

          /* this ball's position is relative to the other
           so you can use the vector between them (bVect) as the 
           reference point in the rotation expressions.
           bTemp[0].position.x and bTemp[0].position.y will initialize
           automatically to 0.0, which is what you want
           since b[1] will rotate around b[0] */
          bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
          bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

          // rotate Temporary velocities
          PVector[] vTemp = {
            new PVector(), new PVector()
          };

          vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
          vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
          vTemp[1].x  = cosine * other.velocity.x + sine * other.velocity.y;
          vTemp[1].y  = cosine * other.velocity.y - sine * other.velocity.x;

          /* Now that velocities are rotated, you can use 1D
           conservation of momentum equations to calculate 
           the final velocity along the x-axis. */
          PVector[] vFinal = {  
            new PVector(), new PVector()
          };

          // final rotated velocity for b[0]
          vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
          vFinal[0].y = vTemp[0].y;

          // final rotated velocity for b[0]
          vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
          vFinal[1].y = vTemp[1].y;

          // hack to avoid clumping
          bTemp[0].x += vFinal[0].x;
          bTemp[1].x += vFinal[1].x;

          /* Rotate ball positions and velocities back
           Reverse signs in trig expressions to rotate 
           in the opposite direction */
          // rotate balls
          PVector[] bFinal = { 
            new PVector(), new PVector()
          };

          bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
          bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
          bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
          bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

          // update balls to screen position
          other.position.x = position.x + bFinal[1].x;
          other.position.y = position.y + bFinal[1].y;

          position.add(bFinal[0]);

          // update velocities
          velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
          velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
          other.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
          other.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
        }
      }
    



//    if (dist(position.x,position.y,ball.position.x,ball.position.y)<=30){
//      float angle = atan2(-ball.position.y+position.y,-ball.position.x+position.x);
//      float tvx = velocity.x;
//      float tvy = velocity.y;
//      //println(newV2.x);
//      //vx = newV1.x;
//      //vy = newV1.y;
//      //ball.vx = newV2.x;
//      //ball.vy = newV2.y;
//      velocity.x=0.9*cos(angle)*sqrt(ball.velocity.x * ball.velocity.x + ball.velocity.y * ball.velocity.y) + 0.1*cos(angle)*sqrt(tvx * tvx + tvy * tvy);
//      velocity.y=0.9*sin(angle)*sqrt(ball.velocity.x * ball.velocity.x + ball.velocity.y * ball.velocity.y) + 0.1*sin(angle)*sqrt(tvx * tvx + tvy * tvy);

//      ball.velocity.x = -0.9*cos(angle)*sqrt(tvx * tvx + tvy * tvy) - 0.1*cos(angle)*sqrt(ball.velocity.x * ball.velocity.x + ball.velocity.y * ball.velocity.y);
//      ball.velocity.y = -0.9*sin(angle)*sqrt(tvx * tvx + tvy * tvy) - 0.1*sin(angle)*sqrt(ball.velocity.x * ball.velocity.x + ball.velocity.y * ball.velocity.y);

//       if (dist(position.x,position.y,ball.position.x,ball.position.y)<30) {
//         ball.position.x=-cos(angle)*30+position.x;
//         ball.position.y=-sin(angle)*30+position.y;
//       }
//    }      

//    for (otherball o: otherballs) {
//      if(o.position.x != position.x && o.position.y != position.y) {
//        if (dist(position.x,position.y,o.position.x,o.position.y)<=30){
//          float angle = atan2(-o.position.y+position.y,-o.position.x+position.x);
//          float tvx = velocity.x;
//          float tvy = velocity.y;
//          //velocity = velocity.sub(position.sub(o.position).mult(velocity.sub(o.velocity).dot(position.sub(o.position))).div(position.sub(o.position).dot(position.sub(o.position))));

//          velocity.x=0.9*cos(angle)*sqrt(o.velocity.x * o.velocity.x + o.velocity.y * o.velocity.y) + 0.1*cos(angle)*sqrt(tvx * tvx + tvy * tvy);
//          velocity.y=0.9*sin(angle)*sqrt(o.velocity.x * o.velocity.x + o.velocity.y * o.velocity.y) + 0.1*sin(angle)*sqrt(tvx * tvx + tvy * tvy);
//          o.velocity.x = -0.9*cos(angle)*sqrt(tvx * tvx + tvy * tvy) - 0.1*cos(angle)*sqrt(o.velocity.x * o.velocity.x + o.velocity.y * o.velocity.y);
//          o.velocity.y = -0.9*sin(angle)*sqrt(tvx * tvx + tvy * tvy) - 0.1*sin(angle)*sqrt(o.velocity.x * o.velocity.x + o.velocity.y * o.velocity.y);

//           if (dist(position.x,position.y,o.position.x,o.position.y)<30) {
//             o.position.x=-cos(angle)*30+position.x;
//             o.position.y=-sin(angle)*30+position.y;
//           }
//        }
//      }
//    }
    position.x+=velocity.x;
    velocity.x*=resistance;
    if (velocity.x > 0) {
      if (velocity.x < movelimit) {
        velocity.x=0;
      }
    } else {
      if (velocity.x > -movelimit) {
        velocity.x=0;
      }
    }
    position.y+=velocity.y;
    velocity.y*=resistance;
    if (velocity.y > 0) {
      if (velocity.y < movelimit) {
        velocity.y=0;
      }
    } else {
      if (velocity.y > -movelimit) {
        velocity.y=0;
      }
    }
    if (position.x>width-40) {
      velocity.x = -velocity.x; 
      position.x = width-40;
    } else if (position.x<40) {
      velocity.x = -velocity.x;
      position.x = 40;
    }
    if (position.y>height-40) {
      velocity.y = -velocity.y; 
      position.y = height-40;
    } else if (position.y<40) {
      velocity.y = -velocity.y;
      position.y = 40;
    }

    if (dist(position.x, position.y, 30, height-30)<30 || dist(position.x, position.y, 30, 30)<30 || dist(position.x, position.y, width-30, height-30)<30 
      || dist(position.x, position.y, width-30, 30)<30 || dist(position.x, position.y, width/2, height-30)<30 || dist(position.x, position.y, width/2, 30)<30) {
      show=false;
      player1=!player1;
      if (col != 0) {
        if (scoreYellow ==0 && scoreRed==0) {
          if ((col==color(255, 255, 0) && player1==true) || (col==color(200, 200, 0) && player1==false)) {
            player1col=1;
          } else {
            player1col=2;
          }
        }

        if (col==color(255, 255, 0)) {
          scoreYellow++;
        } else if (col==color(200, 0, 0)) {
          scoreRed++;
        }
      } else {
        GO=true;
      }
    }
  }
}
public void show() {
  if (show==true) {
    fill(col);
    stroke(0);
    strokeWeight(0);
    ellipse(position.x, position.y, 30, 30);
    if (col == 0) {
      fill(255);
      ellipse(position.x, position.y, 20, 20);
      textAlign(CENTER, CENTER);
      textSize(15);
      fill(0);
      text("8", position.x, position.y);
    }
  }
}
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Pool" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
