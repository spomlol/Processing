void newGen() {
player bestp = new player(null,null);
  bestp.score=10000;
  for (int i=0; i < players.size() ;i++){
    player p = players.get(i);
    p.score = dist(p.x,p.y,posXgoal,posYgoal);
    if (p.score < bestp.score) 
      {bestp = p;}
  }
  Collections.sort(players);
  println(players);
  ArrayList<player> pool;
  pool = new ArrayList<player>();
  for (player p: players) {
   float n = 100/p.score;
     for (int i=0; i<n;i++) {
       pool.add(p);
     }
  }
  ArrayList<player>newplayer;
  newplayer = new ArrayList<player>();
  for (int i=0; i<100;i++) {
    int index1 = floor(random(0,pool.size()));
    int index2 = floor(random(0,pool.size()));
    player child = crossoverX(pool.get(index1),pool.get(index2));
    child.finished=false;
    newplayer.add(child);
  }
  
  players = newplayer;
  
  for (player p: players) {
    p.x=width/2;
    p.y=1000;
  }
  iter=0;
}

player crossoverX(player a,player b) {
    int[] newDNAX = new int[iter];
    for (int i=0; i<a.DNAX.length; i++){
      float rand = random(1);
      if (rand < 0.5){
        newDNAX[i] = a.DNAX[i];
      }else {
        newDNAX[i] = b.DNAX[i];
      }
      float randmutate = random(1);
      if (randmutate < 0.01) {
        newDNAX[i] = floor(random(0,4));
      }
    }
    a.DNAX = newDNAX;
    return a;
  }
  player crossoverY(player a,player b) {
    int[] newDNAY = new int[iter];
    for (int i=0; i<a.DNAY.length; i++){
      float rand = random(1);
      if (rand < 0.5){
        newDNAY[i] = a.DNAY[i];
      }else {
        newDNAY[i] = b.DNAY[i];
      }
      float randmutate = random(1);
      if (randmutate < 0.01) {
        newDNAY[i] = floor(random(0,4));
      }
    }
    
    a.DNAY = newDNAY;
    a.finished = false;
    return a;
  }
