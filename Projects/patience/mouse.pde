void mousePressed() {
  if (!selected) {
    for (card c : cards) {
      if (mouseX < c.pos.x+w/2 & mouseX > c.pos.x-w/2 & mouseY < c.pos.y+h/2 & mouseY > c.pos.y -h/2 & c.revealed==true) {
        c.clicked = true;
        selected=true;
      }
    }
    if (mouseX < 0.1*width+w/2 & mouseX > 0.1*width-w/2 & mouseY < 0.1*height+h/2 & mouseY > 0.1*height-h/2) {
      if (stacks.get(0).cards.size()>0) {
        for (int i =0; i<3; i++) {
          if (stacks.get(0).cards.size() !=0) {
            card c = stacks.get(0).cards.get(0);
            c.pos.set(0.2*width, 0.1*height);
            c.revealed=true;
            stack2.add(c);
            stacks.get(0).cards.remove(0);
          }
        }
      } else {
        for (card c : stack2) {
          c.pos.set(width*0.1, height*0.1);
          c.revealed=false;
          stacks.get(0).cards.add(c);
        }
        stack2.clear();
      }
    } else if  (mouseX < (0.2*width+w/2)+100 & mouseX > (0.2*width-w/2)+100 & mouseY < 0.1*height+h/2 & mouseY > 0.1*height-h/2 & stack2.size()>0) {
      stack2.get(stack2.size()-1).clicked = true;
      selected=true;
    }
  } else {
    for (int i=0; i<cards.size(); i++) {
      card c = cards.get(i);
      if (c.clicked & c.revealed) {
        c.clicked= false;
        selected=false;
      }
    }
    for (int i=0; i<stack2.size(); i++) {
      card c = stack2.get(i);
      if (c.clicked) {
        if (goal1.size() == 0) {
          if ( mouseX > width*0.6 - w/2 & mouseY > height*0.1 - h/2 & mouseX < width*0.6 + w/2 & mouseY < height*0.1 + h/2 & c.value==1)  {
            c.pos.set(width*0.6, height*0.1);
            goal1.add(c);
            stack2.remove(i);
          }
        } else {
          if ( mouseX > width*0.6 - w/2 & mouseY > height*0.1 - h/2 & mouseX < width*0.6 + w/2 & mouseY < height*0.1 + h/2 &  goal1.get(goal1.size()-1).symbol == c.symbol) {
            c.pos.set(width*0.6, height*0.1);
            goal1.add(c);
            stack2.remove(i);
          }
        }
        c.clicked= false;
        selected=false;
      }
    }
  }
}
