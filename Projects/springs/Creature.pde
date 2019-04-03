class creature {
  ArrayList<spring> springs = new ArrayList();
  ArrayList<node> nodes = new ArrayList();
  int index;
  float score;
  boolean kill = false;
  creature(int i) {
    //nodes.add(new node(0, 300));
    //nodes.add(new node(0, 300));
    //nodes.add(new node(0, 300));
    //springs.add(new spring(nodes.get(0), nodes.get(1), random(50, 150), i));
    //springs.add(new spring(nodes.get(1), nodes.get(2), random(50, 150), i));
    //springs.add(new spring(nodes.get(2), nodes.get(0), random(50, 150), i));
    for (int j = 0; j<chromosomes; j++) {
      nodes.add(new node(0, 300));
    }
    for (int j = 0; j<chromosomes; j++) {
      if (j+1==chromosomes) {
        springs.add(new spring(nodes.get(j), nodes.get(0), random(50, 150), i));
      } else {
        springs.add(new spring(nodes.get(j), nodes.get(j+1), random(50, 150), i));
      }
    }
    index=i;
  }
  creature(int i, float[][] DNA, float[] lengths, float[] frictions) {
    for (int j = 0; j<chromosomes; j++) {
      nodes.add(new node(0, 300, frictions[j]));
    }
    for (int j = 0; j<chromosomes; j++) {
      if (j+1==chromosomes) {
        springs.add(new spring(nodes.get(j), nodes.get(0), lengths[j], DNA[j]));
      } else {
        springs.add(new spring(nodes.get(j), nodes.get(j+1), lengths[j], DNA[j]));
      }
    }
    //nodes.add(new node(0,300, frictions[0]));
    //nodes.add(new node(0,300, frictions[1]));
    //nodes.add(new node(0,300, frictions[2]));
    //springs.add(new spring(nodes.get(0),nodes.get(1),lengths[0], DNA[0]));
    //springs.add(new spring(nodes.get(1),nodes.get(2),lengths[1], DNA[1]));
    //springs.add(new spring(nodes.get(2),nodes.get(0),lengths[2], DNA[2]));
    index=i;
  }
  creature() {
  }
  void show() {
    for (spring s : springs) {
      s.show();
    }
    for (node n : nodes) {
      n.show();
    }
  }
  void update() {
    float xsum=0;
    float ysum=0;
    for (node n : nodes) {
      n.update();
      xsum += n.pos.x;
      ysum += n.pos.y;
    }
    for (spring s : springs) {
      s.update();
    }
    xsum/=chromosomes;
    score = xsum;
    if (xsum > bestX) {
      bestX=xsum;
      bestcreature = this;
    }
    if (xsum < worstX) {
      worstX=xsum;
    }
    if (ysum == chromosomes*20) {
      score -= 1000;
      kill = true;
    }
  }
}
