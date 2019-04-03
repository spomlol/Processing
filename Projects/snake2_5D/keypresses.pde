void keyPressed() {
  if (snakes.get(0).click == false && menu == false) {
    if (keyCode == DOWN && snakes.get(0).dir != 4) {
      snakes.get(0).segments.get(snakes.get(0).segments.size()-1).z = 3;
      snakes.get(0).dir = 3;
      snakes.get(0).click = true;
    } else if (keyCode == UP && snakes.get(0).dir != 3) {
      snakes.get(0).segments.get(snakes.get(0).segments.size()-1).z = 4;
      snakes.get(0).dir = 4;
      snakes.get(0).click = true;
    } else if (keyCode == LEFT && snakes.get(0).dir != 1) {
      snakes.get(0).segments.get(snakes.get(0).segments.size()-1).z = 2;
      snakes.get(0).dir = 2;
      snakes.get(0).click = true;
    } else if (keyCode == RIGHT && snakes.get(0).dir != 2) {
      snakes.get(0).segments.get(snakes.get(0).segments.size()-1).z = 1;
      snakes.get(0).dir = 1;
      snakes.get(0).click = true;
    }
  }
  if (multi) {
  if (snakes.get(1).click == false && menu == false) {
    if (key == 's' && snakes.get(1).dir != 4) {
      snakes.get(1).segments.get(snakes.get(1).segments.size()-1).z = 3;
      snakes.get(1).dir = 3;
      snakes.get(1).click = true;
    } else if (key == 'z' && snakes.get(1).dir != 3) {
      snakes.get(1).segments.get(snakes.get(1).segments.size()-1).z = 4;
      snakes.get(1).dir = 4;
      snakes.get(1).click = true;
    } else if (key == 'q' && snakes.get(1).dir != 1) {
      snakes.get(1).segments.get(snakes.get(1).segments.size()-1).z = 2;
      snakes.get(1).dir = 2;
      snakes.get(1).click = true;
    } else if (key == 'd' && snakes.get(1).dir != 2) {
      snakes.get(1).segments.get(snakes.get(1).segments.size()-1).z = 1;
      snakes.get(1).dir = 1;
      snakes.get(1).click = true;
    }
  }
  }
  if (death) {
    menu = true;
    ai = true;
    reset(true,true);
  }
  if (menu) {
    if (keyCode == LEFT) {
      selection -= 1;
    } else if (keyCode == RIGHT) {
      selection += 1;
    }
    selection = constrain(selection,1,3);
    if (keyCode == ENTER) {
      ai = false;
      menu = false;
      if (selection == 1) {
        noFoods =1;
        multi = false;
        reset(false,false);
      }
      else if (selection == 2){
        noFoods = 2;
        multi = true;
        reset(false,false);
      } else if (selection == 3){
        noFoods = 2;
        multi = true;
        reset(false,true);
      }
      
    }
    if (key == 'c') {
      threed = !threed;
    }
  }
}
