void setup() {
  fullScreen();
  imageMode(CENTER);
  loadImages();
  for (int i = 0; i<52;i++) {
    cards.add(new card((i%13)+1, floor(i/13)+1));
  }
  stackinit();
  //randomize();
  strokeWeight(5);
}

void draw() {
  drawTable();
  stroke(0);
  showallcards();
}
