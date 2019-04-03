class node{
PVector pos = new PVector();
float bias=random(0,1);
color c;
int layer;
  node(float x, float y, int Layer) {
    pos.set(x,y);
    c = color(bias*255);
    layer = Layer;
  }
  
  void show() {
    
    fill(c);
    circle(pos.x,pos.y,50);
  }
}
