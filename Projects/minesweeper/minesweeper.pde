int size;
int mines;
int flagCount;
int[][] board;
boolean[][] reveal;
boolean[][] flag;
boolean GO;
int hidden;
int textsize;
boolean play;
int select, select2;
boolean custom;
int custmines=10;
int custsize=10;
void setup() {
  size(800, 1000);
  play = false;
  select2 = 0;
  custom = false;
}

void draw() {
  background(175);
  textMode(RIGHT);
  textSize(20);
  stroke(50);
  fill(50);
  text("Made by SpOmLoL", 700, 970);
  stroke(0);
  fill(0);
  if (play) {

    int space = 800/size;
    stroke(50);
    fill(125);
    for (int i = 0; i<size; i++) {
      for (int j = 0; j<size; j++) {
        if (reveal[i][j]==true) {
          if (board[i][j] == -1) {
            stroke(50);
            fill(200);
            rect(space*i, space*j, space, space);
            fill(0);
            ellipse(space*i+space/2, space*j+space/2, space, space);
          } else if (board[i][j] != 0) {
            fill(0);
            circle(space*i+space/2, space*j+space/2, space);
            stroke(50);
            fill(200);
            rect(space*i, space*j, space, space);
            fill(0);
            textSize(textsize);
            switch (board[i][j]) {
            case 1:
              fill(0, 0, 200);
              break;
            case 2:
              fill(0, 200, 0);
              break;
            case 3:
              fill(200, 0, 0);
              break;
            case 4:
              fill(128, 0, 128);
              break;
            case 5:
              fill(128, 0, 0);
              break;
            case 6:
              fill(64, 224, 208);
              break;
            case 7:
              fill(0, 0, 0);
              break;
            case 8:
              fill(100, 100, 100);
              break;
            }
            text(board[i][j], space*i+space/2, space*j+space/2);
          } else {
            stroke(50);
            fill(200);
            rect(space*i, space*j, space, space);
          }
        } else if (flag[i][j] == true) {
          stroke(50);
          fill(200);
          rect(space*i, space*j, space, space);
          fill(200, 0, 0);
          triangle(space*i, space*j, space*i, space*j+space, space*i+space, space*j+space/2);
        } else {
          stroke(50);
          fill(125);
          rect(space*i, space*j, space, space);
        }
      }
    }
    fill(0);
    if (GO == false && hidden>mines) {
      textAlign(LEFT, CENTER);
      textSize(30);
      text("Mines: "+mines, 20, 820);
      text("Flags: "+flagCount, 20, 850);
      text("Squares remaining: "+hidden, 20, 880);
      text("Squares revealed: "+((size*size)-hidden), 20, 910);
      text("Reveals needed before winning: "+(hidden-mines), 20, 940);

      textAlign(CENTER, CENTER);
    } else if (GO) {
      textSize(80);
      text("Game Over", 400, 900);
      textSize(textsize);
    } else {
      textSize(80);
      text("Victory! You win!", 400, 900);
      textSize(textsize);
    }
  } else if (custom) {
    stroke(0);
    textSize(50);
    if (select2 == 0) { 
      fill(200, 0, 0);
    } else {
      fill(0);
    }
    text("Size: "+custsize, 400, 330);
    if (select2 == 1) { 
      fill(200, 0, 0);
    } else {
      fill(0);
    }
    text("Mines: "+custmines, 400, 530);
    if (select2 == 2) { 
      fill(200, 0, 0);
    } else {
      fill(0);
    }
    text("Return", 400, 730);
    line(100, 400, 700, 400);
    line(100, 600, 700, 600);
    fill(200, 0, 0);
    rectMode(CENTER);
    rect(map(custsize, 10, 100, 100, 700), 400, 20, 50);
    rect(map(custmines, 10, constrain(custsize*custsize, 100, 400), 100, 700), 600, 20, 50);
    rectMode(CORNER);
  } else {
    textAlign(CENTER, CENTER);
    textSize(30);
    text("Press ENTER to make a selection",400,100);
    textSize(80);
    if (select == 0) { 
      fill(200, 0, 0);
    } else {
      fill(0);
    }
    text("Easy", 400, 200);
    if (select == 1) { 
      fill(200, 0, 0);
    } else {
      fill(0);
    }
    text("Medium", 400, 400);
    if (select == 2) { 
      fill(200, 0, 0);
    } else {
      fill(0);
    }
    text("Hard", 400, 600);
    if (select == 3) { 
      fill(200, 0, 0);
    } else {
      fill(0);
    }
    text("Custom", 400, 800);
    textSize(30);
    fill(0);
    text("10*10/10 mines", 400, 280);
    text("20*20/60 mines", 400, 480);
    text("50*50/400 mines", 400, 680);
    text("Create a custom game", 400, 880);
  }
}

void mousePressed() {
  if (play) {
    if (!GO && mouseY<800 && hidden > mines) {
      reveal(floor(mouseX/(800/size)), floor(mouseY/(800/size)));
    } else {
      setup();
    }
  }
}

void keyPressed() {
  if (!play) {
    if (!custom) {
      if (keyCode == UP) {
        select --;
      } else if (keyCode == DOWN) {
        select ++;
      }
      select = constrain(select, 0, 3);
      if (keyCode == ENTER && select != 3) {
        play = true;
        newGame();
      } else if (keyCode == ENTER && select == 3) {
        custom = true;
      }
    } else if (custom == true) {
      if (keyCode == ENTER) {
        if (select2 == 2) {
          custom=false;
        } else {
          play = true;
          newGame();
          custom=false;
        }
      } else {
        if (keyCode == UP) {
          select2 --;
        } else if (keyCode == DOWN) {
          select2 ++;
        }
        select2 = constrain(select2, 0, 2);
        if (keyCode == LEFT && select2 ==0) {
          int i = custsize-1;
          while (800%i !=0) {
            i--;
          }
          custsize =i;
        } else if (keyCode == RIGHT && select2 ==0) {
          int i = custsize+1;
          while (800%i !=0) {
            i++;
          }
          custsize =i;
        } else if (keyCode == LEFT && select2 ==1) {
          custmines --;
        } else if (keyCode == RIGHT && select2 ==1) {
          custmines ++;
        }
        custsize = constrain(custsize, 10, 100);
        custmines = constrain(custmines, 10, constrain(custsize*custsize, 100, 400));
      }
    }
  }
}

void reveal(int x, int y) {
  if (reveal[x][y] == false && flag[x][y]==false) {
    if (mouseButton==RIGHT) {
      flag[x][y]=true;
      flagCount++;
    } else {
      reveal[x][y]= true;
      hidden--;
      if (board[x][y] == 0) {
        for (int i = x-1; i<=x+1; i++) {
          for (int j = y-1; j<=y+1; j++) {
            if (i>=0 && i<size && j >=0 && j<size) {
              reveal(i, j);
            }
          }
        }
      } else if (board[x][y] == -1) {
        GO = true;
      }
    }
  } else if (flag[x][y]==true && mouseButton==RIGHT) {
    flag[x][y]=false;
    flagCount--;
  }
}

void newGame() {
  textAlign(CENTER, CENTER);
  GO = false;
  if (select == 0) {
    textsize = 45;
    size = 10;
    mines = 10;
  } else if (select == 1) {
    textsize = 30;
    size = 20;
    mines = 60;
  } else if (select == 2) {
    textsize = 15;
    size = 50;
    mines = 400;
  } else {
    size = custsize;
    mines = custmines;
    textsize = int(map(float(custsize), 10, 100, 45, 10));
  }
  flagCount = 0;
  textSize(textsize);
  hidden = size*size;
  int minesplaced=0;
  board = new int[size][size];
  reveal = new boolean[size][size];
  flag = new boolean[size][size];
  for (int i = 0; i<size; i++) {
    for (int j = 0; j<size; j++) {
      board[i][j] =0;
      reveal[i][j]=false;
      flag[i][j]=false;
    }
  }

  while (minesplaced < mines) {
    int x = floor(random(0, size));
    int y = floor(random(0, size));
    if (board[x][y] != -1) {
      minesplaced ++;
      board[x][y] = -1;
    }
  }
  for (int i = 0; i<size; i++) {
    for (int j = 0; j<size; j++) {
      if (board[i][j] != -1) {
        int sum = 0;
        if (i!=0) {
          if (board[i-1][j] == -1) {
            sum ++;
          }
          if (j!=0) {
            if (board[i-1][j-1] == -1) {
              sum ++;
            }
          }
          if (j!=size-1) {
            if (board[i-1][j+1] == -1) {
              sum ++;
            }
          }
        }
        if (i!=size-1) {
          if (board[i+1][j] == -1) {
            sum ++;
          }
          if (j!=0) {
            if (board[i+1][j-1] == -1) {
              sum ++;
            }
          }
          if (j!=size-1) {
            if (board[i+1][j+1] == -1) {
              sum ++;
            }
          }
        }
        if (j!=0) {
          if (board[i][j-1] == -1) {
            sum ++;
          }
        }
        if (j!=size-1) {
          if (board[i][j+1] == -1) {
            sum ++;
          }
        }
        board[i][j] = sum;
      }
    }
  }
}
