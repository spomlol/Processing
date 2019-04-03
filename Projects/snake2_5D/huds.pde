void deathhud() {
  cam.beginHUD();
    textSize(50);
    textAlign(CENTER);
    fill(125,125);
    rect(width/2-400,height/2-60,800,240);
    colorMode(HSB);
    fill(frameCount%255, 255, 255);
    //translate(300, 700, 000);
    text("Game Over\nPlayer "+causedeath+" died!\nPress Any Key To Continue", width/2, height/2);
    colorMode(RGB);
    cam.endHUD();
}

void menuHud() {
  cam.beginHUD();
  fill(125,125);
  if (selection == 1) {
    stroke(0,255,255);
  } else {stroke(0);}
  rect(width/2-400,height/2-60,399,80);
  if (selection == 2 || selection == 3) {
    stroke(0,255,255);
  } else {stroke(0);}
  rect(width/2+1,height/2-60,399,80);
  if (selection == 2) {
    rect(width/2+1,height/2+20,199,80);
    stroke(0);
    rect(width/2+200,height/2+20,199,80);
  } else if (selection == 3) {
    stroke(0);
    rect(width/2+1,height/2+20,199,80);
    stroke(0,255,255);
    rect(width/2+200,height/2+20,199,80);
  }
  textSize(50);
  textAlign(CENTER);
  fill(255);
  text("Singleplayer",width/2-200,height/2);
  text("Multiplayer",width/2+200,height/2);
  text("Change view: press C",400,100);
  if (selection == 2 || selection == 3) {
  //textSize(25);
  text("PvP",width/2+100,height/2+75);
  text("PvAI",width/2+300,height/2+75);
  }
  stroke(0);
  cam.endHUD();
}
