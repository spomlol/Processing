class connection {
  node n1;
  node n2;
  float w;
  float ws;
  connection(node N1, node N2) {
    n1 = N1;
    n2 = N2;
    w = random(0,1);
    ws = 3*w;
  }
  void show() {
    strokeWeight(ws);
    line(n1.pos.x,n1.pos.y,n2.pos.x,n2.pos.y);
  }
  
}
