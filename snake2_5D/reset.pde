void reset(boolean ai1, boolean ai2) {
  snakes.clear();
  foods.clear();
  //snake.add(new PVector(width/(2*size), height/(2*size)));
  if (multi==false) {
    snakes.add(new snake(ai1));
  }
  else {
    snakes.add(new snake(1,1,1,color(0,200,0),ai1,1));
    snakes.add(new snake(width/(size)-2,height/(size)-2,2,color(0,0,200),ai2,2));
  }
  for (int i = 0; i < noFoods; i++) {
    foods.add(new PVector(round(random(1, width/size-1)),round(random(1, height/size-1))));
  }
  death = false;
  snakes.get(0).click = false;
  //dir = 1;
  speed = 16.0;
  speedup=0;
}
