Table table;
int in;
int hidden = 5;
int hn = 10;
int out = 3;
import java.util.*;
ArrayList<connection> connections = new ArrayList();
ArrayList<node> nodes = new ArrayList();

void setup() {
  table = loadTable("emotions.csv", "header");
  //in = table.getColumnCount();
  in=5;
  size(1000, 1000);

  
  for (int i=0; i< in; i++) {
    nodes.add(new node(5, (i+0.5)*(height/in),0));
  }
  for (int i=0; i< hidden; i++) {
    for (int j=0; j< hn; j++) {
      nodes.add(new node((i+1)*(width/(hidden+1)), (j+0.5)*(height/hn),i+1));
    }
  }
  for (int i=0; i< out; i++) {
    nodes.add(new node(width-5, (i+0.5)*(height/out),1+hidden));
  }
  for (node n1: nodes) {
    for (node n2: nodes) {
      if(n1.layer+1 == n2.layer) {
        connections.add(new connection(n1,n2));
      }
    }
  }
  
  noLoop();
}

void draw() {
  for (connection c: connections) {
    c.show();
  }
  strokeWeight(1);
  for (node n: nodes) {
    n.show();
  }
  
}
