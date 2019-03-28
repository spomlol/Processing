ArrayList<PVector> snake = new ArrayList();
PVector food;
int dir = 1;
int size = 40;
void setup() {
  fullScreen();
  snake.add(new PVector(width/(2*size), height/(2*size)));
  frameRate(10);
  food = new PVector();
  food.x = round(random(1, width/size-1));
  food.y = round(random(1, height/size-1));
}

void draw() {
  background(0);
  fill(200, 0, 0);
  stroke(200, 0, 0);
  rect(food.x*size, food.y*size, size, size);
  fill(255);
  stroke(255);
  for (PVector segment : snake) {
    rect(segment.x*size, segment.y*size, size, size);
  }
  if (dir == 1) {
    snake.add(new PVector(snake.get(snake.size()-1).x+1, snake.get(snake.size()-1).y));
  } else if (dir == 2) {
    snake.add(new PVector(snake.get(snake.size()-1).x-1, snake.get(snake.size()-1).y));
  } else if (dir == 3) {
    snake.add(new PVector(snake.get(snake.size()-1).x, snake.get(snake.size()-1).y+1));
  } else if (dir == 4) {
    snake.add(new PVector(snake.get(snake.size()-1).x, snake.get(snake.size()-1).y-1));
  }
  if (snake.get(snake.size()-1).x != food.x || snake.get(snake.size()-1).y != food.y) {
    snake.remove(0);
  } else {
    food.x = round(random(1, width/size-1));
    food.y = round(random(1, height/size-1));
  }
  for (int i = 0; i< snake.size()-2; i++) {
    if (snake.get(i).x == snake.get(snake.size()-1).x && snake.get(i).y == snake.get(snake.size()-1).y) {
      noLoop();
      textAlign(CENTER);
      fill(255);
      textSize(30);
      text("Game Over", width/2, height/2);
    }
  }
  if (snake.get(snake.size()-1).x == -1 || snake.get(snake.size()-1).x == width/size+1 || snake.get(snake.size()-1).y == -1 || snake.get(snake.size()-1).y == height/size) {
    noLoop();
    textAlign(CENTER);
    fill(255);
    textSize(30);
    text("Game Over", width/2, height/2);
  }
}

void keyPressed() {
  if (keyCode == DOWN && dir != 4) {
    dir = 3;
  } else if (keyCode == UP && dir != 3) {
    dir = 4;
  } else if (keyCode == LEFT && dir != 1) {
    dir = 2;
  } else if (keyCode == RIGHT && dir != 2) {
    dir = 1;
  }
}
