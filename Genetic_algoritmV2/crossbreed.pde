void crossbreed() {
  maxScore=0;
  ArrayList<player> pool  = new ArrayList<player>();
  for (player p: players) {
    if(p.score>maxScore){maxScore = p.score;}
    
  }
  for (player p: players) {
    for(int i=0; i<map(p.score,0,maxScore,0,100)*100;i++){
      pool.add(p);
    }
  }
  maxScores.add(maxScore);
  //println(pool.size());
  players = new ArrayList<player>();
  //for (int i=0; i<NoPlayers/4; i++) {
  //  int r1 = int(random(0,pool.size()));
  //  player parent1 = pool.get(r1);
  //  parent1.x=width/2;
  //  parent1.y=height-10;
  //  parent1.finished=false;
  //  players.add(parent1);
  //}
  
  
  for (int i=0; i<NoPlayers; i++) {
    int r1 = int(random(0,pool.size()));
    int r2 = int(random(0,pool.size()));
    player parent1 = pool.get(r1);
    player parent2 = pool.get(r2);
    PVector[] mean = new PVector[maxTime];
    
    for (int j=0; j<maxTime;j++) {
      float rand = random(1);
      if(rand < 0.5) {
        mean[j] = parent1.DNA[j];
      }
      else {
        mean[j] = parent2.DNA[j];
      }
      rand = random(1);
      if(rand < 0.02) {
        mean[j] = PVector.random2D();
        mean[j].mult(5);
      }
    }
    player child = new player(mean);
    players.add(child);
  }
  time=0;
  generation++;
}
