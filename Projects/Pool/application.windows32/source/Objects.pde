class whiteball {
  float m= 1;
  float r=30;
  PVector position = new PVector(width/5, height/2+1);
  PVector velocity = new PVector(0, 0);
  float resistance=0.99997;
  float movelimit =0.00004;
  boolean show = true;
  void update() {
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
  void show() {
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
  float resistance=0.99997;
  float movelimit =0.00004;
  color col = color(255, 255, 0);
  boolean show = true;
  otherball(float x, float y, color col) {
    position = new PVector(x, y);
    this.col = col;
  }


  void update() {
    if (show==true) {
      PVector distanceVect = PVector.sub(ball.position, position);
        float distanceVectMag = distanceVect.mag();
        float minDistance = r;
        if (distanceVectMag < minDistance) {
          float distanceCorrection = (minDistance-distanceVectMag)/2.0;
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
          float distanceCorrection = (minDistance-distanceVectMag)/2.0;
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
void show() {
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
