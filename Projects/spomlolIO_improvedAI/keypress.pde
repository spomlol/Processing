void keyPressed() {
  if (keyCode == UP) {
    p.acc.y = -0.1;
  }
  if (keyCode == DOWN) {
    p.acc.y = 0.1;
  }
  if (keyCode == LEFT) {
    p.acc.x = -0.1;
  }
  if (keyCode == RIGHT) {
    p.acc.x = 0.1;
  }
}
void keyReleased() {
  if (keyCode == UP || keyCode == DOWN) {
    p.acc.y = 0;
  }
  if (keyCode == LEFT|| keyCode == RIGHT) {
    p.acc.x = 0;
  }
}
