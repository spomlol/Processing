void drawfood() {
  fill(100);
  rect(0, 0, width, height);
  fill(200, 0, 0);
  stroke(0, 0, 0);
  //rect(food.x*size, food.y*size, size, size);
  for (PVector food : foods) {
    pushMatrix();
    translate(food.x*size + size/2, food.y*size + size/2, size/2);
    box(size, size, size);
    popMatrix();
  }
}
