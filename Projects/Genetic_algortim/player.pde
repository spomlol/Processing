class player implements Comparable<player>{
  float x = width/2;
  float y = 1000;
  int vx = 0;
  int vy = 0;
  int[] DNAY;
  int[] DNAX;
  float score;
  boolean finished = false;
  
  player(int[] dnaY, int[] dnaX) {
    this.DNAY= dnaY;
    this.DNAX= dnaX;
  }
  
  
  void show() {
    rect(x, y, w, -w);
  }

  void update() {
    if (finished==false) {
    if (y >= 0+w && y <= 1000) {
      y += vy;
      if (vy <0) {
        vy++;
      } else if (vy >0) {
        vy--;
      }
      
    } else {
      vy = 0; 
      if (y < 0+w) {
        y = 0+w;
      }
      if (y > 1000-w) {
        y = 1000;
      }
    }
    if (x >= 0 && x <= 1000-w) {
      x += vx;
      if (vx <0) {
        vx++;
      } else if (vx >0) {
        vx--;
      }
    } else {
      vx = 0; 
      if (x < 0) {
        x = 0;
      }
      if (x > 1000-w) {
        x = 1000-w;
      }
    }
    if (dist(x,y,posXgoal,posYgoal)<5){
      finished = true;
    }
    }
  }
  float getScore() {
    return score;
  }
  
  
  
  @Override
    public int compareTo(player comparePl) {
        float comparescore=((player)comparePl).getScore();
        /* For Ascending order*/
        return int(this.score-comparescore);

        /* For Descending order do like this */
        //return compareage-this.studentage;
    }
    
  @Override
    public String toString() {
        return "[ Score=" + score + " DNAY=" + DNAY[150] + " ]" ;
    }
}
