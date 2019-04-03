
class card {
  PVector pos = new PVector(width/2, height/2);
  boolean clicked = false;
  boolean revealed = false;
  int value;
  int symbol;

  card(int V, int S) {
    value = V;
    symbol = S;
  }

  void show() {
    if (clicked) {
      stroke(255, 255, 0);
    } else {
      stroke(0);
    }
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h);
    if (revealed) {
      if (symbol == 1 | symbol == 2) {
        fill(200, 0, 0);
      } else {
        fill(0);
      }
      textSize(15);
      if (value<11) {
        text(value, pos.x-w/2.2, pos.y-h/2.4);
        text(value, pos.x+w/2.9, pos.y+h/2.4);
      } else if (value == 11) {
        text("J", pos.x-w/2.2, pos.y-h/2.4);
        text("J", pos.x+w/2.9, pos.y+h/2.4);
      } else if (value == 12) {
        text("D", pos.x-w/2.2, pos.y-h/2.4);
        text("D", pos.x+w/2.9, pos.y+h/2.4);
      } else if (value == 13) {
        text("K", pos.x-w/2.2, pos.y-h/2.4);
        text("K", pos.x+w/2.9, pos.y+h/2.4);
      }
      fill(255);
      //print(symbol);
      if (symbol == 1) {
        image(heart, pos.x, pos.y);
        image(sheart, pos.x+w/2.7, pos.y-h/2.4);
        image(sheart, pos.x-w/2.7, pos.y+h/2.4);
      } else if (symbol == 2) {
        image(diamond, pos.x, pos.y);
        image(sdiamond, pos.x+w/2.7, pos.y-h/2.4);
        image(sdiamond, pos.x-w/2.7, pos.y+h/2.4);
      } else if (symbol == 3) {
        image(clover, pos.x, pos.y);
        image(sclover, pos.x+w/2.7, pos.y-h/2.4);
        image(sclover, pos.x-w/2.7, pos.y+h/2.4);
      } else if (symbol == 4) {
        image(spade, pos.x, pos.y);
        image(sspade, pos.x+w/2.7, pos.y-h/2.4);
        image(sspade, pos.x-w/2.7, pos.y+h/2.4);
      }
    } else {
      line(pos.x-w/2, pos.y-h/2, pos.x+w/2, pos.y+h/2);
      line(pos.x+w/2, pos.y-h/2, pos.x-w/2, pos.y+h/2);
      circle(pos.x, pos.y, 50);
    }
  }

  void showstack2(int i) {
    if (clicked) {
      stroke(255, 255, 0);
    } else {
      stroke(0);
    }
    rectMode(CENTER);
    rect(pos.x+i*50, pos.y, w, h);
    if (revealed) {
      if (symbol == 1 | symbol == 2) {
        fill(200, 0, 0);
      } else {
        fill(0);
      }
      textSize(15);
      if (value<11) {
        text(value, pos.x-w/2.2+i*50, pos.y-h/2.4);
        text(value, pos.x+w/2.7+i*50, pos.y+h/2.4);
      } else if (value == 11) {
        text("J", pos.x-w/2.2+i*50, pos.y-h/2.4);
        text("J", pos.x+w/2.7+i*50, pos.y+h/2.4);
      } else if (value == 12) {
        text("D", pos.x-w/2.2+i*50, pos.y-h/2.4);
        text("D", pos.x+w/2.7+i*50, pos.y+h/2.4);
      } else if (value == 13) {
        text("K", pos.x-w/2.2+i*50, pos.y-h/2.4);
        text("K", pos.x+w/2.7+i*50, pos.y+h/2.4);
      }
      fill(255);
      //print(symbol);
      if (symbol == 1) {
        image(heart, pos.x+i*50, pos.y);
        image(sheart, pos.x+w/2.7+i*50, pos.y-h/2.4);
        image(sheart, pos.x-w/2.7+i*50, pos.y+h/2.4);
      } else if (symbol == 2) {
        image(diamond, pos.x+i*50, pos.y);
        image(sdiamond, pos.x+w/2.7+i*50, pos.y-h/2.4);
        image(sdiamond, pos.x-w/2.7+i*50, pos.y+h/2.4);
      } else if (symbol == 3) {
        image(clover, pos.x+i*50, pos.y);
        image(sclover, pos.x+w/2.7+i*50, pos.y-h/2.4);
        image(sclover, pos.x-w/2.7+i*50, pos.y+h/2.4);
      } else if (symbol == 4) {
        image(spade, pos.x+i*50, pos.y);
        image(sspade, pos.x+w/2.7+i*50, pos.y-h/2.4);
        image(sspade, pos.x-w/2.7+i*50, pos.y+h/2.4);
      }
    } else {
      line(pos.x-w/2+i*50, pos.y-h/2, pos.x+w/2+i*50, pos.y+h/2);
      line(pos.x+w/2+i*50, pos.y-h/2, pos.x-w/2+i*50, pos.y+h/2);
      circle(pos.x+i*50, pos.y, 50);
    }
  }
  void showmids(int i) {
    if (clicked) {
      stroke(255, 255, 0);
    } else {
      stroke(0);
    }
    rectMode(CENTER);
    rect(pos.x, pos.y+i*20, w, h);
    if (revealed) {
      if (symbol == 1 | symbol == 2) {
        fill(200, 0, 0);
      } else {
        fill(0);
      }
      textSize(15);
      if (value<11) {
        text(value, pos.x-w/2.2, pos.y-h/2.4+i*20);
        text(value, pos.x+w/2.7, pos.y+h/2.4+i*20);
      } else if (value == 11) {
        text("J", pos.x-w/2.2, pos.y-h/2.4+i*20);
        text("J", pos.x+w/2.7, pos.y+h/2.4+i*20);
      } else if (value == 12) {
        text("D", pos.x-w/2.2, pos.y-h/2.4+i*20);
        text("D", pos.x+w/2.7, pos.y+h/2.4+i*20);
      } else if (value == 13) {
        text("K", pos.x-w/2.2, pos.y-h/2.4+i*20);
        text("K", pos.x+w/2.7, pos.y+h/2.4+i*20);
      }
      fill(255);
      //print(symbol);
      if (symbol == 1) {
        image(heart, pos.x, pos.y+i*20);
        image(sheart, pos.x+w/2.7, pos.y-h/2.4+i*20);
        image(sheart, pos.x-w/2.7, pos.y+h/2.4+i*20);
      } else if (symbol == 2) {
        image(diamond, pos.x, pos.y+i*20);
        image(sdiamond, pos.x+w/2.7, pos.y-h/2.4+i*20);
        image(sdiamond, pos.x-w/2.7, pos.y+h/2.4+i*20);
      } else if (symbol == 3) {
        image(clover, pos.x, pos.y+i*20);
        image(sclover, pos.x+w/2.7, pos.y-h/2.4+i*20);
        image(sclover, pos.x-w/2.7, pos.y+h/2.4+i*20);
      } else if (symbol == 4) {
        image(spade, pos.x, pos.y+i*20);
        image(sspade, pos.x+w/2.7, pos.y-h/2.4+i*20);
        image(sspade, pos.x-w/2.7, pos.y+h/2.4+i*20);
      }
    } else {
      line(pos.x-w/2, pos.y-h/2+i*20, pos.x+w/2, pos.y+h/2+i*20);
      line(pos.x+w/2, pos.y-h/2+i*20, pos.x-w/2, pos.y+h/2+i*20);
      circle(pos.x, pos.y+i*20, 50);
    }
  }
}

void randomize() {
  ArrayList<card> temp = new ArrayList();
  while (cards.size()>0) {
    int x = floor(random(cards.size()));
    temp.add(cards.get(x));
    cards.remove(x);
  }
  cards = temp;
}

void stackinit() {
  int x;
  card c;
  stacks.add(new stack(width*0.1, height*0.1));
  while (cards.size()>28) {
    x = floor(random(cards.size()));
    c = cards.get(x);
    c.pos.set(width*0.1, height*0.1);
    //stack.add(c);
    stacks.get(0).cards.add(c);
    cards.remove(x);
  }
  //mid1
  x = floor(random(cards.size()));
  c = cards.get(x);
  c.pos.set(width*0.2, height*0.35);
  c.revealed = true;
  mid1.add(c);
  cards.remove(x);
  //mid2
  x = floor(random(cards.size()));
  c = cards.get(x);
  c.pos.set(width*0.3, height*0.35);
  mid2.add(c);
  cards.remove(x);
  x = floor(random(cards.size()));
  c = cards.get(x);
  c.pos.set(width*0.3, height*0.35);
  c.revealed = true;
  mid2.add(c);
  cards.remove(x);
  //mid3
  for (int i =0; i<2; i++) {
    x = floor(random(cards.size()));
    c = cards.get(x);
    c.pos.set(width*0.4, height*0.35);
    mid3.add(c);
    cards.remove(x);
  }
  x = floor(random(cards.size()));
  c = cards.get(x);
  c.pos.set(width*0.4, height*0.35);
  c.revealed = true;
  mid3.add(c);
  cards.remove(x);
  //mid4
  for (int i =0; i<3; i++) {
    x = floor(random(cards.size()));
    c = cards.get(x);
    c.pos.set(width*0.5, height*0.35);
    mid4.add(c);
    cards.remove(x);
  }
  x = floor(random(cards.size()));
  c = cards.get(x);
  c.pos.set(width*0.5, height*0.35);
  c.revealed = true;
  mid4.add(c);
  cards.remove(x);
  //mid5
  for (int i =0; i<4; i++) {
    x = floor(random(cards.size()));
    c = cards.get(x);
    c.pos.set(width*0.6, height*0.35);
    mid5.add(c);
    cards.remove(x);
  }
  x = floor(random(cards.size()));
  c = cards.get(x);
  c.pos.set(width*0.6, height*0.35);
  c.revealed = true;
  mid5.add(c);
  cards.remove(x);
  //mid6
  for (int i =0; i<5; i++) {
    x = floor(random(cards.size()));
    c = cards.get(x);
    c.pos.set(width*0.7, height*0.35);
    mid6.add(c);
    cards.remove(x);
  }
  x = floor(random(cards.size()));
  c = cards.get(x);
  c.pos.set(width*0.7, height*0.35);
  c.revealed = true;
  mid6.add(c);
  cards.remove(x);
  //mid7
  for (int i =0; i<6; i++) {
    x = floor(random(cards.size()));
    c = cards.get(x);
    c.pos.set(width*0.8, height*0.35);
    mid7.add(c);
    cards.remove(x);
  }
  x = floor(random(cards.size()));
  c = cards.get(x);
  c.pos.set(width*0.8, height*0.35);
  c.revealed = true;
  mid7.add(c);
  cards.remove(x);
}

void showallcards() {
  
  //for (card c : cards) {
  //  c.show();
  //}
  for (card c : stacks.get(0).cards) {
    c.show();
  }
  for (int i = 0; i<stack2.size(); i++) {
    card c = stack2.get(i);
    int j = round(i-stack2.size()+3);
    if (j<0) { 
      j = 0;
    }
    c.showstack2(j);
  }
  
  for (card c : goal1) {
    c.show();
  }
  for (card c : goal2) {
    c.show();
  }
  for (card c : goal3) {
    c.show();
  }
  for (card c : goal4) {
    c.show();
  }
  card c;
  for (int i = 0; i< mid1.size();i++) {
    c = mid1.get(i);
    c.showmids(i);
  }
  for (int i = 0; i< mid2.size();i++) {
    c = mid2.get(i);
    c.showmids(i);
  }
  for (int i = 0; i< mid3.size();i++) {
    c = mid3.get(i);
    c.showmids(i);
  }
  for (int i = 0; i< mid4.size();i++) {
    c = mid4.get(i);
    c.showmids(i);
  }
  for (int i = 0; i< mid5.size();i++) {
    c = mid5.get(i);
    c.showmids(i);
  }
  for (int i = 0; i< mid6.size();i++) {
    c = mid6.get(i);
    c.showmids(i);
  }
  for (int i = 0; i< mid7.size();i++) {
    c = mid7.get(i);
    c.showmids(i);
  }
  
}
