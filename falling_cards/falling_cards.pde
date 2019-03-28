ArrayList<card> cards;
void setup(){
  frameRate(60);
  background(0);
  fullScreen();
  cards = new ArrayList();
  for (int i =0; i <20; i++) {
    cards.add(new card());
  }
  
}

void draw() {
  for (card c: cards) {
    c.show();
    c.update();
  }
  for (int i =0; i<cards.size(); i++) {
    card c = cards.get(i);
    if (c.x < -75/2 || c.x > width+75/2) {
      cards.remove(i);
      cards.add(new card());
    }
  }
}
